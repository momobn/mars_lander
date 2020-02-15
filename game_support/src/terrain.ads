with Display.Basic; use Display.Basic;

package Terrain is

   Size : constant Natural := 100;
   Surface_width : constant Natural := 9; -- the width of landing surface
   type Terrain_Type is array (1 .. Size) of Point_3d;
   
   protected Terrain_Object is
      procedure Generate(window_width: Natural);
      entry Get_Terrain (canvas: Canvas_ID);
   private
      My_Terrain : Terrain_Type;
   end Terrain_Object;

end Terrain;
