require "rails_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_path
    assert_response :success
  end
end
