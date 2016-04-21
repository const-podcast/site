module Main where

import Effects
import Html exposing (h1, div, text, a)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import RouteHash
import StartApp
import Style
import Task

import Common.Styles exposing (linkStyle)
import Components.Header as Header
import Components.Episode as Episode
import Components.EpisodeList as Episodes

app =
  StartApp.start {
      init = (Episodes.model, Effects.none)
    , view = view
    , update = update
    , inputs = [ messages.signal ]
  }

main = app.html

port tasks : Signal (Task.Task Effects.Never ())
port tasks =
  app.tasks

messages : Signal.Mailbox Action
messages = Signal.mailbox NavigateToEpisodeList

port routeTasks : Signal (Task.Task () ())
port routeTasks =
    RouteHash.start
        { prefix = RouteHash.defaultPrefix
        , address = messages.address
        , models = app.model
        , delta2update = delta2update
        , location2action = location2action
        }

type alias Model = Episodes.Model

delta2update : Model -> Model -> Maybe RouteHash.HashUpdate
delta2update _ new = Just <| case new of
  Just episode -> RouteHash.set ["episode", episode.identifier]
  Nothing -> RouteHash.set ["episodes"]

location2action : List String -> List Action
location2action location = case location of
  ("episode"::identifier::[]) ->
    case Episodes.by identifier of
      Just episode -> [
          ListAction <| Episodes.SelectEpisode episode
        ]
      Nothing -> [UnknownEpisodeSought identifier]
  _ -> [NavigateToEpisodeList]

view : Signal.Address Action -> Model -> Html.Html
view address model =
  div
    [
      style [
        ("", "")
      ]
    ]
    [
      Header.view
    , div
        [
          style [
            ("background-color", "#848484")
          , ("padding-left","30%")
          , ("padding-right","30%")
          , ("padding-top","1em")
          ]
        ]
        [
          case model of
             Nothing -> Episodes.view (Signal.forwardTo address ListAction) model
             Just episode -> div [] [
                 a [
                   style linkStyle
                 , onClick address NavigateToEpisodeList
                 ] [text "All episodes"]
               , Episode.view episode
               ]
        ]
    , Html.node "style" [] [text appWideStyle]
    ]

type Action =
  NavigateToEpisodeList
  | ListAction Episodes.Action
  | UnknownEpisodeSought String

update : Action -> Model -> (Model, Effects.Effects Action)
update action _ =
  case action of
    ListAction (Episodes.SelectEpisode episode) -> (Just episode, Effects.none)
    _ -> (Nothing, Effects.none)

appWideStyle : String
appWideStyle =
  Style.rules
    [
      ( "body", [("background-color", "#848484")])
    ]
