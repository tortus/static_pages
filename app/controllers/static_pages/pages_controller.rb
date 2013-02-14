require_dependency "static_pages/application_controller"

module StaticPages
  class PagesController < ApplicationController

    layout 'application'

    def index
      render_page("index")
    end

    def show
      render_page(params[:page])
    end

  private

    def render_page(page_name)
      raise_404 unless is_safe?(page_name)

      respond_to do |format|
        format.html do
          begin
            render page_name
          rescue ActionView::MissingTemplate
            raise_404
          end
        end
      end
    end

    def is_safe?(page_name)
      page_name.is_a?(String) and not (page_name.nil? or page_name =~ /[^\w\w_\-]/)
    end

    def raise_404
      raise ActionController::RoutingError.new("Page Not Found")
    end

  end
end
