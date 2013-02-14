require 'test_helper'

module StaticPages
  class PagesControllerTest < ActionController::TestCase

    test "index" do
      get :index, :use_route => :static_pages
      assert_response :success
      assert_template "index"
    end

    test "page in host application" do
      get "dummy_page", :use_route => :static_pages
      assert_response :success
      assert_template "dummy_page"
    end

  end
end
