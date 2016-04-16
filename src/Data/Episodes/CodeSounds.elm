module Data.Episodes.CodeSounds (episode) where

import Models.Episode exposing (Episode)

episode : Episode
episode = {
    title = "Code Sounds"
  , guests = ["Ethan Winograd"]
  , summary = summary
  }

summary : String
summary = """
# Test

This is a test of the markdown capabilities.
 - Thing
 - Other thing
 - [github](https://www.github.com)

"""
