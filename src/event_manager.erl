-module(event_manager).
-behaviour(gen_server).



-export([start_link/0]).
-export([subscribe/1, unsubscribe/1]).
-export([init/1, handle_call/3, handle_cast/2]).

start_link() ->
    gen_server:start_link({local, event_manager}, event_manager, [], []).

subscribe(Process) ->
    gen_server:call(event_manager, {subscribe, Process}).

unsubscribe(Process) ->
    gen_server:cast(event_manager, {unsubscribe, Process}).

init(_Args) ->
    {ok, cool}.

handle_call({subscribe, _Process}, _From, State) ->
    io:format("Subscribing...~n"),
    {reply, subscribe_ok, State};

handle_call({unsubscribe,_Process}, _From, State) ->
    io:format("Unsubscribing...~n"),
    {reply, unsubscribe_ok, State}.

handle_cast(_Anything, State) ->
    {noreply, State}.
