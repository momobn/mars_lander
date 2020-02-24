pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E072 : Short_Integer; pragma Import (Ada, E072, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exception_table_E");
   E040 : Short_Integer; pragma Import (Ada, E040, "ada__containers_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__io_exceptions_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__strings_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__strings__maps_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__strings__maps__constants_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "interfaces__c_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exceptions_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "system__object_reader_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "system__dwarf_lines_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__soft_links__initialize_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "system__traceback__symbolic_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "ada__numerics_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "ada__tags_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "ada__streams_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "interfaces__c__strings_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "system__file_control_block_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "system__finalization_root_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "ada__finalization_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "system__file_io_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "system__task_info_E");
   E242 : Short_Integer; pragma Import (Ada, E242, "ada__calendar_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "ada__text_io_E");
   E240 : Short_Integer; pragma Import (Ada, E240, "system__random_seed_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "system__tasking__initialization_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "system__tasking__protected_objects_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "system__tasking__protected_objects__entries_E");
   E228 : Short_Integer; pragma Import (Ada, E228, "system__tasking__queuing_E");
   E248 : Short_Integer; pragma Import (Ada, E248, "system__tasking__stages_E");
   E236 : Short_Integer; pragma Import (Ada, E236, "perlin_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "display_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "display__image_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "display__basic_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "display__basic__glfonts_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "display__basic__utils_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "display__basic__fonts_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "background_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "collision_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "terrain_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "vector_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "mars_lander_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "controller_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E197 := E197 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "mars_lander__finalize_spec");
      begin
         F1;
      end;
      E234 := E234 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "terrain__finalize_spec");
      begin
         F2;
      end;
      E216 := E216 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F3;
      end;
      E150 := E150 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "ada__text_io__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__file_io__finalize_body");
      begin
         E156 := E156 - 1;
         F5;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (True, True, False, False, True, True, False, False, 
           True, False, False, True, True, True, True, False, 
           False, False, True, False, True, True, False, True, 
           True, False, True, True, True, True, False, False, 
           False, False, False, True, False, False, True, False, 
           False, False, True, True, False, False, False, True, 
           False, False, False, True, False, False, False, False, 
           False, False, False, True, False, True, True, True, 
           False, False, True, False, True, True, True, False, 
           True, True, False, True, True, True, True, False, 
           False, True, False, False, False, True, False, True, 
           True, False, True, False),
         Count => (0, 0, 0, 2, 0, 1, 1, 0, 2, 0),
         Unknown => (False, False, False, False, False, False, False, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E025 := E025 + 1;
      Ada.Containers'Elab_Spec;
      E040 := E040 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E068 := E068 + 1;
      Ada.Strings'Elab_Spec;
      E052 := E052 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E054 := E054 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E058 := E058 + 1;
      Interfaces.C'Elab_Spec;
      E078 := E078 + 1;
      System.Exceptions'Elab_Spec;
      E027 := E027 + 1;
      System.Object_Reader'Elab_Spec;
      E080 := E080 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E047 := E047 + 1;
      System.Os_Lib'Elab_Body;
      E072 := E072 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E021 := E021 + 1;
      E013 := E013 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E039 := E039 + 1;
      Ada.Numerics'Elab_Spec;
      E131 := E131 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E144 := E144 + 1;
      Ada.Streams'Elab_Spec;
      E152 := E152 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E103 := E103 + 1;
      System.File_Control_Block'Elab_Spec;
      E160 := E160 + 1;
      System.Finalization_Root'Elab_Spec;
      E159 := E159 + 1;
      Ada.Finalization'Elab_Spec;
      E157 := E157 + 1;
      System.File_Io'Elab_Body;
      E156 := E156 + 1;
      System.Task_Info'Elab_Spec;
      E118 := E118 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E242 := E242 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E150 := E150 + 1;
      System.Random_Seed'Elab_Body;
      E240 := E240 + 1;
      System.Tasking.Initialization'Elab_Body;
      E220 := E220 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E210 := E210 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E216 := E216 + 1;
      System.Tasking.Queuing'Elab_Body;
      E228 := E228 + 1;
      System.Tasking.Stages'Elab_Body;
      E248 := E248 + 1;
      E236 := E236 + 1;
      Display'Elab_Spec;
      E163 := E163 + 1;
      Display.Image'Elab_Body;
      E175 := E175 + 1;
      Display.Basic'Elab_Spec;
      Display.Basic.Utils'Elab_Spec;
      E182 := E182 + 1;
      E179 := E179 + 1;
      Display.Basic'Elab_Body;
      E177 := E177 + 1;
      Display.Basic.Glfonts'Elab_Body;
      E184 := E184 + 1;
      E162 := E162 + 1;
      E199 := E199 + 1;
      Terrain'Elab_Spec;
      E234 := E234 + 1;
      E246 := E246 + 1;
      Mars_Lander'Elab_Spec;
      E197 := E197 + 1;
      Controller'Elab_Spec;
      Controller'Elab_Body;
      E130 := E130 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\gl_gl_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\gl_glu_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\perlin.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_blendmode_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_error_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_scancode_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\stdarg_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\stddef_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\stdint_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_stdinc_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_joystick_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_keycode_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_keyboard_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_pixels_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_rect_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_rwops_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_surface_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\display.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\display-image.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_touch_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_gesture_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_events_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\sdl_video_h.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\display-basic-utils.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\display-basic-fonts.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\display-basic.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\display-basic-glfonts.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\background.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\collision.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\terrain.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\vector.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\mars_lander.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\controller.o
   --   E:\eidd-3A\temps reels\mars_lander_lab\obj\main.o
   --   -LE:\eidd-3A\temps reels\mars_lander_lab\obj\
   --   -LE:\eidd-3A\temps reels\mars_lander_lab\obj\
   --   -LE:\eidd-3A\temps reels\mars_lander_lab\game_support\obj\
   --   -LE:\eidd-3A\temps reels\mars_lander_lab\gnat_sdl\obj\
   --   -LE:\eidd-3A\temps reels\mars_lander_lab\game_support\stm32f4\obj\
   --   -LC:/gnat/2019/lib/gcc/x86_64-pc-mingw32/8.3.1/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
