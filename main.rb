require 'book'
require "audio_book"
require "library"
require "author"

lib = Library.new
book = Book.new("Programming Ruby", "28973461789")
ab = AudioBook.new("On Writing", "6586785", "8:47")
lib.books << book
lib.books << ab




#
#prag_prog = Book.new("Pragmatic Programmer", "87969876")
#lib.books << prag_prog
#
#pragdave = Author.new("Dave", "Thomas")
#book.add_author(pragdave)
#book.add_author(Author.new("Andy", "Hunt"))
#
#
#prag_prog.add_author(pragdave)
#prag_prog.add_author(Author.new("Andy", "Hunt"))
#
#puts book
#
#puts pragdave.books_in(lib).inspect
#
#open("books.txt", "w") do |f|
#  lib.books.each do |book|
#    f.puts book.to_s
#  end
#end