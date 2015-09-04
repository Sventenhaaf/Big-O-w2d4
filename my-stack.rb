class MyStack

    def initialize
      @store = []
      @max = []
      @min = []
    end

    def max
      @max.last
    end

    def min
      @min.last
    end

    def pop
      @max.pop
      @min.pop
      @store.pop
    end

    def push(el)
      if @max[0] == nil
        @max << el
        @min << el
      else
        max > el ? @max << max : @max << el
        min < el ? @min << min : @min << el
      end
      @store << el
    end

    def peek
      @store.last
    end

    def size
      @store.size
    end

end

class Queue

  def initialize
    @in_queue  = MyStack.new
    @out_queue = MyStack.new
  end

  def enqueue(el)
    @in_queue.push(el)
  end

  def max
    return nil if @in_queue.peek == nil && @out_queue.peek == nil
    return @in_queue.max if @out_queue.peek == nil
    return @out_queue.max if @in_queue.peek == nil
    @in_queue.max > @out_queue.max ? @in_queue.max : @out_queue.max
  end

  def min
    return nil if @in_queue.peek == nil && @out_queue.peek == nil
    return @in_queue.min if @out_queue.peek == nil
    return @out_queue.min if @in_queue.peek == nil
    @in_queue.min < @out_queue.min ? @in_queue.min : @out_queue.min
  end

  def dequeue
    if @out_queue.size == 0
      while @in_queue.size != 0
        @out_queue.push(@in_queue.pop)
      end
    end
    @out_queue.pop
  end

  def peek
    if @out_queue.size == 0
      while @in_queue.size != 0
        @out_queue.push(@in_queue.pop)
      end
    end
    @out_queue.last
  end

  def size
    @out_queue.size + @in_queue.size
  end
end
