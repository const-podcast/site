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

#### Show Notes
 - [Phil Haack's list we followed](http://haacked.com/archive/2007/07/17/the-eponymous-laws-of-software-development.aspx/)
 - [Postel's Law](https://en.wikipedia.org/wiki/Robustness_principle)
 - [Hypermedia](https://en.wikipedia.org/wiki/Hypermedia)
 - [Function Overloading](https://msdn.microsoft.com/en-us/library/5dhe1hce.aspx)
 - [Parkinson's Law](https://en.wikipedia.org/wiki/Parkinson%27s_law)
 - [Kanban](https://en.wikipedia.org/wiki/Kanban)
 - [Phil Haack](http://haacked.com/about/)
 - [Pareto Principle](https://en.wikipedia.org/wiki/Pareto_principle)
 - [Previous episode: the Grind](http://www.constpodcast.com/#!/episode/the-grind)
 - [Sturgeon's Law](https://en.wikipedia.org/wiki/Sturgeon%27s_law)
 - [The Peter Principle](https://en.wikipedia.org/wiki/Peter_principle)
 - [The Dilbert Principle](https://en.wikipedia.org/wiki/Dilbert_principle)
 - [Hofstadter's Law](https://en.wikipedia.org/wiki/Hofstadter%27s_law)
 - [Analysis Paralysis](https://en.wikipedia.org/wiki/Analysis_paralysis)
 - [Murphy's Law](https://en.wikipedia.org/wiki/Murphy%27s_law)
 - [Brook's Law](https://en.wikipedia.org/wiki/Brooks%E2%80%99_law)

"""
