module Components.Header (view) where

import Html exposing (p, text, div)
import Html.Attributes exposing (style)

view : Html.Html
view =
  div
    [
      style [
        ("background-color", "black")
        , ("padding-left", "2em")
        , ("padding-top", "1em")
        , ("height", "100%")
      ]
    ]
    [
      p
        [
          style [
            ("color", "#18D42F")
          , ("height", "1.5em")
          , ("font-size", "1.5em")
          ]
        ]
        [
          text "const the Podcast"
        ]
    ]
