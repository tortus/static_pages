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

    test "#is_safe? returns false for pages with non-alpha-numeric characters" do
      assert_equal(false, @controller.send(:is_safe?, "!"))
    end

    test "#is_safe? returns true for pages with letters, numbers, underscores, and minuses" do
      assert_equal(true, @controller.send(:is_safe?, "a1_-"))
    end

    test "#show raises RoutingError if params[:page] is not safe" do
      assert_raise ActionController::RoutingError do
        get :show, :page => "!", :use_route => :static_pages
      end
    end

  end
end
