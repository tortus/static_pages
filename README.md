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

Creating a Page
---------------

1. Create a template in *app/views/static_pages/pages/*,
   for example: *app/views/static_pages/pages/test.html.erb*
2. Visit "/test" in your browser

If you create index.html, it will be used as your site's home page if you have
no other "root" specified.

Linking to a Page
-----------------

Use the **static_pages.page_path** helper:

    static_pages.page_path("page_template_name_here")

How it works
------------

Uses a wildcard route:

    match ':page(.:format)' => 'pages#show', :as => :page

The controller functionality basically boils down to:

    render params[:page]

If the template isn't found, the ActionView::TemplateNotFound
exception is caught and re-thrown as ActionController::RoutingError.

Security
--------

The pages controller ensures that params[:page] is a string, and that it
only contains alpha-numeric characters before calling render. If the page
does not meet these criteria, an ActionController::RoutingException is raised.

Non-HTML Formats
----------------

Currently the pages controller only responds to the HTML format.
