# LIFO - last in, first out
#workers

class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    # put it on the back
    @store << element
  end

  def pop
    # because .pop works on arrays, but not Stacks, unless we explicitly define it
    # take it off the back
    @store.pop
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end

end
