require "byebug"
class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def inspect
    "<Node: #{self.value} #{self.children}, #{self.parent} "
  end

  def parent=(node)
    parent = nil if node == nil

    if @parent != nil
      if self.parent != node
        @parent.children.reject! { |child| child == self }
      end
    end

    @parent = node
    if node != nil

      unless node.children.include?(self)
        node.children << self
      end
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if !@children.include?(child_node)
      raise "not a child of curent node"
    else
      child_node.parent = nil
    end
  end

  def dfs(target)
    return self if self.value == target

    @children.each do |child|
      search_result = child.dfs(target)
      return search_result unless search_result.nil?
    end
    nil
  end

  def bfs(target)
    queue = [] # [front, end]
    queue.push(self)
    while !queue.empty?
      curr_node = queue.shift
      if curr_node.value == target
        return curr_node
      else 
        curr_node.children.each do |child|
          queue.push(child)
        end
      end
    end
    nil
  end

end