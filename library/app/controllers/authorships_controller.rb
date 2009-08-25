class AuthorshipsController < ApplicationController
  before_filter :fetch_book
  
  def new
    @authors = Author.all
  end
  
  def create
    @author = Author.find(params[:author_id])
    @book.authors << @author
    
    respond_to do |format|
      format.js
      format.html do
        flash[:notice] = "Successfully added #{@author.name} to the book's authors"
        redirect_to book_path(@book)
      end
    end
  end
  
  def destroy
    @author = @book.authors.find(params[:id])
    @book.authors.delete(@author)
    redirect_to book_path(@book)
  end
  
  private
  
  def fetch_book
    @book = Book.find(params[:book_id])
  rescue ActiveRecord::RecordNotFound
    render :text => "Not found", :status => :not_found
  end
end
