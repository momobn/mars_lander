with Ada.Text_IO; use Ada.Text_IO;

with Vector; use Vector;
with Display.Image; use Display.Image;
with Terrain; use Terrain;
with Collision; use Collision;
  
package body Mars_Lander is
   
   -- count the elapsed time that the lander has been propulsed
   propulsed_time : Integer := 0;   
   
   Is_Drawn : Boolean := False;
   Manual_Mode_Counter : Natural := 0;
   inv : constant Point_3d := (0.0, -1.0, 0.0);
   
   subtype Sprite_Id is Natural range 1..3;
   
   protected body protected_lander is
      
      -- Step procedure, update the lander parameters, react according to 
      -- pressed key
      entry Step (lander : in out Lander_Type; key : Key_T) when Is_Put or else AI_Controlled is
         -- time interval
         delta_t : constant Point_3d := (40.0 / 1000.0, 40.0 / 1000.0, 0.0);
         tmp_pos_1 : constant Point_3d := ((-20.0), (-22.0), 0.0);
         tmp_pos_2 : constant Point_3d := ((20.0), (-22.0), 0.0);
         tmp_pos_3 : constant Point_3d := ((-20.0), (22.0), 0.0);
         tmp_pos_4 : constant Point_3d := ((20.0), (22.0), 0.0);
         
         surface_start : Point_3d;
         surface_offset : constant Point_3d := 
           (60.0, 0.0, 0.0);
         surface_end : Point_3d;
         Mars_Terrain : Terrain_Type;
         terrain_index : Natural;
         
         surface_collision_test : Boolean := False;
         terrain_crush_test : Boolean := False;
         
      begin
         -- get the starting and ending points of surface, and the terrain array
         Terrain_Object.Get_Surface(Surface_Begin_Point => surface_start);
         surface_end := surface_start + surface_offset;
         Terrain_Object.Get_Terrain(Mars_Terrain => Mars_Terrain);
         
         -- collision test
         surface_collision_test := 
           Line_Rectangle(A  => lander.Position + tmp_pos_1,
                          B  => lander.Position + tmp_pos_2,
                          C  => lander.Position + tmp_pos_3,
                          D  => lander.Position + tmp_pos_4,
                          E1 => surface_start,
                          E2 => surface_end);
         -- crush test
         terrain_index := 
           50 + Integer(lander.Position.X / ((Float(Game_Window_Width) / Float(Size))));
         
         if terrain_index >= Size then
            lander.crushed := True;
         else 
            terrain_crush_test := 
              Line_Rectangle(A  => lander.Position + tmp_pos_1,
                             B  => lander.Position + tmp_pos_2,
                             C  => lander.Position + tmp_pos_3,
                             D  => lander.Position + tmp_pos_4,
                             E1 => Mars_Terrain(terrain_index),
                             E2 => Mars_Terrain(terrain_index + 1));
         end if;
         
         -- case if the lander is trying to land on the surface               
         if surface_collision_test then
            lander.stopped := True;
            lander.Speed := (0.0, 0.0, 0.0);
            lander.Acceleration := (0.0, 0.0, 0.0);
            lander.Gravity := (0.0, 0.0, 0.0);
            
            -- crush test
            if (lander.Speed.Y > 18.0 and then lander.Speed.X > 18.0) 
              or else (lander.Direction > 5.0 or else lander.Direction < -5.0) then
               lander.crushed := True;
            end if;
         end if;
         
         if terrain_crush_test then
            lander.stopped := True;
            lander.crushed := True;
            lander.Speed := (0.0, 0.0, 0.0);
            lander.Acceleration := (0.0, 0.0, 0.0);
            lander.Gravity := (0.0, 0.0, 0.0);
         end if;
         
         if lander.stopped = False and then lander.crushed = False then
            case key is
            when SDLK_LEFT => 
               if lander.Direction >= 180.0 then
                  lander.Direction := 180.0;
               elsif lander.Direction <= -180.0 then
                  lander.Direction := -180.0;
               end if;
               lander.Direction := lander.Direction + 0.5;
         
            when SDLK_RIGHT =>
               if lander.Direction >= 180.0 then
                  lander.Direction := 180.0;
               elsif lander.Direction <= -180.0 then
                  lander.Direction := -180.0;
               end if;
               lander.Direction := lander.Direction - 0.5;
         
            when SDLK_UP => 
               if lander.Acceleration.Y > 0.0 then 
                  lander.Acceleration.Y := lander.Acceleration.Y + 0.05;
               else
                  lander.Acceleration.Y := lander.Acceleration.Y + 1.0;
               end if;
               if lander.Acceleration.X > 0.0 then 
                  lander.Acceleration.X := lander.Acceleration.X + 0.15;
               else
                  lander.Acceleration.X := lander.Acceleration.X + 1.0;
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
         
            Buffer_Pos := lander.Position;
            Buffer_Acc := lander.Acceleration;
            Buffer_Dir := lander.Direction;
         
            --Put_Line("pos: ( " & lander.Position.X'Image & ", " & lander.Position.Y'Image & " )");
            --Put_Line("dir: ( " & lander.Direction'Image & " )");
            Put_Line("speed: ( " & lander.Speed.X'Image & ", " & lander.Speed.Y'Image & " )");
            --Put_Line("acceleration: ( " & lander.Acceleration.X'Image & ", " & lander.Acceleration.Y'Image & " )");
            --Put_Line("stopped: ( " & lander.stopped'Image & " ), crushed: ( " & lander.crushed'Image & " )");
            --Put_Line("propulsed_time: ( " & propulsed_time'Image & " )");
         end if;
         
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
   
         -- text position
         txt_pos : Screen_Point;
         
         -- load the lander image in bmp form
         lander_image : Image_T := null;
         
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
         
         if lander.stopped and then lander.crushed = False then
            txt_pos.X := 500 - Get_Text_Size(Text => "Successfully landed!").X / 2;
            txt_pos.Y := 300;
            Draw_Text(Canvas   => canvas,
                      Position => txt_pos,
                      Text     => "YEAH!!! Successfully landed!",
                      Color    => Green);
         elsif lander.stopped and then lander.crushed then
            txt_pos.X := 500 - Get_Text_Size(Text => "Lander crushed!").X / 2;
            txt_pos.Y := 300;
            Draw_Text(Canvas   => canvas,
                      Position => txt_pos,
                      Text     => "OOOOOOPS!!! Lander crushed!",
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
      
      function Get_Is_Put return Boolean is
      begin
         return protected_lander.Is_Put;
      end Get_Is_Put;
   
      function Get_AI_Controlled return Boolean is
      begin
         return protected_lander.AI_Controlled;
      end Get_AI_Controlled;
   
      procedure Set_Is_Put (Is_Put : Boolean) is
      begin
         protected_lander.Is_Put := Is_Put;
      end Set_Is_Put;
   
      procedure Set_AI_Controlled (AI_Controlled : Boolean) is
      begin
         protected_lander.AI_Controlled := AI_Controlled;
      end Set_AI_Controlled;
      
      procedure Enter_Manual_Mode (Manual_Mode_Entered : out Boolean) is
      begin
         if Manual_Mode_Counter = 0 then
            protected_lander.Manual_Mode := Get_Key_Status(Key => SDLK_M);
            if protected_lander.Manual_Mode then
               Manual_Mode_Counter := 1;
            end if;
         end if;
         Manual_Mode_Entered := protected_lander.Manual_Mode;
      end Enter_Manual_Mode;
      
   end protected_lander;
   
   procedure Init (lander : in out Lander_Type; speed_x : Float; speed_y : Float) is
   begin
      lander.Speed := (speed_x, speed_y, 0.0);
   end Init;
   
   
end Mars_Lander;
