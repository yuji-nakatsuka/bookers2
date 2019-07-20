class BooksController < ApplicationController

	before_action :authenticate_user!

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		flash[:notice]= "You have creatad book successfully."
		redirect_to book_path(@book.id)
		else
		redirect_to books_path, flash: {error: @book.errors.full_messages}
		end
	end

	def show
		@book = Book.new
		@book2 = Book.find(params[:id])
		@user2 = @book2.user
	end

	def index
		@book2 = Book.all
		@book = Book.new
		@user2 = current_user
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
    	end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def update
		@book = Book.find(params[:id])
    	if @book.update(book_params)
    	flash[:notice]="You have updated book successfully."
    	redirect_to book_path(@book)
    	else
    	render action: :edit
    	# redirect_to edit_book_path(@book), flash: {error: @book.errors.full_messages}
    	end
	end

private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
