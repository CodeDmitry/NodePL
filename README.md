![fancy-image](https://raw.githubusercontent.com/dmitrymakhnin/nodepl/master/fancy-image.png)

# nodepl
implementing NodeJS practices in Perl 5 version 22

* modules: working core modules
  * core: pm modules
  * dynamic: pl modules meant to be "requiredpl"'d
* snippets: not sure how to describe
* unsorted: don't want to remember what I put here
* working_samples: use cases
* 

# Overview

## Why Perl?

Perl is available on pretty much every Unix-based system; PHP and JavaScript are not.

## Milestones in mind

- [x] Perl Object Notation: ability to turn a perl object to string, then evaluate that string back into an object, and then take a subroutine of the object and get it's code as a string, modify that string, evaluate that string into an object, put that object into the original object, and turn that object to string, and put that string into a file...

- [ ] A natural way of checking types. At the moment it's a bit strange with ref returning an empty string if it's a scalar, and overall not acting in a coherent way.

- [ ] A Perl runtime written in Perl that sets up global scope, as well as includes extension modules before evaluating the file passed to run. 

- [ ] A JS Closure wrapper that does prototypical blessing
