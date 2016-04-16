module Main where

import Html exposing (h1, div, text, a)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import StartApp.Simple as StartApp

import Common.Styles exposing (linkStyle)
import Components.Header as Header
import Components.Episode as Episode
import Components.EpisodeList as Episodes

main = StartApp.start {
    model = Episodes.model
  , view = view
  , update = update
  }

view : Signal.Address Action -> Episodes.Model -> Html.Html
view address model = div []
  [
    Header.view
  , case model of
      Nothing -> Episodes.view (Signal.forwardTo address ListAction) model
      Just episode -> div [] [
          a [
            style linkStyle
          , onClick address NavigateToEpisodeList
          ] [text "All episodes"]
        , Episode.view episode
        ]
  ]

type Action =
  NavigateToEpisodeList
  | ListAction Episodes.Action

update : Action -> Episodes.Model -> Episodes.Model
update action _ =
  case action of
    NavigateToEpisodeList -> Nothing
    ListAction (Episodes.SelectEpisode episode) -> Just episode
