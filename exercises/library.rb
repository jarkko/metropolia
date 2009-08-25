require "book"
require "author"

class Library
  def initialize
    Book.read_from_file
    
    prompt

    while l = gets
      opt = l.strip.gsub(".", "")
      case
      when opt.upcase == "X"
        Book.write_to_file
        break
      when opt == "4"
        Book.search_prompt
      when opt == "3"
        Book.delete_prompt
      when opt == "2"
        Book.create_prompt
      when opt == "1"
        puts "\n\n" + "=== All Books ===" + "\n\n"
        puts Book.list_all + "\n\n"
      else
        puts "Don't understand what you want!"
      end
      prompt
    end
  end
  
  def prompt
    puts "================================="
    puts "=            LIBRARY            ="
    puts "=                               ="
    puts "=  1. List books                ="
    puts "=  2. Add book                  ="
    puts "=  3. Delete book               ="
    puts "=  4. Search                    ="
    puts "=  X. Exit                      ="
    puts "=                               ="
    print "=  > "
  end
end

Library.new