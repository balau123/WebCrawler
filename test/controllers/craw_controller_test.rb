require 'test_helper'

class CrawControllerTest < ActionDispatch::IntegrationTest
  test "should get news" do
    get craw_news_url
    assert_response :success
  end

end
