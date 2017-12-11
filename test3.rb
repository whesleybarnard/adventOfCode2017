arr = []

arr << 3
arr << 5
arr << 7

puts arr.inspect

puts arr.first
puts arr.last
puts arr[-2]

arr.map! {|o| o * 10}

puts arr.inspect