class Node
  attr_accessor :right, :bottom, :top, :val, :left

  def initialize(val = 0)
    @val = val
    @top = nil
    @left = nil
    @bottom = nil
    @right = nil
  end
end

o = Node.new(1)

for i in 1..100
  if o.right.nil?
    # puts 'o.right is nil'
    newObject = Node.new
    o.right = newObject
    newObject.left = o
    newObject.val += o.val
    next
  end
end


# o.right = Node.new
# o.right.top = Node.new
# # o.top = Node.new(11)
# # o.top = Node.new(11)

puts o.inspect