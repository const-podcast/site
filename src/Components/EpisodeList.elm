module Components.EpisodeList (model, view, update, Action(..), Model, by) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Common.Styles exposing (linkStyle)
import Data.Episodes exposing (orderedEpisodes)
import Models.Episode exposing (Episode, formatGuests, episodeNumber)
import String

type alias Model = Maybe Episode

model : Model
model = Nothing

view : Signal.Address Action -> Model -> Html.Html
view address model =
  div
    []
    <| List.map (episodeCard address) orderedEpisodes

episodeCard : Signal.Address Action -> Episode -> Html.Html
episodeCard address episode =
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
    , p
        [
          style [
            ("color", "#ccc")
          , ("float", "right")
          ]
        ]
        [
          text <| episodeNumber episode
        ]
    , a
        []
        [
          h3
            [
              onClick address (SelectEpisode episode)
            , style [
                ("color", "#ccc")
              , ("margin-left", "90px")
              , ("cursor", "pointer")
              ]
            ]
            [
              text episode.title
            ]
          ]
    , p
        [
          style [
            ("color", "white")
          , ("margin-left", "90px")
          ]
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
          text <| String.slice 0 70 episode.summary
        , text "..."
        , br [] []
        , a
            [
              style [
                ("cursor", "pointer")
              , ("color", "#FF9F25")
              ]
            , onClick address (SelectEpisode episode)
            ]
            [
              text "(More and show notes...)"
            ]
        ]
    , div
        [
          style [("text-align", "center")]
        ]
        [
          audio
            [
              controls True
            ]
            [
              source
                [
                  src episode.url
                , type' "audio/mpeg"
                ]
                []
            ]
        , a
          [
            href episode.url
          , target "_blank"
          , style [
               ("color", "#FF9F25")
              , ("margin-right", "10px")
            ]
          ]
          [
            text "Download"
          ]
        , span [style [("color", "#ccc")]] [text "(right-click, \"Save As\")"]
        ]
      ]
    ]

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
