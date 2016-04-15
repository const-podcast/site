module Main where

import Html exposing (h1, div, text)
import StartApp.Simple as StartApp

import Components.Episode as Episode
import Components.EpisodeList as Episodes

main = StartApp.start {
    model = Episodes.model
  , view = view
  , update = Episodes.update
  }

view : Signal.Address Episodes.Action -> Episodes.Model -> Html.Html
view address model = div []
  [
    h1 [] [text "const the Podcast"]
  , case model of
      Nothing -> Episodes.view address model
      Just episode -> Episode.view episode
  ]
