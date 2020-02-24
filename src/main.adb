with Ada.Real_Time; use Ada.Real_Time;

with Display;       use Display;
with Display.Basic; use Display.Basic;
with Mars_Lander;   use Mars_Lander;
with Terrain;       use Terrain;
with Controller;    use Controller;


procedure Main is

begin
   -- game loop
   Controller.AI_Task.Start;
end Main;
