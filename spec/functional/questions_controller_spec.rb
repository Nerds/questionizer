require 'spec_helper'

describe QuestionsController do

  describe "index action" do
    
    describe "as a user" do
    end

    describe "as an admin" do
      before do
        peter = users(:peter_admin_1)
        @controller.stubs(:current_user).returns(peter)
        get :index
      end

      it { assert_response :success }
      it "must render index view" do
        assert_template :index
      end

      it "assign questions" do
        wont_be_nil assigns(:questions)
      end

    end

  end

  describe "new action" do

    before do
      peter = users(:peter_1)
      @controller.stubs(:current_user).returns(peter)
      get :new
    end

    it { assert_response :success }
    it "must render new view" do
      assert_template :new
    end

  end

  describe "create action" do
    before do
      peter = users(:peter_1)
      @controller.stubs(:current_user).returns(peter)
    end

    let(:attributes) { 
      { a1: "a1", a2: "a2", a3: "a3", a4: "a4", category: "programming_test", creator: "mylord", 
        creator_github: "mylord", creator_twitter: "mylord", nerd_level: "2", right_answer: "a3", 
        sub_category: "testing", text: "whowoo", user_id: 1
      }
    }

    it "must increase the question count" do
      post :create, question: attributes
    end

    it "must redirect to question show" do
      post :create, question: attributes
      assert_redirected_to root_url
    end

    it "must render new successful if unsuccessful" do
      post :create, question: { a1: "Holla" }
      assert_response :success
    end
    
    it "must render new view " do
      post :create, question: { a1: "Holla" }      
      assert_template :new
    end

  end

  describe "show action" do

    describe "as a user" do
    end

    describe "as an admin" do
      before do
        question = questions(:one)
        peter = users(:peter_admin_1)
        @controller.stubs(:current_user).returns(peter)    
        get :show, :id => question.id
      end

      it { assert_response :success }
      it "must render show view" do
        assert_template :show
      end
    end
  end

  describe "accept action" do

    describe "as a user" do
    end

    describe "as a admin" do
      it "must redirect after successfully accepted a question"
      it "must redirect after accepting was not successful"
    end
  end

  describe "reject action" do

    describe "as a user" do
    end

    describe "as a admin" do    
      it "must redirect after successfully rejected a question"
      it "must redirect after rejectingr was not successful"
    end
  end
end