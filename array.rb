class Array
  def sum
    self.inject(0) do |i,n|
      i + n
    end
  end
  
  def kertoma
    self.inject(1) do |i, n|
      i * n
    end
  end
end

arr = [1,2,3,4]

hsh = {:a => arr, "b" => arr.reverse}

puts hsh[:a] = arr.map{|a| a ** 2}

hsh[:a].pop

hsh2 = hsh.select{ |k,v| k.to_s > "a" }
puts hsh2.inspect