module Data.Episodes.SoftwareEngineeringLaws (episode) where

import Models.Episode exposing (Episode)

episode : Episode
episode = {
    title = "Software Laws"
  , guests = []
  , summary = summary
  , season = 1
  , episodeOfSeason = 2
  , identifier = "software-engineering-laws"
  , url = "https://s3-us-west-2.amazonaws.com/constpodcast/const.s01.e02.software.laws.mp3"
  , icon = "scroll-icon.png"
  }

summary : String
summary = """
There are many so-called engineering "laws". Some seem true, some
ridiculous. Join us as we discuss some of these more popular laws.
"""
