module Components.Header (view) where

import Html exposing (p, text, div)
import Html.Attributes exposing (style)

view : Html.Html
view =
  div
    [
      style [
          ("padding-left", "2em")
        , ("padding-top", "0.5em")
        , ("height", "100%")
      ]
    ]
    [
      p
        [
          style [
            ("color", "#F3953B")
          , ("height", "1em")
          , ("font-size", "2em")
          ]
        ]
        [
          text "const the Podcast"
        ]
    ]
