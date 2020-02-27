pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Community 2019 (20190517-83)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#2166d1af#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#050ff2f0#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#35869f17#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#321c7146#;
   pragma Export (C, u00004, "controllerB");
   u00005 : constant Version_32 := 16#ff814c84#;
   pragma Export (C, u00005, "controllerS");
   u00006 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00006, "adaS");
   u00007 : constant Version_32 := 16#cd2959fb#;
   pragma Export (C, u00007, "ada__numericsS");
   u00008 : constant Version_32 := 16#32a08138#;
   pragma Export (C, u00008, "systemS");
   u00009 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00009, "system__exception_tableB");
   u00010 : constant Version_32 := 16#6f0ee87a#;
   pragma Export (C, u00010, "system__exception_tableS");
   u00011 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00011, "system__soft_linksB");
   u00012 : constant Version_32 := 16#77a38a8e#;
   pragma Export (C, u00012, "system__soft_linksS");
   u00013 : constant Version_32 := 16#87be2c0f#;
   pragma Export (C, u00013, "system__secondary_stackB");
   u00014 : constant Version_32 := 16#77347921#;
   pragma Export (C, u00014, "system__secondary_stackS");
   u00015 : constant Version_32 := 16#90189159#;
   pragma Export (C, u00015, "ada__exceptionsB");
   u00016 : constant Version_32 := 16#2ccb9557#;
   pragma Export (C, u00016, "ada__exceptionsS");
   u00017 : constant Version_32 := 16#5726abed#;
   pragma Export (C, u00017, "ada__exceptions__last_chance_handlerB");
   u00018 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00018, "ada__exceptions__last_chance_handlerS");
   u00019 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00019, "system__exceptionsB");
   u00020 : constant Version_32 := 16#5ac3ecce#;
   pragma Export (C, u00020, "system__exceptionsS");
   u00021 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00021, "system__exceptions__machineB");
   u00022 : constant Version_32 := 16#d27d9682#;
   pragma Export (C, u00022, "system__exceptions__machineS");
   u00023 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00023, "system__exceptions_debugB");
   u00024 : constant Version_32 := 16#4c2a78fc#;
   pragma Export (C, u00024, "system__exceptions_debugS");
   u00025 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00025, "system__img_intB");
   u00026 : constant Version_32 := 16#307b61fa#;
   pragma Export (C, u00026, "system__img_intS");
   u00027 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00027, "system__storage_elementsB");
   u00028 : constant Version_32 := 16#1f63cb3c#;
   pragma Export (C, u00028, "system__storage_elementsS");
   u00029 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00029, "system__tracebackB");
   u00030 : constant Version_32 := 16#6c825ffc#;
   pragma Export (C, u00030, "system__tracebackS");
   u00031 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00031, "system__traceback_entriesB");
   u00032 : constant Version_32 := 16#32fb7748#;
   pragma Export (C, u00032, "system__traceback_entriesS");
   u00033 : constant Version_32 := 16#9ad5ad12#;
   pragma Export (C, u00033, "system__traceback__symbolicB");
   u00034 : constant Version_32 := 16#c84061d1#;
   pragma Export (C, u00034, "system__traceback__symbolicS");
   u00035 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00035, "ada__containersS");
   u00036 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00036, "ada__exceptions__tracebackB");
   u00037 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00037, "ada__exceptions__tracebackS");
   u00038 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00038, "system__bounded_stringsB");
   u00039 : constant Version_32 := 16#455da021#;
   pragma Export (C, u00039, "system__bounded_stringsS");
   u00040 : constant Version_32 := 16#74f70e62#;
   pragma Export (C, u00040, "system__crtlS");
   u00041 : constant Version_32 := 16#86dbf443#;
   pragma Export (C, u00041, "system__parametersB");
   u00042 : constant Version_32 := 16#7a4cd513#;
   pragma Export (C, u00042, "system__parametersS");
   u00043 : constant Version_32 := 16#cf32f6f7#;
   pragma Export (C, u00043, "system__dwarf_linesB");
   u00044 : constant Version_32 := 16#eeedbcbd#;
   pragma Export (C, u00044, "system__dwarf_linesS");
   u00045 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00045, "ada__charactersS");
   u00046 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00046, "ada__characters__handlingB");
   u00047 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00047, "ada__characters__handlingS");
   u00048 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00048, "ada__characters__latin_1S");
   u00049 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00049, "ada__stringsS");
   u00050 : constant Version_32 := 16#96df1a3f#;
   pragma Export (C, u00050, "ada__strings__mapsB");
   u00051 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00051, "ada__strings__mapsS");
   u00052 : constant Version_32 := 16#a21ad5cd#;
   pragma Export (C, u00052, "system__bit_opsB");
   u00053 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00053, "system__bit_opsS");
   u00054 : constant Version_32 := 16#0626fdbb#;
   pragma Export (C, u00054, "system__unsigned_typesS");
   u00055 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00055, "ada__strings__maps__constantsS");
   u00056 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00056, "interfacesS");
   u00057 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00057, "system__address_imageB");
   u00058 : constant Version_32 := 16#934c1c02#;
   pragma Export (C, u00058, "system__address_imageS");
   u00059 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00059, "system__img_unsB");
   u00060 : constant Version_32 := 16#99d2c14c#;
   pragma Export (C, u00060, "system__img_unsS");
   u00061 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00061, "system__ioB");
   u00062 : constant Version_32 := 16#ace27677#;
   pragma Export (C, u00062, "system__ioS");
   u00063 : constant Version_32 := 16#3080f2ca#;
   pragma Export (C, u00063, "system__mmapB");
   u00064 : constant Version_32 := 16#08d13e5f#;
   pragma Export (C, u00064, "system__mmapS");
   u00065 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00065, "ada__io_exceptionsS");
   u00066 : constant Version_32 := 16#a82e20f9#;
   pragma Export (C, u00066, "system__mmap__os_interfaceB");
   u00067 : constant Version_32 := 16#8f4541b8#;
   pragma Export (C, u00067, "system__mmap__os_interfaceS");
   u00068 : constant Version_32 := 16#de8ca4eb#;
   pragma Export (C, u00068, "system__os_libB");
   u00069 : constant Version_32 := 16#d8e681fb#;
   pragma Export (C, u00069, "system__os_libS");
   u00070 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00070, "system__case_utilB");
   u00071 : constant Version_32 := 16#0d75376c#;
   pragma Export (C, u00071, "system__case_utilS");
   u00072 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00072, "system__stringsB");
   u00073 : constant Version_32 := 16#52b6adad#;
   pragma Export (C, u00073, "system__stringsS");
   u00074 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00074, "interfaces__cB");
   u00075 : constant Version_32 := 16#467817d8#;
   pragma Export (C, u00075, "interfaces__cS");
   u00076 : constant Version_32 := 16#5a3f5337#;
   pragma Export (C, u00076, "system__object_readerB");
   u00077 : constant Version_32 := 16#f6d45c39#;
   pragma Export (C, u00077, "system__object_readerS");
   u00078 : constant Version_32 := 16#fb020d94#;
   pragma Export (C, u00078, "system__val_lliB");
   u00079 : constant Version_32 := 16#5ece13c8#;
   pragma Export (C, u00079, "system__val_lliS");
   u00080 : constant Version_32 := 16#b8e72903#;
   pragma Export (C, u00080, "system__val_lluB");
   u00081 : constant Version_32 := 16#6be87059#;
   pragma Export (C, u00081, "system__val_lluS");
   u00082 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00082, "system__val_utilB");
   u00083 : constant Version_32 := 16#9e0037c6#;
   pragma Export (C, u00083, "system__val_utilS");
   u00084 : constant Version_32 := 16#d7bf3f29#;
   pragma Export (C, u00084, "system__exception_tracesB");
   u00085 : constant Version_32 := 16#167fa1a2#;
   pragma Export (C, u00085, "system__exception_tracesS");
   u00086 : constant Version_32 := 16#f66d6445#;
   pragma Export (C, u00086, "system__win32S");
   u00087 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00087, "system__wch_conB");
   u00088 : constant Version_32 := 16#29dda3ea#;
   pragma Export (C, u00088, "system__wch_conS");
   u00089 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00089, "system__wch_stwB");
   u00090 : constant Version_32 := 16#04cc8feb#;
   pragma Export (C, u00090, "system__wch_stwS");
   u00091 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00091, "system__wch_cnvB");
   u00092 : constant Version_32 := 16#266a1919#;
   pragma Export (C, u00092, "system__wch_cnvS");
   u00093 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00093, "system__wch_jisB");
   u00094 : constant Version_32 := 16#a61a0038#;
   pragma Export (C, u00094, "system__wch_jisS");
   u00095 : constant Version_32 := 16#75bf515c#;
   pragma Export (C, u00095, "system__soft_links__initializeB");
   u00096 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00096, "system__soft_links__initializeS");
   u00097 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00097, "system__stack_checkingB");
   u00098 : constant Version_32 := 16#bc1fead0#;
   pragma Export (C, u00098, "system__stack_checkingS");
   u00099 : constant Version_32 := 16#03e83d1c#;
   pragma Export (C, u00099, "ada__numerics__elementary_functionsB");
   u00100 : constant Version_32 := 16#edc89b7f#;
   pragma Export (C, u00100, "ada__numerics__elementary_functionsS");
   u00101 : constant Version_32 := 16#e5114ee9#;
   pragma Export (C, u00101, "ada__numerics__auxB");
   u00102 : constant Version_32 := 16#9f6e24ed#;
   pragma Export (C, u00102, "ada__numerics__auxS");
   u00103 : constant Version_32 := 16#36373acb#;
   pragma Export (C, u00103, "system__fat_llfS");
   u00104 : constant Version_32 := 16#5fc82639#;
   pragma Export (C, u00104, "system__machine_codeS");
   u00105 : constant Version_32 := 16#b2a569d2#;
   pragma Export (C, u00105, "system__exn_llfB");
   u00106 : constant Version_32 := 16#8ede3ae4#;
   pragma Export (C, u00106, "system__exn_llfS");
   u00107 : constant Version_32 := 16#6ad59d2c#;
   pragma Export (C, u00107, "system__fat_fltS");
   u00108 : constant Version_32 := 16#64176fe3#;
   pragma Export (C, u00108, "ada__real_timeB");
   u00109 : constant Version_32 := 16#69ea8064#;
   pragma Export (C, u00109, "ada__real_timeS");
   u00110 : constant Version_32 := 16#4f04e3f2#;
   pragma Export (C, u00110, "system__taskingB");
   u00111 : constant Version_32 := 16#76fd1509#;
   pragma Export (C, u00111, "system__taskingS");
   u00112 : constant Version_32 := 16#5901abf2#;
   pragma Export (C, u00112, "system__task_primitivesS");
   u00113 : constant Version_32 := 16#5bbb030d#;
   pragma Export (C, u00113, "system__os_interfaceS");
   u00114 : constant Version_32 := 16#1d638357#;
   pragma Export (C, u00114, "interfaces__c__stringsB");
   u00115 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00115, "interfaces__c__stringsS");
   u00116 : constant Version_32 := 16#c1984f17#;
   pragma Export (C, u00116, "system__task_primitives__operationsB");
   u00117 : constant Version_32 := 16#17a57953#;
   pragma Export (C, u00117, "system__task_primitives__operationsS");
   u00118 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00118, "system__float_controlB");
   u00119 : constant Version_32 := 16#d25cc204#;
   pragma Export (C, u00119, "system__float_controlS");
   u00120 : constant Version_32 := 16#6387a759#;
   pragma Export (C, u00120, "system__interrupt_managementB");
   u00121 : constant Version_32 := 16#b66bc35d#;
   pragma Export (C, u00121, "system__interrupt_managementS");
   u00122 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00122, "system__multiprocessorsB");
   u00123 : constant Version_32 := 16#0a0c1e4b#;
   pragma Export (C, u00123, "system__multiprocessorsS");
   u00124 : constant Version_32 := 16#24ec69e6#;
   pragma Export (C, u00124, "system__os_primitivesB");
   u00125 : constant Version_32 := 16#355de4ce#;
   pragma Export (C, u00125, "system__os_primitivesS");
   u00126 : constant Version_32 := 16#05c60a38#;
   pragma Export (C, u00126, "system__task_lockB");
   u00127 : constant Version_32 := 16#532ab656#;
   pragma Export (C, u00127, "system__task_lockS");
   u00128 : constant Version_32 := 16#3d84d1b9#;
   pragma Export (C, u00128, "system__win32__extS");
   u00129 : constant Version_32 := 16#ce7dfb56#;
   pragma Export (C, u00129, "system__task_infoB");
   u00130 : constant Version_32 := 16#c2531eac#;
   pragma Export (C, u00130, "system__task_infoS");
   u00131 : constant Version_32 := 16#e5a48551#;
   pragma Export (C, u00131, "system__tasking__debugB");
   u00132 : constant Version_32 := 16#48f9280e#;
   pragma Export (C, u00132, "system__tasking__debugS");
   u00133 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00133, "system__concat_2B");
   u00134 : constant Version_32 := 16#300056e8#;
   pragma Export (C, u00134, "system__concat_2S");
   u00135 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00135, "system__concat_3B");
   u00136 : constant Version_32 := 16#39d0dd9d#;
   pragma Export (C, u00136, "system__concat_3S");
   u00137 : constant Version_32 := 16#273384e4#;
   pragma Export (C, u00137, "system__img_enum_newB");
   u00138 : constant Version_32 := 16#53ec87f8#;
   pragma Export (C, u00138, "system__img_enum_newS");
   u00139 : constant Version_32 := 16#6ec3c867#;
   pragma Export (C, u00139, "system__stack_usageB");
   u00140 : constant Version_32 := 16#3a3ac346#;
   pragma Export (C, u00140, "system__stack_usageS");
   u00141 : constant Version_32 := 16#ac0b64a5#;
   pragma Export (C, u00141, "ada__real_time__delaysB");
   u00142 : constant Version_32 := 16#0a5c26d7#;
   pragma Export (C, u00142, "ada__real_time__delaysS");
   u00143 : constant Version_32 := 16#d398a95f#;
   pragma Export (C, u00143, "ada__tagsB");
   u00144 : constant Version_32 := 16#12a0afb8#;
   pragma Export (C, u00144, "ada__tagsS");
   u00145 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00145, "system__htableB");
   u00146 : constant Version_32 := 16#b66232d2#;
   pragma Export (C, u00146, "system__htableS");
   u00147 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00147, "system__string_hashB");
   u00148 : constant Version_32 := 16#143c59ac#;
   pragma Export (C, u00148, "system__string_hashS");
   u00149 : constant Version_32 := 16#f4e097a7#;
   pragma Export (C, u00149, "ada__text_ioB");
   u00150 : constant Version_32 := 16#03e83e15#;
   pragma Export (C, u00150, "ada__text_ioS");
   u00151 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00151, "ada__streamsB");
   u00152 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00152, "ada__streamsS");
   u00153 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00153, "interfaces__c_streamsB");
   u00154 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00154, "interfaces__c_streamsS");
   u00155 : constant Version_32 := 16#ec083f01#;
   pragma Export (C, u00155, "system__file_ioB");
   u00156 : constant Version_32 := 16#95d1605d#;
   pragma Export (C, u00156, "system__file_ioS");
   u00157 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00157, "ada__finalizationS");
   u00158 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00158, "system__finalization_rootB");
   u00159 : constant Version_32 := 16#7d52f2a8#;
   pragma Export (C, u00159, "system__finalization_rootS");
   u00160 : constant Version_32 := 16#cf3f1b90#;
   pragma Export (C, u00160, "system__file_control_blockS");
   u00161 : constant Version_32 := 16#71d1957f#;
   pragma Export (C, u00161, "backgroundB");
   u00162 : constant Version_32 := 16#66913500#;
   pragma Export (C, u00162, "backgroundS");
   u00163 : constant Version_32 := 16#d23c0bd2#;
   pragma Export (C, u00163, "displayS");
   u00164 : constant Version_32 := 16#2bda477c#;
   pragma Export (C, u00164, "sdl_surface_hS");
   u00165 : constant Version_32 := 16#b729b22d#;
   pragma Export (C, u00165, "sdl_blendmode_hS");
   u00166 : constant Version_32 := 16#9fc0eb73#;
   pragma Export (C, u00166, "sdl_pixels_hS");
   u00167 : constant Version_32 := 16#3cb6e6b8#;
   pragma Export (C, u00167, "sdl_stdinc_hS");
   u00168 : constant Version_32 := 16#bde814a5#;
   pragma Export (C, u00168, "stdarg_hS");
   u00169 : constant Version_32 := 16#aacab6e3#;
   pragma Export (C, u00169, "stddef_hS");
   u00170 : constant Version_32 := 16#5e5671b5#;
   pragma Export (C, u00170, "interfaces__c__extensionsS");
   u00171 : constant Version_32 := 16#5b9c1086#;
   pragma Export (C, u00171, "stdint_hS");
   u00172 : constant Version_32 := 16#7f24f6ad#;
   pragma Export (C, u00172, "sdl_rect_hS");
   u00173 : constant Version_32 := 16#06bea2d4#;
   pragma Export (C, u00173, "sdl_rwops_hS");
   u00174 : constant Version_32 := 16#8c80aaf6#;
   pragma Export (C, u00174, "display__imageB");
   u00175 : constant Version_32 := 16#bcca895f#;
   pragma Export (C, u00175, "display__imageS");
   u00176 : constant Version_32 := 16#f0ea582e#;
   pragma Export (C, u00176, "display__basicB");
   u00177 : constant Version_32 := 16#5c5c255f#;
   pragma Export (C, u00177, "display__basicS");
   u00178 : constant Version_32 := 16#d84b68c7#;
   pragma Export (C, u00178, "display__basic__fontsB");
   u00179 : constant Version_32 := 16#7d6ee5b9#;
   pragma Export (C, u00179, "display__basic__fontsS");
   u00180 : constant Version_32 := 16#a3aa4cc4#;
   pragma Export (C, u00180, "sdl_video_hS");
   u00181 : constant Version_32 := 16#0ef41a26#;
   pragma Export (C, u00181, "display__basic__utilsB");
   u00182 : constant Version_32 := 16#c169a61f#;
   pragma Export (C, u00182, "display__basic__utilsS");
   u00183 : constant Version_32 := 16#4080b80b#;
   pragma Export (C, u00183, "display__basic__glfontsB");
   u00184 : constant Version_32 := 16#17481176#;
   pragma Export (C, u00184, "display__basic__glfontsS");
   u00185 : constant Version_32 := 16#1e0d12ec#;
   pragma Export (C, u00185, "gl_gl_hS");
   u00186 : constant Version_32 := 16#cafbcd5b#;
   pragma Export (C, u00186, "gl_glu_hS");
   u00187 : constant Version_32 := 16#5d73a81c#;
   pragma Export (C, u00187, "sdl_error_hS");
   u00188 : constant Version_32 := 16#8674788c#;
   pragma Export (C, u00188, "sdl_events_hS");
   u00189 : constant Version_32 := 16#b5072ac9#;
   pragma Export (C, u00189, "sdl_gesture_hS");
   u00190 : constant Version_32 := 16#fb5ea3be#;
   pragma Export (C, u00190, "sdl_touch_hS");
   u00191 : constant Version_32 := 16#d4dcb331#;
   pragma Export (C, u00191, "sdl_joystick_hS");
   u00192 : constant Version_32 := 16#40f2cc6f#;
   pragma Export (C, u00192, "sdl_keyboard_hS");
   u00193 : constant Version_32 := 16#8671682b#;
   pragma Export (C, u00193, "sdl_keycode_hS");
   u00194 : constant Version_32 := 16#f1942ea3#;
   pragma Export (C, u00194, "sdl_scancode_hS");
   u00195 : constant Version_32 := 16#5c9e3cb7#;
   pragma Export (C, u00195, "sdl_hS");
   u00196 : constant Version_32 := 16#016d2b4d#;
   pragma Export (C, u00196, "mars_landerB");
   u00197 : constant Version_32 := 16#98c36a05#;
   pragma Export (C, u00197, "mars_landerS");
   u00198 : constant Version_32 := 16#e50f2660#;
   pragma Export (C, u00198, "collisionB");
   u00199 : constant Version_32 := 16#65ff8504#;
   pragma Export (C, u00199, "collisionS");
   u00200 : constant Version_32 := 16#f24a7f45#;
   pragma Export (C, u00200, "system__tasking__protected_objectsB");
   u00201 : constant Version_32 := 16#15001baf#;
   pragma Export (C, u00201, "system__tasking__protected_objectsS");
   u00202 : constant Version_32 := 16#56c470a2#;
   pragma Export (C, u00202, "system__soft_links__taskingB");
   u00203 : constant Version_32 := 16#e939497e#;
   pragma Export (C, u00203, "system__soft_links__taskingS");
   u00204 : constant Version_32 := 16#17d21067#;
   pragma Export (C, u00204, "ada__exceptions__is_null_occurrenceB");
   u00205 : constant Version_32 := 16#e1d7566f#;
   pragma Export (C, u00205, "ada__exceptions__is_null_occurrenceS");
   u00206 : constant Version_32 := 16#ff485338#;
   pragma Export (C, u00206, "system__tasking__protected_objects__entriesB");
   u00207 : constant Version_32 := 16#7daf93e7#;
   pragma Export (C, u00207, "system__tasking__protected_objects__entriesS");
   u00208 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00208, "system__restrictionsB");
   u00209 : constant Version_32 := 16#79d25869#;
   pragma Export (C, u00209, "system__restrictionsS");
   u00210 : constant Version_32 := 16#ff8eddb4#;
   pragma Export (C, u00210, "system__tasking__initializationB");
   u00211 : constant Version_32 := 16#fc2303e6#;
   pragma Export (C, u00211, "system__tasking__initializationS");
   u00212 : constant Version_32 := 16#0f96c370#;
   pragma Export (C, u00212, "system__tasking__task_attributesB");
   u00213 : constant Version_32 := 16#e81a3c25#;
   pragma Export (C, u00213, "system__tasking__task_attributesS");
   u00214 : constant Version_32 := 16#0eed7110#;
   pragma Export (C, u00214, "system__tasking__protected_objects__operationsB");
   u00215 : constant Version_32 := 16#ba36ad85#;
   pragma Export (C, u00215, "system__tasking__protected_objects__operationsS");
   u00216 : constant Version_32 := 16#e49898fa#;
   pragma Export (C, u00216, "system__tasking__entry_callsB");
   u00217 : constant Version_32 := 16#6342024e#;
   pragma Export (C, u00217, "system__tasking__entry_callsS");
   u00218 : constant Version_32 := 16#43cda1ce#;
   pragma Export (C, u00218, "system__tasking__queuingB");
   u00219 : constant Version_32 := 16#6dba2805#;
   pragma Export (C, u00219, "system__tasking__queuingS");
   u00220 : constant Version_32 := 16#66acc56c#;
   pragma Export (C, u00220, "system__tasking__utilitiesB");
   u00221 : constant Version_32 := 16#97705b7e#;
   pragma Export (C, u00221, "system__tasking__utilitiesS");
   u00222 : constant Version_32 := 16#1e07ca19#;
   pragma Export (C, u00222, "system__tasking__rendezvousB");
   u00223 : constant Version_32 := 16#5618a4d0#;
   pragma Export (C, u00223, "system__tasking__rendezvousS");
   u00224 : constant Version_32 := 16#ec6efe78#;
   pragma Export (C, u00224, "terrainB");
   u00225 : constant Version_32 := 16#bb167534#;
   pragma Export (C, u00225, "terrainS");
   u00226 : constant Version_32 := 16#947defa3#;
   pragma Export (C, u00226, "perlinB");
   u00227 : constant Version_32 := 16#65fe9455#;
   pragma Export (C, u00227, "perlinS");
   u00228 : constant Version_32 := 16#ec9cfed1#;
   pragma Export (C, u00228, "system__random_numbersB");
   u00229 : constant Version_32 := 16#f1b831a2#;
   pragma Export (C, u00229, "system__random_numbersS");
   u00230 : constant Version_32 := 16#15692802#;
   pragma Export (C, u00230, "system__random_seedB");
   u00231 : constant Version_32 := 16#69b0a863#;
   pragma Export (C, u00231, "system__random_seedS");
   u00232 : constant Version_32 := 16#fc54e290#;
   pragma Export (C, u00232, "ada__calendarB");
   u00233 : constant Version_32 := 16#31350a81#;
   pragma Export (C, u00233, "ada__calendarS");
   u00234 : constant Version_32 := 16#383fd226#;
   pragma Export (C, u00234, "system__val_unsB");
   u00235 : constant Version_32 := 16#33208002#;
   pragma Export (C, u00235, "system__val_unsS");
   u00236 : constant Version_32 := 16#26cbc451#;
   pragma Export (C, u00236, "vectorB");
   u00237 : constant Version_32 := 16#ba7f46fe#;
   pragma Export (C, u00237, "vectorS");
   u00238 : constant Version_32 := 16#9cbb0d81#;
   pragma Export (C, u00238, "system__tasking__stagesB");
   u00239 : constant Version_32 := 16#5fc08d5c#;
   pragma Export (C, u00239, "system__tasking__stagesS");
   u00240 : constant Version_32 := 16#e31b7c4e#;
   pragma Export (C, u00240, "system__memoryB");
   u00241 : constant Version_32 := 16#6bdde70c#;
   pragma Export (C, u00241, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.machine_code%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.win32%s
   --  ada.characters.handling%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap.os_interface%b
   --  system.mmap%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.val_lli%b
   --  system.val_llu%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  ada.numerics%s
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c.extensions%s
   --  interfaces.c.strings%s
   --  interfaces.c.strings%b
   --  system.fat_flt%s
   --  system.fat_llf%s
   --  ada.numerics.aux%s
   --  ada.numerics.aux%b
   --  ada.numerics.elementary_functions%s
   --  ada.numerics.elementary_functions%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_interface%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_lock%s
   --  system.task_lock%b
   --  system.task_primitives%s
   --  system.val_uns%s
   --  system.val_uns%b
   --  system.win32.ext%s
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.tasking%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.real_time.delays%s
   --  ada.real_time.delays%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.random_seed%s
   --  system.random_seed%b
   --  system.random_numbers%s
   --  system.random_numbers%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.task_attributes%b
   --  system.tasking.initialization%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%s
   --  system.tasking.utilities%b
   --  system.tasking.entry_calls%s
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.entry_calls%b
   --  system.tasking.rendezvous%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  gl_gl_h%s
   --  gl_glu_h%s
   --  perlin%s
   --  perlin%b
   --  sdl_blendmode_h%s
   --  sdl_error_h%s
   --  sdl_scancode_h%s
   --  stdarg_h%s
   --  stddef_h%s
   --  stdint_h%s
   --  sdl_stdinc_h%s
   --  sdl_h%s
   --  sdl_joystick_h%s
   --  sdl_keycode_h%s
   --  sdl_keyboard_h%s
   --  sdl_pixels_h%s
   --  sdl_rect_h%s
   --  sdl_rwops_h%s
   --  sdl_surface_h%s
   --  display%s
   --  display.image%s
   --  display.image%b
   --  sdl_touch_h%s
   --  sdl_gesture_h%s
   --  sdl_events_h%s
   --  sdl_video_h%s
   --  display.basic%s
   --  display.basic.glfonts%s
   --  display.basic.utils%s
   --  display.basic.utils%b
   --  display.basic.fonts%s
   --  display.basic.fonts%b
   --  display.basic%b
   --  display.basic.glfonts%b
   --  background%s
   --  background%b
   --  collision%s
   --  collision%b
   --  terrain%s
   --  terrain%b
   --  vector%s
   --  vector%b
   --  mars_lander%s
   --  mars_lander%b
   --  controller%s
   --  controller%b
   --  main%b
   --  END ELABORATION ORDER

end ada_main;
