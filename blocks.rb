def block_caller
  puts "Start"
  
  yield("a", "b")
  yield("b", "c")
  
  puts "End"
end

block_caller{|i, j| puts "In the middle (#{i}, #{j})"}