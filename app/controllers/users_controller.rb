class UsersController < ApplicationController
  
  def new
    @title = "Sign Up"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User Created!"
      #temporary redirect
      redirect_to contact_path
    else
      @title = "Sign Up"
      render :new
    end
    
  end

  def show
    @title = "User Details"
    @user = User.find(params[:id])
  end

  def index
    @title = "All Users"
    @users = User.paginate(:page => params[:page])
  end
end
