module Home.Feature where

import StartApp
import Effects
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Debug exposing (watch)

import Common.Model exposing (Model, initialModel)
import Library.Util exposing (broadcast)

type Action
  = Update Model
  | NoOp

type alias Config =
  { inputs : List (Signal Action)
  , outputs : { onUpdatedMessage : List (Signal.Address Model) }
  }

type alias HomeFeature = StartApp.App Model

intoMessage : Model -> String -> Model
intoMessage model message = { model | message = message }

update services action model =
  case action of
    Update model -> (model, services.signalUpdate model NoOp)
    NoOp -> (model, Effects.none)

view address model = div []
  [ h1 [] [ text "Home Page" ]
  , label [ for "message" ] [ text "Message: " ]
  , input
    [ name "message"
    , value model.message
    , on "change" targetValue (\msg -> Signal.message address (Update (intoMessage model msg)))
    ] []
  , span [] [ em [] [ text model.message ]]
  ]

createHomeFeature : Config -> HomeFeature
createHomeFeature config =
  StartApp.start
    { init = (initialModel, Effects.none)
    , update = update { signalUpdate = broadcast config.outputs.onUpdatedMessage }
    , view = view
    , inputs = config.inputs
    }
