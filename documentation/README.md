# Documentation

The goal of this directory is to keep track of various ideas.

Ideally, much of the potential comments in source code are better put into documentation
    than into the source code.
    
The idea of this project was to bring some concepts I learnt after playing with NodeJS for a few years to Perl, most importantly concept of "require" over packages.    
    
"core" means that it uses perl standard package system.

"dynamic" means that it uses javascript-style "require"/"eval" loading method, which I wanted to be more popular while making this project.

perl packages must end in 1 by convention.

The NodePL directory contains 
1. promise.pm which is a perl package(which is necessary to bless the promise objects with a first class promise type,
   rather than simply an opaque hash table). Behaves isomorphically to ecmascript Promise object found in modern browsers   
2. perl.pm contains handy perl utilities such as support for eval(stringify(perl object notation)) = perl object notation support(but with support for subroutine objects as well), nodejs style require,
   typeof(by default, perl is a little confusing when it comes to getting type of things), spawn takes a passed subroutine and runs it on its own thread,
   arity gets length of the given array.
3. fs.pm provides really handy utilities such as with(filename, callbacksubroutine) which handles opening and closing the file for reading and performs
   the subroutine in the critical section. get_contents and get_contents_async.
4. console.pm provides console::log service that naively tries to pretend it works similarly to ecmascript console::log.

   
**Not obvious perl technique 1**: If a subroutine is defined inside a package, it may be called by package->subroutine, which passes 'package' as the first argument
    to the subroutine, whereas if package::subroutine is used, the first argument is the first argument as expected. To always strip the package regardless
    of how it was called, below is found throughout my code, at start of subroutines.

    shift @_ 
        if (defined $_[0] and $_[0] eq __PACKAGE__);
