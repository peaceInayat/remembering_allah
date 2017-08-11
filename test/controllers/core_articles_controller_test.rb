require 'test_helper'

class CoreArticlesControllerTest < ActionController::TestCase
  setup do
    @core_article = core_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:core_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create core_article" do
    assert_difference('CoreArticle.count') do
      post :create, core_article: { body: @core_article.body, rank: @core_article.rank, title: @core_article.title, user_id: @core_article.user_id }
    end

    assert_redirected_to core_article_path(assigns(:core_article))
  end

  test "should show core_article" do
    get :show, id: @core_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @core_article
    assert_response :success
  end

  test "should update core_article" do
    patch :update, id: @core_article, core_article: { body: @core_article.body, rank: @core_article.rank, title: @core_article.title, user_id: @core_article.user_id }
    assert_redirected_to core_article_path(assigns(:core_article))
  end

  test "should destroy core_article" do
    assert_difference('CoreArticle.count', -1) do
      delete :destroy, id: @core_article
    end

    assert_redirected_to core_articles_path
  end
end
