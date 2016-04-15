module Main where

import StartApp.Simple as StartApp
import Html exposing (h1, div, text)

import Components.EpisodeList as Episodes

main = StartApp.start {
    model = Episodes.model
  , view = view
  , update = Episodes.update
  }

view : Signal.Address Episodes.Action -> Episodes.Model -> Html.Html
view address model = div []
  [
    h1 [] [text "const (the Podcast)"]
  , Episodes.view address model
  ]
