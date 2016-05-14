module Components.EpisodeList (model, view, update, Action(..), Model, by) where

import Html exposing (div, text, h4, h3, span, img, p, a)
import Html.Attributes exposing (style, src, href, target)

import Common.Styles exposing (linkStyle)
import Data.Episodes exposing (orderedEpisodes)
import Models.Episode exposing (Episode, formatGuests, episodeNumber)

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
  span
    []
  [div
    [
      style [
        ("border-radius", "6px")
      , ("padding", "10px")
      , ("margin-bottom", "10px")
      , ("padding-left", "1em")
      , ("padding-right", "30px")
      , ("background-color", "rgba(9,10,14,0.7)")
      , ("max-width", "700px")
      ]
    ]
    [
      img
        [
          src <| "/images/" ++ episode.icon
        , style [
            ("height", "70px")
          , ("width", "70px")
          , ("border-radius", "4px")
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
          text episode.title,
          text " | ",
          text <| episodeNumber episode
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
    , h4
        [
          style [("color", "white")]
        ]
        [
          text <| formatGuests episode.guests
        ]
    , div [
          style [("text-align", "center")]
        ]
        [
          a
        [
          href episode.url
        , target "_blank"
        ]
        [
          text "Play / Download"
        ]
    ]]]

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
