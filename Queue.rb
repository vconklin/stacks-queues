# FIFO - first in, first out
# waitlist

class Queue
  def initialize
    @store = Array.new
  end

  def dequeue
    # take it off the back
    @store.pop
  end

  def enqueue(element)
    # put it on the front
    @store.unshift(element)
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end

end
