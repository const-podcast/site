module Data.Episodes.TheQaDeveloperRelationship (episode) where

import Models.Episode exposing (Episode)

episode : Episode
episode = {
    title = "The QA-Developer Relationship"
  , guests = ["Coilynn Buford"]
  , summary = summary
  , identifier = "qa-dev-relationship"
  , season = 1
  , episodeOfSeason = 3
  , url = "https://s3-us-west-2.amazonaws.com/constpodcast/const.s01e03.dev.qa.relationship.mp3"
  , icon = "magnify-bug-icon.png"
  }

summary : String
summary = """
The relationship between QAs and developers can truly make or break a product.
Join us as we discuss ways developers can help make this relationship flourish.
"""
