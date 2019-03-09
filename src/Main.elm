module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, div, h1, img, node, text)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)



---- MODEL ----


type alias Model =
    { counter : Int
    }


init : ( Model, Cmd Msg )
init =
    ( { counter = 0 }, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp
    | Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        Increment ->
            ( { model | counter = model.counter + 1 }, Cmd.none )

        Decrement ->
            ( { model | counter = model.counter - 1 }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Elm is working with Ionic v4!" ]
        , node "ion-button" [ onClick Increment ] [ text "+" ]
        , node "ion-button" [ onClick Decrement ] [ text "-" ]
        , Html.p [] [ text <| "Count is " ++ String.fromInt model.counter ]
        , img [ src "/logo.svg" ] []
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
