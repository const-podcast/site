module Components.EpisodeList (model, view, update, Action, Model) where

import Html exposing (div, text, ul, li, a)
import Html.Attributes exposing (style, target)
import Html.Events exposing (onClick)

import Data.Episodes exposing (orderedEpisodes)
import Models.Episode exposing (Episode, properTitle)

type alias Model = Maybe Episode

model : Model
model = Nothing

view : Signal.Address Action -> Model -> Html.Html
view address model =
  div []
    [
      ul []
        <| List.map (\episode -> li [] [episodeLink address episode]) orderedEpisodes
    ]

episodeLink : Signal.Address Action -> Episode -> Html.Html
episodeLink address episode =
  a
    [target "_self", style linkStyle, onClick address (SelectEpisode episode)]
    [text <| properTitle episode]

linkStyle : List (String, String)
linkStyle = [
    ("text-decoration", "underline")
  , ("color", "blue")
  , ("cursor", "pointer")
  ]

type Action = SelectEpisode Episode

update : Action -> Model -> Model
update (SelectEpisode episode) _ = Just episode
