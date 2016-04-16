module Components.Episode (view) where

import Html exposing (h2, div, text)
import Markdown

import Models.Episode exposing (Episode)

type alias Model = Episode

view : Model -> Html.Html
view model =
  div []
    [
      h2 [] [text model.title]
    , Markdown.toHtml model.summary
    ]
