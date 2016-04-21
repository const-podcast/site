module Components.Episode (view) where

import Html exposing (h2, div, text, iframe, a, br)
import Html.Attributes exposing (..)
import Markdown

import Models.Episode exposing (Episode)

type alias Model = Episode

view : Model -> Html.Html
view model =
  div []
    [
      h2 [] [text model.title]
    , iframe
        [
          src model.url
        , style [
            ("height", "80px")
          ]
        ]
        [
        ]
    , br [] []
    , a [
        href model.url
      , style [
        ("cursor", "pointer")
        ]
      ] [text "Download"]
    , Markdown.toHtml model.summary
    ]
