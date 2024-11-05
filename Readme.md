# Jasmin examples

Repository to demonstrate some algorithms using the [Jasmin programming language](https://github.com/jasmin-lang/jasmin).

The repository is structured so that each directory contains an example with a runner that call compiled jasmin code.

## Installation 

We provide a makefile to automatically compile examples to Shared Object (.so) files. You need to have both [gcc](https://gcc.gnu.org/) and a version of the jasmin-compiler in your path to compile examples.


### Using nix
You can get a valid version of the compiler by using [Nix package manager](https://nixos.org/). Just run : 
```
nix-shell
```

The nix environment built should contains all


## Building programs (and cleaning)


To build examples, just run : 
```
make all
```

This will build all Shared Object and put them corresponding example directory. 

If you want to build a specific example only, you can run : 
```
make <example-name>
```

To clean all builded .so files, just run : 
```
make clean
```

## Running programs

This project also aims to provide runner for each example. Depending on which languages the runner is implemented on, you will also need to install corresponding compilers/environment. For the moment, the following languages are used : 
* [Python3](https://www.python.org/)

Each example directory shoud contains a makefile to run it. One of our objectives is to provide references implementations for all thoses algorithms to check jasmin implementation validity.

