class AthletesController < ApplicationController

  before_filter :authenticate 

  def create
    @athlete = current_user.athletes.build(params[:athlete])

    @rand = (1+ rand(9))

    @athlete.speed = @athlete.height
    @athlete.power = @rand
    @athlete.save
    @roster_items = current_user.roster.paginate(:page => params[:page])

    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end

  end 

  def edit
    @edathlete = Athlete.find(params[:id])
    @athlete = Athlete.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @athlete = Athlete.find(params[:id])
    @athlete.update_attributes(params[:athlete])
    @roster_items = current_user.roster.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end
 
 def show
    @title = "View Athlete"
    @athlete = Athlete.find(params[:id])
  end

 def tpspend
    @title = "Spend Talent Points"
    @roster_items = current_user.roster.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

  def index
    @title = "All Athletes"
    @athletes = Athlete.paginate(:page => params[:page])
  end

end
