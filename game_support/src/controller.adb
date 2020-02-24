with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use  Ada.Numerics.Elementary_Functions;

with Terrain; use Terrain;
with Display.Basic; use Display.Basic;
with Display; use Display;
with Vector; use Vector;
with Background; use Background;
with Mars_Lander; use Mars_Lander;

package body Controller is
   
   task body AI_Task is
      -- declare a variable Next of type Time to store the Next step time
      Next : Time := Clock;
      
      -- declare a constant Period of 10 milliseconds of type Time_Span
      -- defining the loop period
      Period : constant Time_Span := Milliseconds (10);
      
      User_has_input : Boolean := False;
      
      surface_start : Point_3d;
      surface_offset : constant Point_3d := 
        (60.0, 0.0, 0.0);
      buff_pt : Point_3d;
      surface_end : Point_3d;
      
      difference : Float;
      
      -- our Mars Lander
      Mars_Lander : Lander_Type;

      -- detect keys
      Key: Key_T;
      
      --  reference to the application window
      Window : Window_ID;
      
      --  reference to the graphical canvas associated with the application window
      Canvas : Canvas_ID;
      
      
      Width : constant := 1000;
      Height : constant := 720;
      
      counter : Natural:= 0;
      
      buf_div : Float;
      
   begin
      accept Start do
         Window :=
           Create_Window (Width, Height, "Mars Lander");

         --  Retrieve the graphical canvas from the window
         Canvas := Get_Canvas (Window);
         
         
         -- generate and draw terrain
         Terrain_Object.Generate(window_width      => Width,
                                 Game_Window_Width => Game_Window_Width,
                                 Surface_Index     => Surface_Index);
         
         -- get the starting and ending points of surface
         Terrain_Object.Get_Surface(Surface_Begin_Point => surface_start);
         surface_end := surface_start + surface_offset;
         protected_lander.Set_AI_Controlled(AI_Controlled => True);
         
         -- initialize the lander
         Init(lander  => Mars_Lander,
              speed_x => 1.0,
              speed_y => 6.0);
         
         loop
            -- reinitialize the key
            Key := SDLK_UNKNOWN;

            -- draw terrain
            Terrain_Object.Draw_Terrain(canvas => Canvas);

            -- draw background
            Draw_Background(canvas => Canvas);

            -- draw the lander
            protected_lander.Draw(lander => Mars_Lander,
                                  canvas => Canvas);

            -- define the pressed key
            User_has_input := protected_lander.Get_Is_Put;
            if User_has_input then 
               protected_lander.User_Input(pressed_key => Key);
            end if;
      
            -- Write your AI here.
            Put_Line("lander pos" & Buffer_Pos.X'Image);
            Put_Line("lander acc" & Buffer_Acc.Y'Image);
            Put_Line("lander dir" & Buffer_Dir'Image);
            
            difference := 
              Sqrt((surface_start.X + surface_offset.X / 2.0 - Buffer_Pos.X) ** 2
                   + (surface_start.Y - Buffer_Pos.Y) ** 2);
            Put_Line("Difference between:" & difference'Image);
               
            
            if counter mod 2 /= 0 then
               
               if surface_end.X <= (Buffer_Pos.X + 20.0)
                 or else surface_end.X <= (Buffer_Pos.X - 20.0)
               then
                  Key := SDLK_LEFT;
               end if;
            
               if surface_start.X >= (Buffer_Pos.X - 20.0)
                 or else surface_start.X >= (Buffer_Pos.X + 20.0)
               then
                  Key := SDLK_RIGHT;
               end if;
            
               --if surface_start.X <= (Buffer_Pos.X - 20.0)
               --  and then surface_end.X >= (Buffer_Pos.X + 20.0)
               if difference > 0.0 then
                  buf_div := Buffer_Pos.Y / difference;
                  if buf_div >= -1.0 and then buf_div <= 1.0 then
                     Put_Line("Arccos(buf_div): " & Arccos(buf_div)'Image);
                     if Buffer_Dir <= -5.0 
                       and then (Arccos(buf_div) < 2.0 and then Arccos(buf_div) > 0.5) then
                        Key := SDLK_LEFT;
                     elsif Buffer_Dir >= 5.0 
                       and then(Arccos(buf_div) > -2.0 and then Arccos(buf_div) < -0.5) then
                        Key := SDLK_RIGHT;
                     end if;          
                     
                  end if;
               end if;
               
            else
            
               if difference > 45.0 and then Buffer_Acc.Y < 3.0 then
                  Key := SDLK_UP;
               elsif difference < 45.0 and then Buffer_Acc.Y > 2.0 then
                  Key := SDLK_DOWN;
               else 
                  Key := SDLK_UNKNOWN;
               end if;
              
            end if;
            
            
            Put_Line(Key'Image);
            -- change lander parameters
            protected_lander.Step(lander => Mars_Lander,
                                  key   => Key);
            
            buff_pt := (0.0, 0.0, 0.0);
            buff_pt.X := surface_start.X + surface_offset.X / 2.0;
            buff_pt.Y := surface_start.Y;
            Draw_Line(Canvas => Canvas,
                      P1     => Buffer_Pos,
                      P2     => buff_pt,
                      Color  => White);
            
            exit when Is_Killed;
         
            --  update the screen using procedure Swap_Buffers
            Swap_Buffers (Window);

            -- wait until Next
            delay until Next;

            --  update the Next time adding the period for the next step
            Next := Next + Period;
                       
            counter := counter + 1;
         end loop;
         
      end Start;
   end AI_Task;
   
end Controller;
