---
title: helm-rubygems-org
layout: post
---
Today, I've released my first Emacs package. It is a
[helm](https://github.com/emacs-helm/helm) source for searching
gems on [rubygems.org](http://rubygems.org). When provided a search
pattern, the package uses rubygems.org's API to search gem names
that match the pattern. Helm, then, presents a list of possible gems.
Simply selecting an item in this list, and pressing the return key
saves a description of the gem suitable for a Gemfile to the kill ring; e.g.,
gem 'guard-rackunit', '~> 1.0.0'.

The package can be installed using Emacs' package manager. The package
is accessible via [melpa](http://melpa.milkbox.net).

The melpa page is [here](http://melpa.milkbox.net/#/helm-rubygems-org),
but the best reference can be found in the package's source code
respository on [github](https://github.com/neomantic/helm-rubygems-org)

The README has details for how to setup and use this helm source.
