class BooksController < ApplicationController    

  def index
    @page_title = "Books >> Index"
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(params[:book])
    
    if @book.save
      flash[:notice] = "Book created successfully"
      redirect_to books_path
    else
      flash.now[:notice] = "Oops, didn't work"
      render :action => "new"
    end
  end
end
