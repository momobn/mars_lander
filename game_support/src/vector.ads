with Display.Basic; use Display.Basic;

package Vector is
   
   function "+" (Left, Right : Point_3d) return Point_3d;
   
   function "*" (Left, Right: Point_3d) return Point_3d;
   
   function From_Angle (Angle : Float) return Point_3d;
   
end Vector;
