with Display.Image; use Display.Image;
with Display; use Display;

package body Background is

   procedure Draw_background (canvas: Canvas_ID) is
      -- background poition
      bg_pos : constant Point_3d := (0.0, 0.0, -2.0);
      notice_pos : constant Point_3d := (120.0, 340.0, 1.0);
   begin
      Draw_Image(Canvas   => canvas,
                 Position => bg_pos,
                 Width    => 1024.0,
                 Height   => 1024.0,
                 Rotation => 0.0,
                 Image    => Load_BMP("sky.bmp"));
      
      -- add notice to enter in manual mode    
      Draw_Text(Canvas   => canvas,
                Position => notice_pos,
                Text     => "Use key M to begin manual mode",
                Color    => White);

      
   end Draw_background;
   
end Background;
