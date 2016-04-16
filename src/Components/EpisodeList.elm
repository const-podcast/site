module Components.EpisodeList (model, view, update, Action(..), Model) where

import Html exposing (div, text, h4, h3)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)

import Common.Styles exposing (linkStyle)
import Data.Episodes exposing (orderedEpisodes)
import Models.Episode exposing (Episode, formatGuests)

type alias Model = Maybe Episode

model : Model
model = Nothing

view : Signal.Address Action -> Model -> Html.Html
view address model =
  div
    []
    <| List.map (episodeLink address) orderedEpisodes

episodeLink : Signal.Address Action -> Episode -> Html.Html
episodeLink address episode =
  div
    [
      style [
        ("border", "1px solid black")
      , ("border-radius", "10px")
      , ("margin", "5px")
      , ("padding", "2px")
      , ("padding-left", "1em")
      , ("padding-right", "1em")
      , ("cursor", "pointer")
      ]
    , onClick address (SelectEpisode episode)
    ]
    [
      h3
        [
        ]
        [
          text episode.title
        ]
    , h4
        [
        ]
        [
          text <| formatGuests episode.guests
        ]
    ]

type Action = SelectEpisode Episode

update : Action -> Model -> Model
update (SelectEpisode episode) _ = Just episode
