require "test_helper"

class Public::OutfitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_outfits_index_url
    assert_response :success
  end

  test "should get show" do
    get public_outfits_show_url
    assert_response :success
  end
end
