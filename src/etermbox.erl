-module(etermbox).
-export([ width/0, height/0, clear/0, set_clear_attributes/0, set_clear_attributes/2, present/0, set_cursor/2, change_cell/5, select_input_mode/1, select_output_mode/1, start_polling/1, stop_polling/0, shutdown/0, init/0]).

-nifs([width/0, height/0, clear/0, set_clear_attributes/0, set_clear_attributes/2, present/0, set_cursor/2, change_cell/5, select_input_mode/1, select_output_mode/1, start_polling/1, stop_polling/0, shutdown/0]).
-on_load(init/0).

init() ->
    erlang:load_nif("c_src/tmp/termbox_build/termbox_bindings", 0).

width() ->
    exit(nif_library_not_loaded).

height() ->
    exit(nif_library_not_loaded).

clear() ->
    exit(nif_library_not_loaded).

set_clear_attributes() ->
    exit(nif_library_not_loaded).

set_clear_attributes(_X,_Y) ->
    exit(nif_library_not_loaded).

present() ->
    exit(nif_library_not_loaded).

set_cursor(_X, _Y) ->
    exit(nif_library_not_loaded).

change_cell( _X1, _X2, _X3, _X4, _X5 ) ->
    exit(nif_library_not_loaded).

select_input_mode(_X) ->
    exit(nif_library_not_loaded).

select_output_mode (_X) ->
    exit(nif_library_not_loaded).

start_polling(_X) ->
    exit(nif_library_not_loaded).

stop_polling() ->
    exit(nif_library_not_loaded).

shutdown() ->
    exit(nif_library_not_loaded).
