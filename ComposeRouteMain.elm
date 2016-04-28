module ComposeRouteMain where

import Html exposing (..)
import Home.Feature exposing (createHomeFeature)
import About.Feature exposing (createAboutFeature, Action(Update))
import Common.Model exposing (initialModel)

aboutFeatureMailbox : Signal.Mailbox About.Feature.Action
aboutFeatureMailbox = Signal.mailbox (Update initialModel)

homeFeature = createHomeFeature
  { inputs = []
  , outputs =
    { onUpdatedMessage =
      [ Signal.forwardTo aboutFeatureMailbox.address Update ] }
  }

aboutFeature = createAboutFeature
  { inputs = [ aboutFeatureMailbox.signal ]
  , outputs = { }
  }

composeMainView : Html -> Html -> Html
composeMainView homeHtml aboutHtml = div [ ]
  [ ul []
    [ li [] [ text "Main" ] ]
  , hr [] []
  , div [] [ homeHtml ]
  , div [] [ aboutHtml ]
  ]

html : Signal Html
html = Signal.map2 composeMainView homeFeature.html aboutFeature.html

composeRouteMainFeature =
  { html = html }
