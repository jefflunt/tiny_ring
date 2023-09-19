require 'minitest/autorun'
require_relative './tiny_ring'

class TestTinyRing < Minitest::Test
  def setup
    @ring = TinyRing.new(3)
  end

  def test_push_to_ring
    @ring << 1
    assert_equal 1, @ring.last

    @ring << 2
    assert_equal 2, @ring.last

    @ring << 3
    assert_equal 3, @ring.last

    @ring << 4
    assert_equal 4, @ring.last
  end

  def test_ring_overwrite_oldest_element
    @ring << 1
    @ring << 2
    @ring << 3
    @ring << 4  # This will overwrite the first element

    assert_equal [2, 3, 4], @ring.to_a
  end

  def test_ring_to_a
    assert_equal [], @ring.to_a

    @ring << 1
    assert_equal [1], @ring.to_a

    @ring << 2
    assert_equal [1, 2], @ring.to_a

    @ring << 3
    assert_equal [1, 2, 3], @ring.to_a

    @ring << 4
    assert_equal [2, 3, 4], @ring.to_a
  end
end

