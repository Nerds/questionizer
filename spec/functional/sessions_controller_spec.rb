require 'spec_helper'

describe SessionsController do

  describe "new action" do
    before do
      get :new
    end
    
    it { assert_response :success }
    it "must render new view" do
      assert_template :new
    end
  end

  describe "create action" do

    before do
      #get :create
    end

    describe "creating a new user" do

      it "should call user.authorizations.build"

    end
    describe "finding an existing one" do

      it "should not call user.authorizations.build
      "
    end

  end

  describe "failure action" do
    before do
      get :failure
    end

    it { assert_response :success }
    it "must render failure view" do
      assert_equal "Sorry, but you didn't allow access to our app!", @response.body, "Expected response body to be: Sorry, but you didn't allow access to our app!"
    end
  end

  describe "destroy action" do
    before do
      get :destroy
    end

    it "should clear the session"

    it "should redirect to root url"

  end
end
