module About.Feature where

import Debug exposing (watch, log)
import StartApp exposing (App, start)
import Effects exposing (Effects)
import Html exposing (..)
import Common.Model exposing (Model, initialModel)

type Action
  = NoOp
  | Update Model

type alias Config =
  { inputs : List (Signal Action)
  , outputs : { }
  }

type alias AboutFeature = App Model

update : Action -> Model -> (Model, Effects Action)
update action model = log "action" (model, Effects.none)

view address model = div []
  [ h1 [] [ text "About Page" ]
  , h2 [] [ (text ("Message: " ++ model.message)) ]
  ]

createAboutFeature : Config -> AboutFeature
createAboutFeature config =
  start
    { init = (initialModel, Effects.none)
    , update = watch "updating"
    , view = view
    , inputs = config.inputs
    }
