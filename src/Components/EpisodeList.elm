module Components.EpisodeList (view, by) where

import Html exposing (div)

import Components.EpisodeCard as Card
import Data.Episodes exposing (orderedEpisodes)
import Models.Episode exposing (Episode)

view : Signal.Address Card.Action -> Card.Model -> Html.Html
view address model =
  let
    shortCard = Card.view { fullSummary = False } address
  in
    div
      []
      <| List.map shortCard orderedEpisodes

by : String -> Maybe Episode
by identifier =
  let
    matches = List.filter (\ep -> (==) identifier ep.identifier) orderedEpisodes
  in
    case matches of
      [] -> Nothing
      (match::hopefullyNotOthers) -> Just match
