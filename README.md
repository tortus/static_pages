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

If you create index.html, it will be used as your site's home page if you have
no other "root" specified.

Additional Notes
----------------

Uses a wildcard route:

    match ':page(.:format)' => 'pages#show', :as => :page

The controller functionality basically boils down to:

    render params[:page]

It ensures that params[:page] is a string, and that it only contains
alpha-numeric characters. If params[:page] is unsafe, an
ActionController::RoutingException is raised.

If the template isn't found, the ActionView::TemplateNotFound
exception is caught and re-thrown as ActionController::RoutingError.

Non-HTML Formats
----------------

Currently the pages controller only responds to the HTML format.
