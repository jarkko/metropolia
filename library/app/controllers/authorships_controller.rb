class AuthorshipsController < ApplicationController
  def destroy
    @book = Book.find(params[:book_id])
    @author = @book.authors.find(params[:id])
    @book.authors.destroy(@author)
    redirect_to book_path(@book)
  end
end
