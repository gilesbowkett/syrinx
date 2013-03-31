# syrinx (as in syrinx.gilesb.com)

Syrinx (named after the aspect of avian anatomy which
enables birds to sing) is an attempt at Twitter filtering,
summarization, and aggregation. Its goal is to act as a drama
[firebreak](http://en.wikipedia.org/wiki/Firebreak), a redundancy
eliminator, an automatically-generated "best of" album, and an aid to
concentration and productivity.

## drama firebreak

I believe the speed and shallowness of tweets, along with other aspects of [Twitter's design, exacerbates programmer drama](http://gilesbowkett.blogspot.com/2013/03/twitter-might-just-be-poison.html). 
I also find Twitter very useful as a source of interesting news and
as a way to keep in touch with friends. One goal with Syrinx is to
read Twitter while filtering out drama. I want Syrinx to achieve that
by introducing a delay between any given explosion of drama and my
perception of it, and also by summarizing drama rather than giving me
every last detail.

Many Twitter clients supply "mute" features, which you could also use
to filter out drama, but the reason I want Syrinx to give me delay and
summarization instead is that I do want to keep in touch with open
source politics and culture; it's just that I don't want it 24/7, as
that's exhausting.

## redundancy eliminator

You sometimes see the same link or joke RTed more times than necessary.
[It's trivial to prevent that with
code](http://gilesbowkett.blogspot.com/2010/11/blog-comment-similarity-detector-free.html),
and this is an important goal for Syrinx.

## automatically-generated "best of" album

No programmer should ever do tedious and repetitive work with text.
Tedious and repetitive work is for computers to do, and text processing
is a trivial subset of programming, and has been so for many decades.
Filtering tweets is sometimes tedious and repetitive work. Therefore,
it's for computers to do.

## aid to concentration and productivity

Among programmers, Twitter works like a weird synthesis of IRC channels
and aggregator sites like Reddit or Hacker News. I built a filter for
Hacker News called [Hacker Newspaper](http://hacker-newspaper.gilesb.com/),
because I think aggregator sites have problems of their own. I avoid
chat software and IRC channels, because most research on productivity
shows that you see very strong benefits when you're able to concentrate.
But there's limits to the value of that; you don't want to be totally
isolationist.

I hosts-ban Twitter about once a month, redirecting the domain to
127.0.0.1, and this has been the case since at least 2008. I also often
dive in and use Twitter for trivial chatter all day long. My hope is
that Syrinx will operate as a middle ground between not using Twitter at
all and being totally plugged into it at all times.

## weird spec/lib design

I want to experiment with the design style shown in the Destroy All Software
['Sucks/Rocks'](https://www.destroyallsoftware.com/screencasts/catalog/sucks-rocks-1-the-rails-app)
series of screencasts. Since this app is in part a design experiment,
it's going to have some quirks. Also, it's not exactly the style in
the screencasts, but definitely a style inspired by them; and it does
represent some degree of compromise between the desires to write fast,
readable, clean code; to write it quickly; and to deploy something
immediately.

