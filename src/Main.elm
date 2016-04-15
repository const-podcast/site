module Main where

import Html exposing (div, button, text, h1, ul, li)
import Html.Events exposing (onClick)
import StartApp.Simple as StartApp
import Data.Episodes exposing (orderedEpisodes)

main =
  StartApp.start { model = model, view = view, update = update }

model = 0

view address model =
  div []
    [
      h1 [] [text "const (the Podcast)"]
      , ul []
        <| List.map (li [])
        <| List.map (\x -> [text x.title]) orderedEpisodes
    ]


type Action = Increment | Decrement

update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1
