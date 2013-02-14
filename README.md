Static Pages
============

This is an extremely simple rails 3.2+ engine that lets you create static
pages just by adding templates to your views directory.

Installation
------------

Add this line to your Gemfile, and run bundle install:

    gem 'static_pages', :git => 'https://github.com/tortustechnologies/static_pages.git'

Add this line to config/routes.rb, probably below everything else so
you don't accidentally overwrite another controller's routes by adding
a page:

    mount StaticPages::Engine, :at => '/'

Change '/' to whatever path you would prefer pages being accessible at.

Usage
-----

1. Create a template in app/views/static_pages/pages, for example: test.html.erb
2. Visit "/test" in your browser
3. That's it!
