require 'spec_helper'

describe "Athletes" do

  before(:each) do
    @attr = { :gender => "male",
        :age => 20,
      :height => 120,
      :weight => 100,
      :skill => 2
    }
    @user = Factory(:user)
  end

  describe "Creating Athletes" do
    
    describe "with the correct user should work" do
      lambda do
        post :create, :athlete => @attr
      end.should_not change {Athlete.count}
      
    end
    
  end
end
