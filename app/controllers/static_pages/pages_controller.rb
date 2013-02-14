require_dependency "static_pages/application_controller"

module StaticPages
  class PagesController < ApplicationController

    def index
      render_page("index")
    end

    def show
      render_page(params[:page])
    end

  private

    def render_page(page_name)
      page_name = page_name.to_s
      raise ActiveRecord::RecordNotFound unless is_safe?(page_name)

      respond_to do |format|
        format.html do
          begin
            render page_name
          rescue ActionView::MissingTemplate
            raise ActiveRecord::RecordNotFound
          end
        end
      end
    end

    def is_safe?(page_name)
      not (page_name.nil? or page_name =~ /[^\w\w_\-]/)
    end

  end
end
