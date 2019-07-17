class BooksController < ApplicationController


	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to book_path(@book.id)
	end

	def show
		@book = Book.new
		@book2 = Book.find(params[:id])
		@user = User.find(params[:id])
	end

	def index
		@book = Book.all
	end

	def edit
		@book =  Book.find(params[:id])
	end

	def destroy
	end

	def update
		@book = book.find(params[:id])
    	@book.update(book_params)
    	redirect_to book_path(@book)
	end

private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
