[![Gem Version](https://badge.fury.io/rb/domain_driven.png)](http://badge.fury.io/rb/domain_driven) 

# Gem Status 
As of 4 March 2014, Incomplete Extraction.  
This gem is in the process of being extracted from a reference architecture RubyOnRails application.

# DomainDriven

This gem and set of techniques allow you to use *DDD* to controll complexity and dependencies as your RubyOnRails application grows.  The additional benefit is that since core domain logic is decoupled from the Rails framework and database, automated tests of the core domain logic can run very fast. 

## Domain Driven Design (DDD)

[Domain-driven design (DDD)](http://en.wikipedia.org/wiki/Domain-driven_design) is an approach to software development for complex needs by connecting the implementation to an evolving model. The premise of domain-driven design is the following:
* Placing the project's primary focus on the core domain logic.
* Basing complex designs on a model of the domain.
* Initiating a creative collaboration between technical and domain experts to iteratively refine a conceptual model that addresses particular domain problems.
The term was coined by Eric Evans in his [book](https://itunes.apple.com/us/book/domain-driven-design-tackling/id502848358?mt=11).


## Goals

* Preserve the goodness of ActiveRecord.
* Run automated tests fast and without loading Rails.
* Provide generators to help with the plumbing.
* Decouple core domain logic from the larger Rails set of libraries.


## Installation

Add this line to your application's Gemfile:

    gem 'domain_driven'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install domain_driven

## Usage

Under constuction 

## Constraints

* Rails 4+
* Ruby 2+

## Credits

*[Jim Weirich](https://github.com/jimweirich)*
For conversations explaining to us the ideas inside [wyriki](https://github.com/jimweirich/wyriki) 

*[Eric Evans](http://www.domainlanguage.com)*
For providing the concept of Domain Driven Design


## Contributing

1. Fork it ( http://github.com/mwindholtz/domain_driven/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

