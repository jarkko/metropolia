def try_code(code)
  begin
    eval(code)
  rescue NoMethodError => e
    puts "NoMethodError thrown: #{e.inspect}"
  rescue SystemCallError => e
    puts "SystemCallError thrown: #{e.inspect}"
  rescue Exception => e
    puts "Exception thrown: #{e.inspect}"
  else
    puts "No exception thrown"
  ensure
    puts "Doing this no matter what"
  end
end