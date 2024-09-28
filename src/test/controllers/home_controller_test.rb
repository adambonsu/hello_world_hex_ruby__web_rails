# test/controllers/home_controller_test.rb
require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get home_index_url
        assert_response :success
    end

    test "should display Hello World" do
        get home_index_url
        assert_select 'h1', 'Hello, from HelloWorldHexRuby::Core :)!'
    end
end