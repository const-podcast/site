module Models.Episode (Episode) where

type alias Episode = {
    title : String
  , guests : List String
  , summary : String
  }
