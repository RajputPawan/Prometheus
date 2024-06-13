#!/bin/bash

export GEM_HOME=$HOME/.gem
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH

bundle exec jekyll serve
