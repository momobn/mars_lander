with Ada.Numerics; use Ada.Numerics;

with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;

package body Vector is
   
   function "+" (Left, Right : Point_3d) return Point_3d is
      vec: Point_3d;
   begin
      vec.X := Left.X + Right.X;
      vec.Y := Left.Y + Right.Y;
      vec.Z := Left.Z + Right.Z;
      return vec;
   end "+";
   
   function "*" (Left, Right : Point_3d) return Point_3d is
      vec: Point_3d;
   begin
      vec.X := Left.X * Right.X;
      vec.Y := Left.Y * Right.Y;
      vec.Z := Left.Z * Right.Z;
      return vec;
   end "*";
   
   function From_Angle (Angle : Float) return Point_3d is
      vec: Point_3d;
   begin
      vec.X := - Sin (Angle * Pi / 180.0);
      vec.Y := Cos (Angle * Pi / 180.0);
      vec.Z := 0.0;
      return vec;
   end From_Angle;
   
end Vector;
