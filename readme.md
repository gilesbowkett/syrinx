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

## Unfinished

This project's a work in progress. Currently it contains a bunch of
useful objects for importing and filtering tweets, as well as a simple
Ruby script which uses those objects. The script's heavily inspired by
the style Gary Bernhardt uses in the Destroy All Software screencast
_Functional Core, Imperative Shell_, while most of the objects and specs
take their inspiration from other material in Destroy All Software,
especialy the _Sucks/Rocks_ series.

## Current use case: Terminal-tastic

If you set `download_tweets.bash` running in a cron job, with the
permissions necessary to create/edit a file called `since.csv`, you can
then run `functional_core_imperative_shell.rb` against it to see a list
of links along with who tweeted them. The list's sorted into categories,
which are easy to define in the Ruby script as a constant. It's a simple
toy example; the code has other capacities and my long-term goals for it
are a bit bigger.

