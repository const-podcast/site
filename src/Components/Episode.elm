module Components.Episode (view) where

import Html exposing (div)

import Components.EpisodeCard as Card
import Models.Episode exposing (Episode)

view : Signal.Address Card.Action -> Episode -> Html.Html
view address model =
  div
    []
    [
      Card.view { fullSummary = False } address model
    ]
