module Components.EpisodeCard (view, update, Model, Action(..)) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown
import String

import Models.Episode exposing (Episode, formatGuests, episodeNumber)
import Html.Events exposing (onClick)

type alias Options = {
    fullSummary : Bool
  }

view : Options -> Signal.Address Action -> Episode -> Html.Html
view opts address episode =
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
    , a
        [
          style [
            ("color", "#ccc")
          , ("float", "right")
          , ("cursor", "pointer")
          ]
          , onClick address (SelectEpisode episode)
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
    , summary opts address episode
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

type alias Model = Maybe Episode

type Action = SelectEpisode Episode

update : Action -> Model -> Model
update (SelectEpisode episode) _ = Just episode

summary : Options -> Signal.Address Action -> Episode -> Html.Html
summary opts =
  case opts.fullSummary of
    False -> fullSummary opts
    _ -> clickForMore opts

-- Markdown.toHtml model.summary

fullSummary : Options -> Signal.Address Action -> Episode -> Html.Html
fullSummary opts address episode =
  div
    [
      style [
        ("color", "white")
      ]
    ]
    [
      Markdown.toHtml episode.summary
    ]

clickForMore : Options -> Signal.Address Action -> Episode -> Html.Html
clickForMore opts address episode =
  p
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
