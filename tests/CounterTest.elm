module CounterTest exposing (..)

import Test exposing (..)
import Test.Html.Selector exposing (class, text)
import ProgramTest exposing (clickButton, expectViewHas, start)
import Counter
import Browser exposing (sandbox)

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

setup = ProgramTest.createSandbox
  { init = Counter.init
  , update = Counter.update
  , view = Counter.view
  } |> start ()

