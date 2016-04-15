module Components.EpisodeList (model, view, update, Action, Model) where

import Html exposing (div, text, ul, li)
import Html.Events exposing (onClick)

import Data.Episodes exposing (orderedEpisodes)
import Models.Episode exposing (Episode)

type alias Model = Maybe Episode

model : Model
model = Nothing

view : Signal.Address Action -> Model -> Html.Html
view address model =
  div []
    [
      ul []
        <| List.map (li [])
        <| List.map (\x -> [text x.title]) orderedEpisodes
    ]

type Action = SelectEpisode Episode

update : Action -> Model -> Model
update (SelectEpisode episode) _ = Just episode
