package body Collision is

   --  Line to line collision detection
   function Line_Line (A1, A2, B1, B2 : Point_3d) return Boolean is
      UA : Float :=
        ((B2.X - B1.X) * (A1.Y - B1.Y) - (B2.Y - B1.Y) * (A1.X - B1.X))
          / ((B2.Y - B1.Y) * (A2.X - A1.X) - (B2.X - B1.X) * (A2.Y - A1.Y));
      UB : Float :=
        ((A2.X - A1.X) * (A1.Y - B1.Y) - (A2.Y - A1.Y) * (A1.X - B1.X))
          / ((B2.Y - B1.Y) * (A2.X - A1.X) - (B2.X - B1.X) * (A2.Y - A1.Y));
   begin
      return (UA in 0.0 .. 1.0 and then UB in 0.0 .. 1.0);
   end Line_Line;

   --  Line to rectangle collision detection using line to line one
   function Line_Rectangle (A, B, C, D, E1, E2 : Point_3d) return Boolean is
   begin
      return
        (Line_Line (A, B, E1, E2)
         or else Line_Line (B, C, E1, E2)
         or else Line_Line (C, D, E1, E2)
         or else Line_Line (D, A, E1, E2));
   end Line_Rectangle;

end Collision;
