![fancy-image](https://raw.githubusercontent.com/dmitrymakhnin/nodepl/master/fancy-image.png)

# nodepl
simulating NodeJS runtime environment/practices in Perl 5 version 22

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
<li><a href="#available">available</a></li>
<li><a href="#fast">fast</a></li>
<li><a href="#flexible">flexible.</a></li>
  <li>free.</li>
  <li>underhyped.</li>
  <li>well documented.</li>
  <li>has many existing packages.</li>
</ol>

#### <a name="available">Perl is available</a>

You can trust Perl is there on every reasonable unix system. If it isn't, you can get it anyway.

#### <a name="fast">Perl is fast</a>

Perl has been reported to run 2.15 times slower than C++. Keep in mind that our current processors
do instructions 0 time for nearly all concerns, meaning that the slowness of programs is always a consequence
of blocking the main thread, not due to how many instructions are executed, as a single processor can execute billions of instructions per second.

#### <a name="flexible">Perl is flexible</a>

You can do anything in Perl that you can do in any other language, and it's not too hard to compile your own language to perl with perl at runtime. In essence, even if you don't like Perl, you can write Python with Perl that will run faster than
Python. You can do the opposite too but Perl is more flexible(eg multiline anonymous functions, language level regular expressions, dictionaries).









