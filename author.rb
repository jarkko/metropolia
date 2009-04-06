class Author
  attr_accessor :first_name, :last_name
  
  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
  end
  
  def books_in(lib)
    lib.books.select{|book| book.authors.include?(self)}
  end
end