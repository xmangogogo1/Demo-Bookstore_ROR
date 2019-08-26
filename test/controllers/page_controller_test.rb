require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get question" do
    get page_question_url
    assert_response :success
  end

  test "should get news" do
    get page_news_url
    assert_response :success
  end

end
