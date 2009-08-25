class BooksController < ApplicationController    
  before_filter :fetch_book, 
    :only => [:show, :edit, :update, :destroy]

  skip_before_filter :verify_authenticity_token, :only => [:destroy]

  def index
    @page_title = "Books >> Index"
    @books = Book.all
    @book = Book.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @books.to_xml }
    end
  end
  
  def show
    @authors = Author.all - @book.authors
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @book.to_xml }
    end
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(params[:book])
    
    respond_to do |format|
      format.js
      format.html do
        if @book.save
          flash[:notice] = "Book created successfully"
          redirect_to books_path
        else
          flash.now[:notice] = "Oops, didn't work"
          render :action => "new"
        end
      end
    end
  end
  
  def edit
  end
  
  def update
    if @book.update_attributes(
                params[:book])
      flash[:notice] = "Successfully updated #{@book.title}"
      redirect_to book_path(@book)
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @book.destroy
    respond_to do |format|
      format.js
    end
  end
  
  private

  def fetch_book
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render :text => "Not found", :status => :not_found
  end
end
