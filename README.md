# Nekopit

This Project is supposed to make it possible to have a dual System to write single Class instacnes to either statically generate Pages AND also be able to use Hashlink to open a dynamic Server. Depending on Projects needs this can be leveraged to have a static Site first, but be easily able to just make it dynamic if it is required.

A Statically build site will be build trough nodejs tooling, whilst the dynamic Server will be a pure HTTP implementation into Hashlink.

### Why the name?

This was originally intended to only be a neko playaround project. I kinda expanded it to being an JS/HL Project instead. (For eperformance reasons)

While testing i saw that HL has an as good, if not even better performance than NodeJS raw performance. (Empty page load)

This should scale really well into bigger sites and it's primarilly a test to see if it will be as useful as i am thinking. And maybe even implementing hpp will be an option later too.

## How to build&start

1. Clone this repo.
    - Install dependencies for node (`npm i .`)
    
    OR

    - Install dependencies for Haxe to get autocomplete. 
    (`haxelib install hxnodejs 12.1.0 `)

2. Run build script
    - Run either ./buildscripts/build-and-run-js.sh

    OR

    - Run either ./buildscripts/build-and-run-hl.sh

There is currently no way to watch for file changes or build for C++.
