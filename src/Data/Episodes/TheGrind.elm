module Data.Episodes.TheGrind (episode) where

import Models.Episode exposing (Episode)

episode : Episode
episode = {
    title = "The Grind"
  , guests = []
  , summary = summary
  , identifier = "the-grind"
  , season = 1
  , episodeOfSeason = 1
  , url = "https://s3-us-west-2.amazonaws.com/constpodcast/const.s01e01.the_grind.mp3"
  , icon = "grindstone-icon.png"
  }

summary : String
summary = """
The grind is characterized by heads-down, brute forced late
nights. Join us as we discuss the benefits and trade-offs of grind-state.

#### Show Notes
 - [80/20 Principle (Pareto Principle)](https://en.wikipedia.org/wiki/Pareto_principle)
 - [10x developers](http://c2.com/cgi/wiki?DevelopersWithHighProductivityTenxHundredxThousandx)
 - [Thankless tasks](http://dictionary.reverso.net/english-cobuild/thankless%20task)
 - [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security)
 - [Correlation vs causation](https://en.wikipedia.org/wiki/Correlation_does_not_imply_causation)
 - ["Don't mistake activity with achievement" ~John Wooden](http://www.goodreads.com/quotes/47570-don-t-mistake-activity-with-achievement)
 - Critical thinkings is hard
 - [Barbara Liskov](https://en.wikipedia.org/wiki/Barbara_Liskov)
 - [Liskov substitution principle](https://en.wikipedia.org/wiki/Liskov_substitution_principle)
 - [SOLID principles](http://butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod)
 - [_Pragmatic Thinking and Learning_](https://pragprog.com/book/ahptl/pragmatic-thinking-and-learning)
 - [Andy Hunt on linear and rich modes](http://blog.toolshed.com/2015/01/l-moder-mode-and-the-default-mode-network-dmn.html)
 - [Stuck song syndrome](https://en.wikipedia.org/wiki/Earworm)
 - [_How to Fly a Horse_](http://www.amazon.com/How-Fly-Horse-Invention-Discovery/dp/0385538596)

"""
