# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
    @stack_with_elements = Stack.new %w[ruby php java]
  end

  def test_empty_stack_initialied
    assert { @stack.is_a? Stack }
    assert { @stack.empty? }
    assert { @stack.size.zero? }
    assert { @stack.to_a.eql? [] }
  end

  def test_stack_initialized_with_elements
    assert { @stack_with_elements.is_a? Stack }
    refute { @stack_with_elements.empty? }
    assert { @stack_with_elements.size.eql? 3 }
    assert { @stack_with_elements.to_a.eql? %w[ruby php java] }
  end

  def test_pop_empty
    assert { @stack.pop!.nil? }
  end

  def test_pop_not_empty
    assert { @stack_with_elements.pop!.eql? 'java' }
  end

  def test_push
    @stack.push! 2022
    refute { @stack.empty? }
    assert { @stack.size.eql? 1 }
    assert { @stack.to_a.eql? [2022] }
  end

  def test_pop_sequence
    assert { @stack_with_elements.pop!.eql? 'java' }
    assert { @stack_with_elements.pop!.eql? 'php' }
    assert { @stack_with_elements.pop!.eql? 'ruby' }

    assert { @stack_with_elements.empty? }
    assert { @stack_with_elements.size.zero? }
    assert { @stack_with_elements.to_a.eql? [] }
  end

  def test_clear
    @stack_with_elements.clear!

    assert { @stack_with_elements.empty? }
    assert { @stack_with_elements.size.zero? }
    assert { @stack_with_elements.to_a.eql? [] }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
