# test/controllers/home_controller_test.rb
require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get home_index_url
        assert_response :success
    end

    test "should display Hello World by default" do
        get home_index_url
        assert_select "h1", "Hello, World!"
    end

    test "should display Hello with custom username" do
        get home_index_url(name: "Nefertari")
        assert_select "h1", "Hello, Nefertari!"
    end
end
