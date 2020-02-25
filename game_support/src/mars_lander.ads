with Display;       use Display;
with Display.Basic; use Display.Basic;

package Mars_Lander is

   type Lander_Type is private;
   
   Buffer_Pos : Point_3d;
   Buffer_Acc : Point_3d;
   Buffer_Dir : Float;
   
   protected protected_lander is 
      entry Step (lander : in out Lander_Type; key : in Key_T);
      procedure Draw (lander : in out Lander_Type; canvas : Canvas_ID);
      entry User_Input (pressed_key : in out Key_T);
      function Get_Is_Put return Boolean;
      function Get_AI_Controlled return Boolean;
      procedure Set_Is_Put (Is_Put : Boolean);
      procedure Set_AI_Controlled (AI_Controlled : Boolean);
      procedure Enter_Manual_Mode (Manual_Mode_Entered : out Boolean);
      
   private
      Is_Put : Boolean := False;
      AI_Controlled : Boolean := False;
      Manual_Mode : Boolean := False;
      
   end protected_lander;
   procedure Init (lander: in out Lander_Type; speed_x: Float; speed_y: Float);
   
private
   
   type Lander_Type is record
      Direction: Float := 0.0;
      Position: Point_3d := (0.0, 300.0, 0.0);
      Speed: Point_3d;
      Acceleration: Point_3d := (0.0, 0.0, 0.0);
      Gravity: Point_3d := (0.0, -2.8, 0.0);
      stopped: Boolean := False;
      crushed: Boolean := False;
   end record;
   
end Mars_Lander;
