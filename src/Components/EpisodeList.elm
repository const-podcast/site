module Components.EpisodeList (model, view, update, Action(..), Model, by) where

import Html exposing (div, text, h4, h3, a, img, p, iframe)
import Html.Attributes exposing (style, src)
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
      , ("min-height", "85px")
      ]
    ]
    [
      img
        [
          src <| "/images/" ++ episode.icon
        , style [
            ("height", "70px")
          , ("width", "70px")
          , ("border-radius", "10px")
          , ("border", "5px solid black")
          , ("float", "left")
          ]
        ]
        []
    , h3
        [
          style [
            ("color", "#ccc")
          , ("margin-left", "90px")
          ]
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
    , p
        [
          style [
            ("margin-left", "90px")
          , ("color", "white")
          ]
        ]
        [
          text <| episode.summary
        ]
    , iframe
        [
          src episode.url
        , style [
            ("height", "80px")
          ]
        ]
        [
        ]
    ]]

type Action = SelectEpisode Episode

update : Action -> Model -> Model
update (SelectEpisode episode) _ = Just episode

by : String -> Maybe Episode
by identifier =
  let
    matches = List.filter (\ep -> (==) identifier ep.identifier) orderedEpisodes
  in
    case matches of
      [] -> Nothing
      (match::hopefullyNotOthers) -> Just match
