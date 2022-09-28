etermbox
=====

Low-level termbox bindings for Erlang.

For high-level, declarative terminal UIs, If there is another, let me know.

Getting Started

Etermbox implements the termbox API functions via NIFs:

- init/0
- shutdown/0
- width/0
- height/0
- clear/0
- present/0
- put_cell/1
- change_cell/5
- poll_event/1


Hello World

Let's go through the bundled hello world example. To follow along, clone this repo and edit the example.

This repository makes use of Git submodules, so make sure you include them in your clone. In recent versions of git, this can be accomplished by including the --recursive flag, e.g.

    # git clone --recursive d https://github.com/termbox/termbox2.git

When the clone is complete, the c_src/termbox2/ directory should have files in it.

In a real project, you'll probably want to use an OTP application with a proper supervision tree, but here we'll keep it as simple as possible.


Compiling the library.

    # rebar3 compile

We'll add the standard boilerplate and begin the function run() which will contain the main part of the code.

    -module("hello-world").

    -export([run/0]).

    run() ->

Next, we initialize the termbox application. This initialization should come before any other termbox functions are called. (Otherwise, your program will probably crash.)

    ok = termbox:init(),

    %% not implemented
    {ok, _Pid} = event_manager:start_link(),

    %% also not implemented.
    ok = event_manager:subscribe(self()),

To render content to the screen, we use put_cell/5.

    %% totally implemented.
    change_cell(X,Y, Char, FG, BG)

I'm going to be honest, its a single character at a specific x/y location.  Oh man how annoying.

You'd need to some trickery , but eventually i'll get tb_printf ported, so you can do whole strings.

The position is a struct representing an (x, y) cartesian coordinate. The top-left-most cell of the screen represents the origin (0, 0).

The ch should be a character representing the character.

    GreetingWords = "Hello world",
    Z = lists:zip( GreetingWords , lists:seq(1, length(GreetingWords))),
    [complex6:change_cell(I, 2,  Char, 1 , 3) || {Char, I} <- Z],

Until now, we've only updated termbox's internal buffer. To actually render the content to the screen, we need to call present/0.

    etermbox:present()

When a key is pressed, it'll be sent to us by the event manager (this is not implemented yet) Once we receive a 'q' key press, we'll shut down the application.

    receive
        'q' ->
            termbox:shutdown()
    end,

You can use this event-handling logic to respond to events any way you like---e.g., render different content, switch tabs, resize content, etc.

Finally, run the example like this:


    $ erl -noshell -s termbox run

You should see the text we rendered and be able to quit with 'q'.

Installation

Add etermbox as a dependency in your project's rebar.config

    {deps,[
      %% Source Dependencies
      {etermbox, {git, "https://github.com/wmealing/etermbox.git", {branch, "master"}}}
       ..
    ]}.

So far the build has been tested on macOS and a few Linux distros. Please add an issue if you encounter any problems with the build.

At the moment, i have'nt tested it, will keep hacking on it in the short term.

