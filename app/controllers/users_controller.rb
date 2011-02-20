class UsersController < ApplicationController
  
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  
  def new
    if signed_in?
      redirect_to(root_path)
    else
      @title = "Sign up"
      @user = User.new
    end
  end

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  
  def create

    redirect_to(root_path) unless !signed_in?

    @user = User.new(params[:user])
    @user.creation_mode = true
    if @user.save
      flash[:success] = "Welcome to the Gold and Glory!"
      sign_in @user
      redirect_to root_path
      seed_roster @user
    else
      @title = "Sign up"
      @user[:password] = ""
      @user[:password_confirmation] = ""
      render :new
    end
  end
  
  def edit
    @title = "Edit User"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  

  def destroy
    user = User.find(params[:id])
    if user.admin? 
      flash[:error] = "How can you kill that which has no life?"
    else 
      user.destroy
      flash[:success] = "User destroyed"
    end
    redirect_to users_path
  end

  private
  
 
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
