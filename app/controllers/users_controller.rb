class UsersController < ApplicationController
  def show
    @results = Item.where(user_id: current_user).order(id: 'desc' )
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render "show"
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
