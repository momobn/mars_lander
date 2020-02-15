with Display;       use Display;
with Display.Basic; use Display.Basic;

package Mars_Lander is

   type Lander_Type is private;
   protected protected_lander is 
      entry Step (lander: in out Lander_Type; key: in Key_T);
      procedure Draw (lander: in out Lander_Type; canvas: Canvas_ID);
      entry User_Input (pressed_key: in out Key_T);
   end protected_lander;
   procedure Init (lander: in out Lander_Type; speed_x: Float; speed_y: Float);
   
private
   
   type Lander_Type is record
      Direction: Float range -180.0 .. 180.0 := 0.0;
      Position: Point_3d := (20.0, 300.0, 0.0);
      Speed: Point_3d;
      Acceleration: Point_3d := (0.0, 0.0, 0.0);
      Gravity: Point_3d := (0.0, -3.5, 0.0);
      stopped: Boolean := False;
      crushed: Boolean := False;
   end record;
   
end Mars_Lander;
