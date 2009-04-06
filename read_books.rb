require "book"
open("books.txt") do |f|
  while l = f.gets
    name, isbn, *authordata = l.split(",")
    book = Book.new(name, isbn)
    puts book
  end
end

puts `ls -la`