with Display.Basic; use Display.Basic;

package Collision is
   --  Line to line collision detection
   function Line_Line (A1, A2, B1, B2 : Point_3d) return Boolean;
   
   --  Line to rectangle collision detection using line to line one
   function Line_Rectangle (A, B, C, D, E1, E2 : Point_3d) return Boolean;
end Collision;
