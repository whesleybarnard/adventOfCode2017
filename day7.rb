class Node
  attr_accessor :name, :children, :val, :parent, :part1, :part2, :weight, :childrenWeightSum, :totalWeight

  def initialize
    @name = nil
    @val = nil
    @weight = 0
    @childrenWeightSum = 0
    @totalWeight = 0
    @part1 = nil
    @part2 = nil
    @children = []
    @parent = nil
  end

  def to_s
    "name: #{@name}, totalWeight: #{@totalWeight}"
  end
end

ss = File.read('day7_input_test.txt')
# ss = File.read('day7_input.txt')

lines = ss.split("\n")
ss = nil
# puts lines

ob = {}
obNodes = {}

lines.each do |line|
  sp = line.split(' ', 2)
  # ob[sp.first] = sp.last
  sp2 = sp.last.split(' -> ', 2)
  sp2.first.gsub!('(', '')
  sp2.first.gsub!(')', '')
  # puts sp2.first

  # puts "loading: #{sp.first}"

  o = Node.new
  o.name = sp.first
  o.val = sp.last
  o.weight = sp2.first.to_i
  o.part1 = sp2.first
  o.part2 = sp2[1]

  obNodes[o.name] = o
end

puts '-------------------------'

# puts obNodes.inspect

# puts ob.inspect
# puts lines.inspect

obNodes.each do |key, val|
  puts "processing: #{key}"
  # puts "key: #{key}, val: #{val}"
  # puts val.inspect
  # puts val.inspect

  val.part2.split(', ').each do |item|
    # puts item
    o = obNodes[item]
    # puts o.inspect
    val.children << o
    o.parent = val

    # puts key
  end unless val.part2.nil?

  # puts val.inspect
end

puts '-------------------------'

lowestObject = obNodes.first[1]
# puts lowestObject.inspect

while true
  if lowestObject.parent.nil?
    break
  end
  lowestObject = lowestObject.parent
end

# puts lowestObject.inspect

puts "bottom is: #{lowestObject.name}"
puts '-------------------------'

def calc(node)
  node.totalWeight = node.weight
  # recurse calc...

  node.children.each do |child|
    calc child

    node.totalWeight += child.totalWeight
  end
  puts ''
  puts '###################################'
  puts "doing work for: #{node.name}"
  puts node
  puts '---children---'
  node.children.each do |child|
    puts child
  end
  puts 'NONE' unless node.children.length > 0
  puts '###################################'
end

calc lowestObject
# calc obNodes['ugml']
# calc lowestObject
# puts obNodes['ugml'].inspect