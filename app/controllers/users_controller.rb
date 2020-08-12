class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_current_user_profile_page?, only: [:show]
 
  def show
    
    @user = current_user
    @events = @user.events
  end

  private

  def is_current_user_profile_page?
    if current_user == User.find(params[:id])
    else
      redirect_to root_path
    end
  end
  
  
end
