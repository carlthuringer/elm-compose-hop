module ComposeRouteMain where

import Html exposing (..)
import Home.Feature exposing (createHomeFeature)

homeFeature = createHomeFeature
  { inputs = []
  , outputs = { }
  }

composeMainView : Html -> Html
composeMainView html = div [ ]
  [ ul []
    [ li [] [ text "Main" ] ]
  , hr [] []
  , div [] [ html ]
  ]

html : Signal Html
html = Signal.map composeMainView homeFeature.html

composeRouteMainFeature =
  { html = html }
