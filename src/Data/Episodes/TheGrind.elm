module Data.Episodes.TheGrind (episode) where

import Models.Episode exposing (Episode)

episode : Episode
episode = {
    title = "The Grind"
  , guests = []
  , summary = summary
  , identifier = "the-grind"
  , url = "https://s3-us-west-2.amazonaws.com/constpodcast/const.s01e01.the_grind.mp3"
  , icon = "grindstone-icon.png"
  }

summary : String
summary = """
The grind is characterized by heads-down, brute forced late
nights. Join us as we discuss the benefits and trade-offs of grind-state.
"""
