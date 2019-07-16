class UsersController < ApplicationController
  def top
  end

  def index
  	@users = User.all
  end

  def show
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update (user_params)
  	redirect_to user_path(current_user)
  end

private
def user_params
	params.require(:user).permit(:name, :profile_image, :introduction)
end

end
