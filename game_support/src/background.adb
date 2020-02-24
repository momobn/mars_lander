with Display.Image; use Display.Image;

package body Background is

   procedure Draw_background (canvas: Canvas_ID) is
      -- background poition
      bg_pos : constant Point_3d := (0.0, 0.0, -2.0);
   begin
      Draw_Image(Canvas   => canvas,
                 Position => bg_pos,
                 Width    => 1024.0,
                 Height   => 1024.0,
                 Rotation => 0.0,
                 Image    => Load_BMP("sky.bmp"));
      
   end Draw_background;
   
end Background;
