with Ada.Numerics.Discrete_Random;
with Ada.Text_IO; use Ada.Text_IO;

with Perlin; use Perlin;
with Display; use Display;

package body Terrain is
   
   Is_Generated : Boolean := False; -- barrier
   
   protected body Terrain_Object is
      
      procedure Generate 
        (window_width: Natural; Game_Window_Width: out Natural ; Surface_Index: out Natural) is
         subtype my_index is Natural range 1 .. Size - Surface_width;
         package Random_value is new Ada.Numerics.Discrete_Random (my_index);
         use Random_value;
         G : Generator;
         x_value : Float := Float(window_width) / (-2.0);
         inc : Float := 0.0;
         r_value : Natural;
         
      begin
         Game_Window_Width := window_width;
         for I in 1 .. Size loop
            My_Terrain(I) := 
              (x_value, (Noise(X => inc / 1500.0) * 10.0 - 5.0) * 50.0 - 90.0, 1.0);
            x_value := x_value + (Float(window_width) / Float(Size));
            inc := inc + Float(Random_value.Random(G) + Random_value.Random(G));
            -- Put_Line("terrain_pt: [" & I'Image & "](" & My_Terrain(I).X'Image & ", " & My_Terrain(I).Y'Image & " )");
         end loop;
         
         -- generate a surface to land
          Random_value.Reset(G);
          r_value := Random_value.Random(G);
          Surface_Index := r_value;
         --r_value := 42;
         --Surface_Index := r_value;
         
         My_Terrain(r_value).Z := 2.0;
         for I in 1 .. Surface_width loop
            My_Terrain(r_value + I).Y := My_Terrain(r_value).Y;
            My_Terrain(r_value + I).Z := 2.0;
         end loop;
         
         -- unlock
         Is_Generated := True;
         
      end Generate;
      
      entry Get_Terrain (Mars_Terrain: out Terrain_Type) when Is_Generated is
      begin
         Mars_Terrain := My_Terrain;
      end Get_Terrain;
      
      procedure Draw_Terrain (canvas: Canvas_ID) is
      begin
         -- color the landing surface in green
         for J in Surface_Index .. Surface_Index + Surface_Width - 1 loop
            Draw_Line(Canvas => canvas,
                   P1     => My_Terrain(J),
                   P2     => My_Terrain(J + 1),
                   Color  => Green);
         end loop;
         
         -- color Mars suface in red
         for I in 1 .. Size - 1 loop
            Draw_Line(Canvas => canvas,
                   P1     => My_Terrain(I),
                   P2     => My_Terrain(I + 1),
                   Color  => Red);
         end loop;
         
      end Draw_Terrain;
      
      procedure Get_Surface (Surface_Begin_Point: out Point_3d) is
      begin
         Surface_Begin_Point := My_Terrain(Surface_Index);
      end Get_Surface;
      
   end Terrain_Object;

end Terrain;
