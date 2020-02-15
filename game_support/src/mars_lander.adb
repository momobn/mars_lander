with Ada.Text_IO; use Ada.Text_IO;

with Vector; use Vector;
with Display.Image; use Display.Image;
  
package body Mars_Lander is
   
   -- count the elapsed time that the lander has been propulsed
   propulsed_time : Integer := 0;   
   
   Is_Drawn : Boolean := False;
   Is_Put : Boolean := False;
   inv : constant Point_3d := (0.0, -1.0, 0.0);
   
   subtype Sprite_Id is Natural range 1..3;
   
   protected body protected_lander is
      
      -- Step procedure, update the lander parameters, react according to 
      -- pressed key
      entry Step (lander: in out Lander_Type; key: Key_T) when Is_Put is
         -- time interval
         delta_t: constant Point_3d := (40.0 / 1000.0, 40.0 / 1000.0, 0.0);
         
      begin
         if lander.Position.Y <= 22.0 then
            lander.stopped := True;
            lander.Speed := (0.0, 0.0, 0.0);
            lander.Acceleration := (0.0, 0.0, 0.0);
            lander.Gravity := (0.0, 0.0, 0.0);
            if lander.Speed.Y > 20.0 and then lander.Speed.X > 20.0 then
               lander.crushed := True;
            end if;
            if lander.Direction > 15.0 or else lander.Direction < -15.0 then
               lander.crushed := True;
            end if;
         end if;
         
         case key is
         when SDLK_LEFT => 
            if lander.Direction >= 180.0 then
               lander.Direction := 180.0;
            elsif lander.Direction <= -180.0 then
               lander.Direction := -180.0;
            end if;
            lander.Direction := lander.Direction + 0.5;
         
         when SDLK_RIGHT =>
            lander.Direction := lander.Direction - 0.5;
         
         when SDLK_UP => 
            if lander.Acceleration.Y > 0.0 then 
               lander.Acceleration.Y := lander.Acceleration.Y + 0.1;
            else
               lander.Acceleration.Y := lander.Acceleration.Y + 2.0;
            end if;
             if lander.Acceleration.X > 0.0 then 
               lander.Acceleration.X := lander.Acceleration.X + 0.1;
            else
               lander.Acceleration.X := lander.Acceleration.X + 2.0;
            end if;
         
         when SDLK_DOWN =>
            if lander.Acceleration.Y > 0.0 then 
               lander.Acceleration.Y := lander.Acceleration.Y * 0.2;
            else
               lander.Acceleration.Y := lander.Acceleration.Y - 0.2;
            end if; 
            if lander.Acceleration.X > 0.0 then 
               lander.Acceleration.X := lander.Acceleration.X * 0.2;
            else
               lander.Acceleration.X := lander.Acceleration.X - 0.2;
            end if;
            
         when SDLK_UNKNOWN =>
            lander.Acceleration := (0.0, 0.0, 0.0);
         when others =>
            null;
         end case;
      
         lander.Speed := lander.Speed + (lander.Acceleration + lander.Gravity) * delta_t;
         
         if lander.Speed.Y < 0.0 and then (lander.Direction > 90.0 or else lander.Direction < -90.0 ) then
            lander.Position := lander.Position + From_Angle(Angle => lander.Direction) * lander.Speed * inv * delta_t;
         else
            lander.Position := lander.Position + From_Angle(Angle => lander.Direction) * lander.Speed * delta_t;
         end if;
         
         if lander.Acceleration.Y > 0.0 then
            propulsed_time := propulsed_time + 1;
         else
            propulsed_time := 0;
         end if;
         
         Put_Line("pos: ( " & lander.Position.X'Image & ", " & lander.Position.Y'Image & " )");
         Put_Line("dir: ( " & lander.Direction'Image & " )");
         Put_Line("speed: ( " & lander.Speed.X'Image & ", " & lander.Speed.Y'Image & " )");
         Put_Line("acceleration: ( " & lander.Acceleration.X'Image & ", " & lander.Acceleration.Y'Image & " )");
         Put_Line("stopped: ( " & lander.stopped'Image & " ), crushed: ( " & lander.crushed'Image & " )");
         Put_Line("propulsed_time: ( " & propulsed_time'Image & " )");
         
         Is_Put := False;
         
      end Step;
      
      function Manual_Sprite_Copy(lander_spritemap: Image_T; spriteId: Sprite_Id) return Image_T is
         lower_bound : Integer := (spriteId - 1) * 20 + 1;
         upper_bound : Integer := spriteId * 20;
         lander_img: Image_T := new RGBA_Array(1..22, lower_bound..upper_bound);
      begin   
         for Y in 1..22 loop
            for X in lower_bound..upper_bound loop
               lander_img.all (Y,X) := lander_spritemap.all (Y,X);   
            end loop;
         end loop;
         
         return lander_img;
      end Manual_Sprite_Copy;
        
         
   
      -- Draw procedure, draw lander, background and display message on screen
      procedure Draw (lander: in out Lander_Type; canvas: Canvas_ID) is
         
         -- background poition
         bg_pos: constant Point_3d := (0.0, 0.0, -2.0);
   
         -- text position
         txt_pos: Screen_Point;
         
         -- load the lander image in bmp form
         lander_image: Image_T := null;
         
         lander_spritemap : Image_T := Load_BMP(File => "mars_lander.bmp");
         
         
      begin
         if lander.Acceleration.Y <= 0.0 then
            lander_image := Manual_Sprite_Copy(lander_spritemap, 1);
         elsif lander.Acceleration.Y > 0.0 then
            lander_image := Manual_Sprite_Copy(lander_spritemap, 2);
         elsif propulsed_time > 5 then
            lander_image := Manual_Sprite_Copy(lander_spritemap, 3);
         end if;
         
         
         
         Draw_Image(Canvas   => canvas,
                    Position => lander.Position,
                    Width    => 40.0,
                    Height   => 44.0,
                    Rotation => lander.Direction,
                    Image    => lander_image);
      
         Draw_Image(Canvas   => canvas,
                    Position => bg_pos,
                    Width    => 1024.0,
                    Height   => 1024.0,
                    Rotation => 0.0,
                    Image    => Load_BMP("sky.bmp"));
         if lander.stopped and then lander.crushed = False then
            txt_pos.X := 400 - Get_Text_Size(Text => "Successfully landed!").X / 2;
            txt_pos.Y := 400;
            Draw_Text(Canvas   => canvas,
                      Position => txt_pos,
                      Text     => "Successfully landed!",
                      Color    => Red);
         elsif lander.stopped and then lander.crushed then
            txt_pos.X := 400 - Get_Text_Size(Text => "Lander crushed!").X / 2;
            txt_pos.Y := 400;
            Draw_Text(Canvas   => canvas,
                      Position => txt_pos,
                      Text     => "Lander crushed!",
                      Color    => Red);
         end if;
      
         Is_Drawn := True;
         
      end Draw;
   
      entry User_Input (pressed_key: in out Key_T) when Is_Drawn is
      begin
         if Get_Key_Status(Key => SDLK_UP) then
            pressed_key := SDLK_UP;
         end if;

         if Get_Key_Status(Key => SDLK_LEFT) then
            pressed_key := SDLK_LEFT;
         end if;

         if Get_Key_Status(Key => SDLK_RIGHT) then
            pressed_key := SDLK_RIGHT;
         end if;

         if Get_Key_Status(Key => SDLK_DOWN) then
            pressed_key := SDLK_DOWN;
         end if;
         Is_Drawn := False;
         Is_Put := True;
      end User_Input;
   
   end protected_lander;
   
   procedure Init (lander: in out Lander_Type; speed_x: Float; speed_y: Float) is
      begin
         lander.Speed := (speed_x, speed_y, 0.0);
   end Init;
   
end Mars_Lander;
