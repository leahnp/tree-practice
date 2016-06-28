class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end

# Let's write a method that prints out all the operators that exist in the tree.
# Added Fun: If there are duplicate operators, don't print them separately, but
# instead print a tally of all operators found.
def find_ops(node)
  # base case
  return if node == nil
  if (node.value == "-" ||node.value ==  "+" ||node.value ==  "/" ||node.value ==  "%")
    puts node.value
  end
  find_ops(node.left)
  find_ops(node.right)

  # data = {}
  # if node == nil
  #   puts data
  #   return
  # end
  # if (node.value == "-" ||node.value ==  "+" ||node.value ==  "/" ||node.value ==  "%")
  #   if data[node.value]
  #     data[node.value] += 1
  #   else
  #     data[node.value] = 1
  #   end
  # find_ops(node.left)
  # find_ops(node.right)
  # end 
end

# Write a method that returns the count of non-operators (in this case,
# leaves) in the tree. _Added Fun: print the level of the tree that each
# leaf appears on.

def leaves(node)
  return if node == nil
  if (node.value != "-" && node.value !=  "+" && node.value !=  "/" && node.value !=  "%")
    puts node.value
  end
  leaves(node.left)
  leaves(node.right)

end

# Write methods to print the tree in prefix and postfix notations.


def print_infix(node)
  return if node == nil
  print_infix(node.left)
  print node.value + " "
  print_infix(node.right)
end

def print_prefix(node)
  return if node == nil
  print node.value + " "
  print_prefix(node.left)
  print_prefix(node.right)
end

def print_postfix(node)
  return if node == nil
  print_postfix(node.right)
  print_postfix(node.left)
  print node.value + " "
end


# Write a method that returns whether or not a given operator exists in
# the tree. _Added fun: If the operator occurs more than once, return
# the count on how many times it occurs - you may return 0 if it doesn't
# exist in the tree.
def exists?(node, operator)
  if node == nil
    return false
  end
  if node.value == operator
    return true
  end
  if exists?(node.left, operator)
    return true
  end
  if exists?(node.right, operator)
    return true
  end
  return false
end

# evaluate an infix binary tree.
# def eval(node, prev)
#   # get to the left most, grab the op and the right leaf, perform op
#   if node == nil
#     return (math(node.left, op, node.right))
#   end
#   eval(node.left, node)
#   op = node.value + " "
#   eval(node.right, node)
# end

# def math(n1, op, n2)
#   if op == '-'
#     return n1 - n2
#   elsif op == '+'
#     return n1 + n2
#   elsif op == '/'
#     return n1 / n2
#   elsif op == '*'
#     return n1 * n2
#   end
# end


# root = TreeNode.new("+")
# root.left = TreeNode.new("3")
# root.right = TreeNode.new("2")

root = TreeNode.new('-')
root.left = TreeNode.new('+')
root.left.left = TreeNode.new('3')
root.left.right = TreeNode.new('2')
root.right = TreeNode.new('10')

# eval(root)

# puts exists?(root, '*')

# print_infix(root)
# puts ''
# print_prefix(root)
# puts ''
# print_postfix(root)
# puts ''
# find_ops(root)
# leaves(root)
