# binary_tree_demo.rb
#
# vim: ft=ruby sw=2 ts=2
#
# Generate maze by binary tree algorithm
#

require_relative "../lib/grid.rb"
require_relative "../lib/binary_tree.rb"

grid = Grid.new(4, 4)
BinaryTree.on(grid)

