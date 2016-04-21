module Data.Episodes where

import Data.Episodes.CodeSounds as CodeSounds
import Data.Episodes.ConfidenceInCode as ConfidenceInCode
import Data.Episodes.Queues as Queues
import Data.Episodes.SoftwareEngineeringLaws as SoftwareEngineeringLaws
import Data.Episodes.TheGrind as TheGrind
import Data.Episodes.TheQaDeveloperRelationship as TheQaDeveloperRelationship
import Models.Episode exposing (Episode)

orderedEpisodes : List Episode
orderedEpisodes = [
--    CodeSounds.episode,
--    Queues.episode,
--    ConfidenceInCode.episode,
--    TheQaDeveloperRelationship.episode,
--    SoftwareEngineeringLaws.episode,
    TheGrind.episode
  ]
