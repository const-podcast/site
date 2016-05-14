module Components.EpisodeList (view, by) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String

import Common.Styles exposing (linkStyle)
import Components.EpisodeCard as Card
import Data.Episodes exposing (orderedEpisodes)
import Models.Episode exposing (Episode, formatGuests, episodeNumber)

view : Signal.Address Card.Action -> Card.Model -> Html.Html
view address model =
  div
    []
    <| List.map (Card.view address) orderedEpisodes

by : String -> Maybe Episode
by identifier =
  let
    matches = List.filter (\ep -> (==) identifier ep.identifier) orderedEpisodes
  in
    case matches of
      [] -> Nothing
      (match::hopefullyNotOthers) -> Just match
