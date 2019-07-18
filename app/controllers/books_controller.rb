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
		@user2 = @book2.user
	end

	def index
		@book2 = Book.all
		@book = Book.new
		@user2 = current_user
	end

	def edit
		@book = Book.find(params[:id])
		@book2 = Book.find(params[:id])
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
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
