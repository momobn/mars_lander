with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;

with Display;       use Display;
with Display.Basic; use Display.Basic;
with Mars_Lander;   use Mars_Lander;
with Terrain;       use Terrain;


procedure Main is
   --  declare a variable Next of type Time to store the Next step time
   Next : Time;

   --  declare a constant Period of 40 milliseconds of type Time_Span defining
   --  the loop period
   Period : constant Time_Span := Milliseconds (10);

   --  reference to the application window
   Window : Window_ID;

   --  reference to the graphical canvas associated with the application window
   Canvas : Canvas_ID;

   Width : constant := 800;
   Height : constant := 800;

   -- our Mars Lander
   Mars_Lander : Lander_Type;

   -- detect keys
   Key: Key_T;

begin

   Window :=
     Create_Window (Width, Height, "Mars Lander");

   --  Retrieve the graphical canvas from the window
   Canvas := Get_Canvas (Window);

   --  initialize the Next step time begin the current time (Clock) + the period
   Next := Clock + Period;

   -- initialize the lander
   Init(lander  => Mars_Lander,
        speed_x => 1.0,
        speed_y => 6.0);

   -- generate and draw terrain
   Terrain_Object.Generate(window_width => Width);

   -- game loop
   while not Is_Killed loop

      -- reinitialize the key
      Key := SDLK_UNKNOWN;

      -- draw the lander
      protected_lander.Draw(lander => Mars_Lander,
                            canvas => Canvas);

      Terrain_Object.Get_Terrain(canvas => Canvas);

      -- define the pressed key
      protected_lander.User_Input(pressed_key => Key);

      --Put_Line(Key'Image);

      -- change lander parameters
      protected_lander.Step(lander => Mars_Lander,
                            key   => Key);

      --  update the screen using procedure Swap_Buffers
      Swap_Buffers (Window);

      -- wait until Next
      delay until Next;

      --  update the Next time adding the period for the next step
      Next := Next + Period;

   end loop;
end Main;
