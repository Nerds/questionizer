require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, question: { a1: @question.a1, a2: @question.a2, a3: @question.a3, a4: @question.a4, category: @question.category, creator: @question.creator, creator_github: @question.creator_github, creator_twitter: @question.creator_twitter, nerd_level: @question.nerd_level, right_answer: @question.right_answer, sub_category: @question.sub_category, text: @question.text, user_id: @question.user_id }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    put :update, id: @question, question: { a1: @question.a1, a2: @question.a2, a3: @question.a3, a4: @question.a4, category: @question.category, creator: @question.creator, creator_github: @question.creator_github, creator_twitter: @question.creator_twitter, nerd_level: @question.nerd_level, right_answer: @question.right_answer, sub_category: @question.sub_category, text: @question.text, user_id: @question.user_id }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
