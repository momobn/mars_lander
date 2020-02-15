with Display.Basic; use Display.Basic;

package Terrain is

   Size : constant Natural := 100;
   Surface_Width : constant Natural := 9; -- the width of landing surface
   Surface_Index : Natural; -- index for which the surface begins
   Game_Window_Width: Natural;
   type Terrain_Type is array (1 .. Size) of Point_3d;
   
   protected Terrain_Object is
      procedure Generate 
        (window_width: Natural; Game_Window_Width: out Natural ; Surface_Index: out Natural);
      entry Get_Terrain (Mars_Terrain: out Terrain_Type);
      procedure Get_Surface (Surface_Begin_Point: out Point_3d);
      procedure Draw_Terrain (canvas: Canvas_ID);
   private
      My_Terrain : Terrain_Type;
   end Terrain_Object;

end Terrain;
