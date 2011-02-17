require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
  
  describe "Creating users" do
    
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should be unsuccessful with the wrong email address" do
    end
  end
  
end
