class UsersController < ApplicationController
  def top
  end

  def index
  	@users = User.all
    @book = Book.new
    @user2 = current_user
  end

  def about
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @user2 = User.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
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

  def book_params
    params.require(:book).permit(:title, :body)
  end

end