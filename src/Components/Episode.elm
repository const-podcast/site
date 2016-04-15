module Components.Episode (view) where

import Html exposing (h2, div, text)

import Models.Episode exposing (Episode)

type alias Model = Episode

view : Model -> Html.Html
view model =
  div []
    [
      h2 [] [text model.title]
    ]
