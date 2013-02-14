Static Pages
============

This is an extremely simple rails 3.2+ engine that lets you create static
pages by simple adding templates to your views directory.

Installation
------------

Add this line to your Gemfile, and run bundle install:

    gem 'static_pages', :git => 'https://github.com/tortustechnologies/static_pages.git'

in config/routes.rb:

    mount StaticPages::Engine, :at => '/'

Change '/' to whatever path you would prefer pages being accessible at.

Usage
-----

1. Create a template in app/views/static_pages/pages, e.g. test.html.erb
2. Visit /test in your browser
3. That's it!
