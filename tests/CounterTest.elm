module CounterTest exposing (..)

import Browser exposing (sandbox)
import Counter
import ProgramTest exposing (clickButton, expectViewHas, start)
import Test exposing (..)
import Test.Html.Selector exposing (class, text)


suide : Test
suide =
    describe "Counter"
        [ test "default value" <|
            \() ->
                setup |> expectViewHas [ text "0" ]
        , test "increment value" <|
            \() ->
                setup
                    |> clickButton "+"
                    |> clickButton "+"
                    |> expectViewHas [ text "2" ]
        , test "decrement value" <|
            \() ->
                setup
                    |> clickButton "-"
                    |> clickButton "-"
                    |> expectViewHas [ text "-2" ]
        ]


setup =
    ProgramTest.createSandbox
        { init = Counter.init
        , update = Counter.update
        , view = Counter.view
        }
        |> start ()
