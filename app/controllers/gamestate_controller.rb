class GamestateController < ApplicationController

#  before_filter :admin_user

  def generate_athletes
    
    @users = User.all
    
    @users.each do |user|
      user.roster.each do |athlete|
        calculate_stats athlete
      end
    end
    
    flash[:success] = "*** Athlete stats generated successfully"
    redirect_to :controller => :pages, :action => "admin_dashboard"

  end
  
  

end
