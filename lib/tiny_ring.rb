# memory efficient ring buffer implementation
#
# usage:
#   > tr = TinyRing.new(3)
#   > tr << 1               # => [1, nil, nil]
#   > tr << 2               # => [1, 2, nil]
#   > tr << 3               # => [1, 2, 3]
#   > tr << 4               # => [4, 2, 3]
#   > puts tr.to_a.inspect  # => [2, 3, 4]
class TinyRing
  attr_reader :size,
              :lifetime_pushes

  def initialize(size)
    @size = size
    @lifetime_pushes = 0
    @buffer = Array.new(size)
    @current_index = 0
  end

  def push(item)
    @lifetime_pushes += 1
    @buffer[@current_index] = item
    @current_index = (@current_index + 1) % @size
  end
  alias << push

  # returns the items most recently inserted into the ring buffer the most
  #   recently added item item added to the buffer.
  # returns nil if the buffer is empty
  def last
    previous_index = (@current_index - 1) % @size
    @buffer[previous_index]
  end

  # Returns the contents of the buffer as an Array, ordered from oldest to newest.
  def to_a
    (@buffer[@current_index..-1] + @buffer[0...@current_index]).compact
  end
end
