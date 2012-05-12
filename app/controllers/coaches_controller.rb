class CoachesController < ApplicationController
  
 
   
  def create
    @coach = current_user.coaches.build(params[:coach])

	@coach.nationality = current_user.country

    @coach.save
    
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end

  end 


  def buy
  end

end



