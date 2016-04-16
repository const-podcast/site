module Components.EpisodeList (model, view, update, Action(..), Model) where

import Html exposing (div, text, h4, h3, a)
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
  a
    [onClick address (SelectEpisode episode)]
  [div
    [
      style [
        ("border", "4px solid black")
      , ("border-radius", "10px")
      , ("margin", "5px")
      , ("padding", "2px")
      , ("padding-left", "1em")
      , ("padding-right", "1em")
      , ("cursor", "pointer")
      , ("background-color", "#1C1C1C")
      ]
    ]
    [
      h3
        [
          style [("color", "#ccc")]
        ]
        [
          text episode.title
        ]
    , h4
        [
          style [("color", "white")]
        ]
        [
          text <| formatGuests episode.guests
        ]
    ]]

type Action = SelectEpisode Episode

update : Action -> Model -> Model
update (SelectEpisode episode) _ = Just episode
