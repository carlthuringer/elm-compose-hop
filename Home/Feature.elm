module Home.Feature where

import StartApp exposing (App, start)
import Effects
import Html exposing (..)

type Action = NoOp

type alias Config =
  { inputs : List (Signal Action)
  , outputs : { }
  }

type alias Model = { }

type alias HomeFeature = App Model

initialModel = ({ }, Effects.none)

update action model = (model, Effects.none)

view address model = h1 [] [ text "Home Page" ]

createHomeFeature : Config -> HomeFeature
createHomeFeature config =
  start
    { init = initialModel
    , update = update
    , view = view
    , inputs = config.inputs
    }
