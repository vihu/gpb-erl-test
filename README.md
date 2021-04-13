gpb_erl_test
=====

An OTP application

Build
-----

    $ ./rebar3 compile


Test
-----

    $ ./rebar3 eunit

Expectation
-----

We expect the `invalid_test` to fail since it tries to enc/dec a 72 bit int while the proto specifies a 64 bit int.

