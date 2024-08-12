# Mob Programming for Research

## "Mob programming"?

[mobprogramming.org](https://mobprogramming.org/) describes it as "All the brilliant people working on the same thing, at the same time, in the same space, and on the same computer". These words are from Woody Zuill, one of the folks behind the original Agile Manifesto, who developed the practise as a way of recovering the _intention_ of agile software creation in a world of Scrum Coach certifications and process tooling. If you haven't done pair programming, then mob programming is more fun and easier (after a while).

It can offer a great team onboarding and skills development experience; help avoid fruitless paths of overcomplex development by involving many perspectives; and offers a project focus for getting to know one another through code. I can recommend it to any team, and offer a set of rules of thumb for making it work for research teams with relatively open-ended aims and a mix of coding proficiency levels.

There are some relatively formal rules for doing by-the-book mob programming.

* One person is the _driver_, and they don't make any decisions about the code or configuration that's being written - it all comes via other peoples' heads
* Another may be nominated as the _navigator_, primarily making the suggestions, or feedback may come negotiated from the whole group
* The role of driver rotates in quite short periods, 5 to 10 minutes, so everyone gets a go both at making decisions and taking instructions, and everyone feels like they have a stake in the code!

See this [tutorial walkthrough](https://www.baeldung.com/cs/mob-programming#bd-how-does-it-work) for an example of this classical approach - I've never done it this way apart from [in an intro workshop](https://ultrazool.gitlab.io/mobbing/) so can't speak to it well...

## Helping it work for research

The formal rules don't always work well in a research setting where there are a lot of speculative decisions to be made, different paths to go a short way down, and often complex dependencies. Here are some rules of thumb developed in different settings of mob programming with a mixed group of software engineers and researchers.

* Keep the group size to no more than 4, ideally 3 - larger than this, and people tend to drift off.
* Try to rotate the screenshare at least every 20 minutes to help keep everyone engaged, though there may be some settings where it makes sense for the least experienced person to "drive" the whole way through
* Sessions work well at a length of 1.5-2 hours, including a screenbreak; screenbreaks are important!
* When starting a new project or onboarding a new person, allow at least a whole session for environment setup
* The practise works well remotely, probably better than it does in-person (opinions may vary)
* Limit time spent mobbing to half a working day (typically 10:30-12:00, 2:00-4:00) or it can get cognitively exhausting; plan for quiet days
* Articulate shared intentions at the start of the session - where are we aiming to be at the end of it? It helps to take a note for the benefit of people who can't be there.
* Mob sessions are "best effort" and no-one should feel obliged to participate in them
* It's ok to spend whole sessions just reading code or papers together. 
* Optimise mob sessions for work _where decisions need to be made_ - if a path of development is very clearly laid out, leave that available for team members who need to work asynchronously (e.g. they have caring commitments, or very different patterns of brain-waking times)

The [Recurse Center social rules](https://www.recurse.com/social-rules) apply; kindness is key!

## What to watch out for 

Experience also says that starting to mob program with a new team can be a painful experience, what can happen is 

* Really experienced contributors can feel hobbled
* People without much background in coding can feel a bit lost
* Delivery can feel _much_ slower than hammering something out on one's own

Remember that you are optimising for learning rather than delivery in the early stages; as a [mob programming coach](https://code.joejag.com/2018/how-i-learned-mobbing.html) in Glasgow put it, lifting from an African proverb, *If you want to go fast, go alone; if you want to go far, go together*

Mob programming, especially at the start of a team or project, can feel slow; but there are a few ways in which it's inwardly speeding up - all working on the same code at once means there's no slow cycle of waiting for peer review or context switching to offer it, working branches can merge straight to `main` at the end of a session. Progress might feel like it's in smaller increments but it's also more continuously headed in a sound direction - avoid blind alleys, avoid thrashing on small blockages, quickly draw on multiple perspectives to detect fruitless overthinking. 

There is various tooling available to help, online mob timers, a commandline `mob` tool which neatly provides for ease of committing to a shared branch, or session sharing modes in VSCode, but experience has been that the tooling tends to get in the way of ongoing consensus and mutual respect for time and attention.    



