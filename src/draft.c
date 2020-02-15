/**
   -- position of the object
   Pos : Point_3d;

   -- current direction, an angle
   Direction : Float;

   -- speed of the object in given direction
   Speed : Float;

   -- angle in radian
   a : Float;

   -- constant Pi
   Pi : constant Float := Ada.Numerics.Pi;
  **/

/**
   -- initialize the creen 2d point, the direction and the speed
   Pos.X := 0.0;
   Pos.Y := 0.0;
   Pos.Z := 0.0;
   Direction := 45.0;
   Speed := 0.5;
  **/

/**
a := Direction * Pi / 180.0;

      Draw_Rect(Canvas   => Canvas,
                Position => Pos,
                Width    => 10.0,
                Height   => 10.0,
                Rotation => 0.0,
                Color    => Magenta);

      Pos.X := Pos.X - Sin(X => a) * Speed * 40.0 / 1000.0;
      Pos.Y := Pos.Y + Cos(X => a) * Speed * 40.0 / 1000.0;

      if Get_Key_Status(Key => SDLK_UP) then
         null;
      end if;

      if Get_Key_Status(Key => SDLK_LEFT) then
         Direction := Direction + 1.0;
      end if;

      if Get_Key_Status(Key => SDLK_RIGHT) then
         Direction := Direction - 1.0;
      end if;
**/
