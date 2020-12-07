module Clock exposing (init)

import Browser
import Html exposing (..)
import Task
import Time

main =
  Browser.element
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL
type alias Model =
  { time: Time.Posix
  , zone: Time.Zone
  }


init : () -> (Model, Cmd Msg)
init _ =
  ( Model (Time.millisToPosix 0) Time.utc
  , Task.perform TimeZone Time.here
  )

-- UPDATE
type Msg
  = Tick Time.Posix
  | TimeZone Time.Zone

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime -> ({model | time = newTime}, Cmd.none)
    TimeZone newZone -> ({model | zone = newZone}, Cmd.none)


-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every 100 Tick

-- VIEW
view : Model -> Html Msg
view model =
    let
      hour = extract model Time.toHour
      minute = extract model Time.toMinute
      second = extract model Time.toSecond
    in
      h1 [] [ text ("Now: " ++ hour ++ ":" ++ minute ++ ":" ++ second) ]


extract : Model -> (Time.Zone -> Time.Posix -> Int) -> String
extract model fun = String.fromInt (fun model.zone model.time)
