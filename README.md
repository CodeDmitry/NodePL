![fancy-image](https://raw.githubusercontent.com/dmitrymakhnin/nodepl/master/fancy-image.png)

# nodepl
This project attempts to bring some concepts from NodeJS in Perl5

* modules: working core modules
  * core: pm modules
  * dynamic: pl modules meant to be "requiredpl"'d
* snippets: not sure how to describe
* unsorted: don't want to remember what I put here
* working_samples: use cases

# Overview

## Why Perl?

Perl is 

<ol>
  <li>available, Perl is available everywhere, and if it isn't there are ways to get it, eg [perlito](https://github.com/CodeDmitry/perlito5-cached-jar) which allows you to run it from Java.</li>
  <li>fast(Not sure what the current benchmarks are, and i'm pretty sure it will foreve, but at the time I made the project, it was faster than JavaScript)</li>
  <li>powerful - makes easy things easy and hard things possible.</li>
  <li>flexible(There is more than one way to do practically everything).</li>
  <li>free.</li>
  <li>underappreciated(JSON is all the rage nowadays, Perl had that before it, Lisp could implemented it but didn't quite have it, and the accessability of RegExp as a core feature of the language is unmatched).</li>
  <li>well documented and its behavior is well understood(even if you personally don't).</li>
  <li>has many existing packages - granted, Perl package system is ugly and I made this project in hopes of putting some of it into a more dynamic but simpler to understand hash based structure analogous to NodeJS's eval based require system.</li>
  <li>magical - Perl is full of advanced language features enabling you to extend the language itself in ways no other scripting languages except perhaps Lisp(lisp is special, as you can redefine numbers in that language, if properly implemented) allow.</li>
</ol>



