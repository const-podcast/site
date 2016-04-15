module Data.Episodes where

import Data.Episodes.CodeSounds exposing (codeSounds)
import Data.Episodes.ConfidenceInCode exposing (confidenceInCode)
import Data.Episodes.Queues exposing (queues)
import Data.Episodes.SoftwareEngineeringLaws exposing (swEngLaws)
import Data.Episodes.TheGrind exposing (theGrind)
import Data.Episodes.TheQaDeveloperRelationship exposing (qaDevRelationship)
import Models.Episode exposing (Episode)

orderedEpisodes : List Episode
orderedEpisodes = [
    codeSounds,
    queues,
    confidenceInCode,
    qaDevRelationship,
    swEngLaws,
    theGrind
  ]
