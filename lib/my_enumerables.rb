module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
  index = 0
    self.my_each do |element|
      block.call(element, index)
      index += 1
    end
    self
  end

  def my_select(&block)
    self_selected = []
    self.my_each { |element| self_selected << element if block.call(element) }
    self_selected
  end

  def my_all?(&block)
    self_test = self.my_select(&block)
    self == self_test
  end

  def my_any?(&block)
    self_test = self.my_select(&block)
    !self_test.empty?
  end

  def my_none?(&block)
    self_test = self.my_select(&block)
    self_test.empty?
  end

  def my_count(&block)
    return self.length unless block_given?

    count = 0
    self.my_each { |element| count += 1 if block.call(element) }
    count
  end

  def my_map(&block)
    self_modified = []
    self.my_each { |element| self_modified << block.call(element) }
    self_modified
  end

  def my_inject(initial_value= self[0] ,&block)
    reduction = initial_value
    self.my_each do |element|
      reduction = block.call(reduction, element)
    end
    reduction
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    for element in self
      block.call(element)
    end
    self
  end
end
