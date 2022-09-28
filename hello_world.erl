-module(hello_world).
-export([run/0]).

run() ->
        etermbox:init(),
        Words = "Hello world",
        Z = lists:zip( Words , lists:seq(1, length(Words))),
        [etermbox:change_cell(2,I, L, 1 , 3) || {L, I} <- Z],
	etermbox:present(),
        timer:sleep(5000),
        etermbox:shutdown().
