time_begin_period = external_define("scheduler.dll", "time_begin_period", dll_cdecl, ty_real, 1, ty_real);
time_end_period = external_define("scheduler.dll", "time_end_period", dll_cdecl, ty_real, 1, ty_real);
time_get_min_period = external_define("scheduler.dll", "time_get_min_period", dll_cdecl, ty_real, 0);
time_get_max_period = external_define("scheduler.dll", "time_end_period", dll_cdecl, ty_real, 0);
time_get_period = external_define("scheduler.dll", "time_get_period", dll_cdecl, ty_real, 0);
time_set_period = external_define("scheduler.dll", "time_set_period", dll_cdecl, ty_real, 1, ty_real);

external_call(time_begin_period, 1);