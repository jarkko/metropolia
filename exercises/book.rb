require 'fileutils'
class Book
  @@books = []
  FNAME = "books.txt"
  
  attr_accessor :name, :isbn, :author, :checked_out
  
  def initialize(name, isbn, author = nil)
    @name, @isbn, @author = name, isbn, author
  end
  
  def checkout
    @checked_out = true
  end
  
  def ret
    @checked_out = false
  end
  
  def details
    <<-END
      Name:   #{name}
      Author: #{author}
      Isbn:   #{isbn}
    END
  end
  
  def self.list(books)
    if books.empty?
      "\nNo books\n\n"
    else
      books.map do |book|
        "#{book.name}, #{book.isbn}"
      end.join("\n")
    end
  end
  
  def self.list_all
    list(@@books)
  end
  
  def self.read_from_file
    FileUtils.touch(FNAME)
    open(FNAME) do |f|
      while line = f.gets
        name, isbn = line.strip.split("|")
        @@books << new(name.strip,
                       isbn.strip)
      end
    end
  end
  
  def self.write_to_file
    open(FNAME, "w+") do |f|
      @@books.each do |book|
        f.puts([book.name, book.isbn].join("|"))
      end
    end
  end
  
  def self.create_prompt
    print "Name of the book: "
    name = gets
    print "ISBN of the book: "
    isbn = gets
    @@books << new(name.strip, isbn.strip)
  end
  
  def self.delete_prompt
    print "ISBN of the book: "
    isbn = gets
    book = @@books.select do |b|
      b.isbn == isbn.strip
    end.first
    
    if book
      @@books.delete(book)
      puts "#{book.name} deleted!"
    else
      puts "Could not find a book with isbn #{isbn}"
    end
  end
  
  def self.search_prompt
    print "Search term: "
    term = gets
    term = Regexp.new(term.strip)
    
    results = @@books.select do |b|
      b.name.match(term)
    end

    puts list(results)    
  end
end