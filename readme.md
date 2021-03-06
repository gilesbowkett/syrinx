# Syrinx

Syrinx (named after the aspect of avian anatomy which enables
birds to sing) is an attempt at Twitter filtering, summarization,
and aggregation. It's currently a library and hopefully will
also become an app or a mini-app. Its goal is to act as a drama
[firebreak](http://en.wikipedia.org/wiki/Firebreak), a redundancy
eliminator, an automatically-generated "best of" album, and an aid to
concentration and productivity.

## Basic plan

* Download tweets with `t` gem
* Filter, sort, summarize, and categorize
* Render as HTML
* Run process hourly
* Comprehensive hourly summary vs constant updates

When I first thought of this, I planned to call it Twitter Newspaper.
Twitter the company seems very attuned to the usefulness of its data
for real-time analysis, but they seem to have a huge blind spot for all
other use cases. Historical analysis of the past 24 hours, also known
as "the news," was wildly popular throughout the 18th, 19th, and 20th
centuries, and doesn't seem to be going away.

Syrinx should end up like a more stable version of [Hacker
Newspaper](http://hacker-newspaper.gilesb.com/), but for Twitter, plus
a few summarization and analysis features.

## Unfinished, experimental

This project's a work in progress. Currently it contains a bunch of
useful objects for importing and filtering tweets, as well as a simple
Ruby script which uses those objects. The script's heavily inspired by
the style Gary Bernhardt uses in the Destroy All Software screencast
_Functional Core, Imperative Shell_, while most of the objects and specs
take their inspiration from other material in Destroy All Software,
especialy the _Sucks/Rocks_ series.

## Current use case: Simple link-gatherer

If you set `download_tweets.bash` running in a cron job, with the
permissions necessary to create/edit a file called `since.csv`, you can
then run `functional_core_imperative_shell.rb` in a cron job as well to
auto-generate a list of links from Twitter. You can see example output
at http://twitter-links.gilesb.com. The list's sorted into categories,
but uses tables and has no CSS. It's a simple toy example; the code has
other capacities and my long-term goals for it are a bit bigger.

## Fixmes

* Fixtures in code, almost
* Lots of stylistic and structural problems (which are hopefully hard to spot)

