module Data.Episodes.TheGrind (episode) where

import Models.Episode exposing (Episode)

episode : Episode
episode = {
    title = "The Grind"
  , guests = []
  , summary = summary
  , identifier = "the-grind"
  , url = "https://s3.amazonaws.com/const/const.s01e01.the_grind.mp3"
  , icon = "grindstone-icon.png"
  }

summary : String
summary = """
In this episode Jeff and Gilli discuss the grind. A state of mind we all have
fallen into. The grind is characterized by heads-down, brute forced late
nights. Join us as we discuss the benefits and trade-offs of grind-state.
"""
