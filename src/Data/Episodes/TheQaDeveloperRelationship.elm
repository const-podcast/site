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

#### Show Notes
 - **Do not** put up a "do not disturb sign"
 - **Do** be open
 - [The programmer as a professional problem-solver](http://blog.codinghorror.com/can-your-team-pass-the-elevator-test/)
 - Recent movement to "automate everything" in last 5-6 years
 - We need both manual and automated testers
 - It makes sense for [Load Testing](https://en.wikipedia.org/wiki/Load_testing) to be automated
 - Some products are inherently difficult to write automated tests for (e.g. audio/visual)
 - If you are a manual tester, try to learn a language; If automated, try manual
 - [Bug Bash](https://en.wikipedia.org/wiki/Bug_bash)
 - Quality assurance happens before delivery and quality control comes after
 - [HP ALM](http://www8.hp.com/us/en/software-solutions/application-lifecycle-management.html)
 - "Don't become complacent to how they taught you in school"
 - There are websites for freelance QA work
 - [Rich Hickey on programmer meta-culture](https://www.youtube.com/watch?v=rI8tNMsozo0&feature=youtu.be&t=13m10s)
 - "QA is not needed" is a myth

"""
