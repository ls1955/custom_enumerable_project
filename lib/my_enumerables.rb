module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    return enum_for(:my_each_with_index) unless block_given?

    0..length.times do |index|
      block.call(self[index], index)
    end
    self
  end

  def my_select(&block)
    return enum_for(:my_select) unless block_given?

    reduce([]) do |result, element|
      result << element if block.call(element)
      result
    end
  end

  def my_all?(&block)
    reduce(true) do |result, element|
      result = false unless block.call(element)
      result
    end
  end

  def my_any?(&block)
    reduce(false) do |result, element|
      result = true if block.call(element)
      result
    end
  end

  def my_none?(&block)
    reduce(true) do |result, element|
      result = false if block.call(element)
      result
    end
  end

  def my_count(&block)
    return length unless block_given?

    reduce(0) do |counter, element|
      counter += 1 if block.call(element)
      counter
    end
  end

  def my_map(&block)
    return enum_for(:my_map) unless block_given?

    reduce([]) do |result, element|
      result << block.call(element)
      result
    end
  end

  def my_inject(init_value, &block)
    for element in self
      init_value = block.call(init_value, element)
    end
    init_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    return enum_for(:my_each) unless block_given?

    for element in self
      block.call(element)
    end
  end
end
