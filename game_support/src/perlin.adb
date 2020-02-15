with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.Numerics.Discrete_Random;
with Interfaces; use Interfaces;

with Ada.Text_IO; use Ada.Text_IO;

package body Perlin is

   type Perm_Array is array (Unsigned_32 range <>) of Unsigned_32;

   Const_Perm : constant Perm_Array :=
     (151, 160, 137, 91, 90, 15, 131, 13, 201, 95, 96, 53, 194, 233, 7, 225,
      140, 36, 103, 30, 69, 142, 8, 99, 37, 240, 21, 10, 23, 190, 6, 148, 247,
      120, 234, 75, 0, 26, 197, 62, 94, 252, 219, 203, 117, 35, 11, 32, 57,
      177, 33, 88, 237, 149, 56, 87, 174, 20, 125, 136, 171, 168, 68, 175, 74,
      165, 71, 134, 139, 48, 27, 166, 77, 146, 158, 231, 83, 111, 229, 122, 60,
      211, 133, 230, 220, 105, 92, 41, 55, 46, 245, 40, 244, 102, 143, 54, 65,
      25, 63, 161, 1, 216, 80, 73, 209, 76, 132, 187, 208, 89, 18, 169, 200,
      196, 135, 130, 116, 188, 159, 86, 164, 100, 109, 198, 173, 186, 3, 64, 52,
      217, 226, 250, 124, 123, 5, 202, 38, 147, 118, 126, 255, 82, 85, 212, 207,
      206, 59, 227, 47, 16, 58, 17, 182, 189, 28, 42, 223, 183, 170, 213, 119,
      248, 152, 2, 44, 154, 163, 70, 221, 153, 101, 155, 167, 43, 172, 9, 129,
      22, 39, 253, 19, 98, 108, 110, 79, 113, 224, 232, 178, 185, 112, 104, 218,
      246, 97, 228, 251, 34, 242, 193, 238, 210, 144, 12, 191, 179, 162, 241,
      81, 51, 145, 235, 249, 14, 239, 107, 49, 192, 214, 31, 181, 199, 106, 157,
      184, 84, 204, 176, 115, 121, 50, 45, 127, 4, 150, 254, 138, 236, 205, 93,
      222, 114, 67, 29, 24, 72, 243, 141, 128, 195, 78, 66, 215, 61, 156, 180,
      151, 160, 137, 91, 90, 15, 131, 13, 201, 95, 96, 53, 194, 233, 7, 225,
      140, 36, 103, 30, 69, 142, 8, 99, 37, 240, 21, 10, 23, 190, 6, 148, 247,
      120, 234, 75, 0, 26, 197, 62, 94, 252, 219, 203, 117, 35, 11, 32, 57,
      177, 33, 88, 237, 149, 56, 87, 174, 20, 125, 136, 171, 168, 68, 175, 74,
      165, 71, 134, 139, 48, 27, 166, 77, 146, 158, 231, 83, 111, 229, 122, 60,
      211, 133, 230, 220, 105, 92, 41, 55, 46, 245, 40, 244, 102, 143, 54, 65,
      25, 63, 161, 1, 216, 80, 73, 209, 76, 132, 187, 208, 89, 18, 169, 200,
      196, 135, 130, 116, 188, 159, 86, 164, 100, 109, 198, 173, 186, 3, 64, 52,
      217, 226, 250, 124, 123, 5, 202, 38, 147, 118, 126, 255, 82, 85, 212, 207,
      206, 59, 227, 47, 16, 58, 17, 182, 189, 28, 42, 223, 183, 170, 213, 119,
      248, 152, 2, 44, 154, 163, 70, 221, 153, 101, 155, 167, 43, 172, 9, 129,
      22, 39, 253, 19, 98, 108, 110, 79, 113, 224, 232, 178, 185, 112, 104, 218,
      246, 97, 228, 251, 34, 242, 193, 238, 210, 144, 12, 191, 179, 162, 241,
      81, 51, 145, 235, 249, 14, 239, 107, 49, 192, 214, 31, 181, 199, 106, 157,
      184, 84, 204, 176, 115, 121, 50, 45, 127, 4, 150, 254, 138, 236, 205, 93,
      222, 114, 67, 29, 24, 72, 243, 141, 128, 195, 78, 66, 215, 61, 156, 180);

   Perm : Perm_Array := Const_Perm;

   function Lerp (T : Float; A, B : Float) return Float is
   begin
      return A + T * (B - A);
   end Lerp;

   function Grad (Hash : Unsigned_32; X : Float) return Float is
      H : Unsigned_32 := Hash and 15;
      Grad : Float := 1.0 + Float (H and 7);
   begin
      if (H and 8) > 0 then
         Grad := -Grad;
      end if;

      return Grad * X;
   end Grad;

   function Fade (T : Float) return Float is
   begin
      return T * T * T * (T * (T * 6.0 - 15.0) + 10.0);
   end Fade;

   procedure Reset (Seed : Integer) is
      package Discrete_Random is new
        Ada.Numerics.Discrete_Random (Result_Subtype => Unsigned_32);
      use Discrete_Random;
      K : Unsigned_32;
      G : Generator;
      T : Unsigned_32;
   begin
      Reset (G, Seed);

      Perm := Const_Perm;

      for I in reverse Perm'Range loop
         declare
            subtype Int_First_I is Unsigned_32 range Perm'First .. I;
            package Int_First_I_Random is new
              Ada.Numerics.Discrete_Random (Result_Subtype => Int_First_I);

            Int_First_I_Gen : Int_First_I_Random.Generator;
         begin
            Int_First_I_Random.Reset (Int_First_I_Gen, Seed);
            K := Int_First_I_Random.Random (Int_First_I_Gen);
         end;

         T := Perm (I);
         Perm (I) := Perm (K);
         Perm (K) := T;
      end loop;
   end Reset;

   function Noise (X : Float) return Float is
      Ix0, Ix1 : Unsigned_32;
      Fx0, Fx1 : Float;
      S, N0, N1 : Float;
   begin
      Ix0 := Unsigned_32 (Float'Floor (X));
      Fx0 := X - Float (Ix0);
      Fx1 := Fx0 - 1.0;
      Ix1 := Unsigned_32 (Ix0 + 1) and 16#FF#;
      Ix0 := Ix0 and 16#FF#;

      S := Fade (Fx0);

      N0 := Grad (Perm (Ix0), Fx0);
      N1 := Grad (Perm (Ix1), Fx1);

      return (0.188 * Lerp (s, N0, N1) + 1.0) * 0.5;
   end Noise;
end Perlin;
