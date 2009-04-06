class Library
  attr_accessor :books

  def initialize
    @books = []
  end

  def list_books
    @books.each_with_index do |book, idx|
      puts "#{idx + 1}: #{book}"
    end
  end

  def amount
    @books.size
  end  
end
