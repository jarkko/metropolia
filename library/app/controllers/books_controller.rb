class BooksController < ApplicationController    

  def index
    @page_title = "Books >> Index"
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
end
