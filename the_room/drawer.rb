#!/usr/bin/env ruby

# The drawer puzzle uses math and expects you to total up to 30
# there are six steps for 2^6 possibilities

class Operation
  @op
  @desc
  
  def initialize(operation, description)
    @op = operation
    @desc = description
  end
  
  def apply(value)
    @op.call(value)
  end
  
  def to_s
    @desc
  end
  
end

class Add < Operation
  def initialize(addend)
    super(lambda {|v| v+addend}, "+"+addend.to_s.rjust(2, "0"))
  end
end

class Multiply < Operation
  def initialize(multiplicand)
    super(lambda {|v| v*multiplicand}, "x"+multiplicand.to_s.rjust(2, "0"))
  end
end

class Subtract < Operation
  def initialize(subtrahend)
    super(lambda{|v| v-subtrahend}, "-"+subtrahend.to_s.rjust(2, "0"))
  end
end

class Step
  def initialize(operation0, operation1)
    @ops=[operation0, operation1]
  end
  
  def get_op(choice)
    @ops[choice]
  end
end


steps=[
  Step.new(Add.new(2), Add.new(8)),
  Step.new(Multiply.new(2), Multiply.new(5)),
  Step.new(Add.new(4), Add.new(7)),
  Step.new(Add.new(3), Add.new(12)),
  Step.new(Subtract.new(5), Subtract.new(17)),
  Step.new(Add.new(2), Add.new(9))
]

choices=[0,1]
possibilities = choices.repeated_permutation(6).to_a

possibilities.each do |poss|
  arr = steps.zip(poss)
  seq = arr.map{ |step, choice| step.get_op(choice) }
  value = seq.reduce(0){|memo, step| step.apply(memo) }
  path = seq.map(&:to_s).join(", ")
  puts "#{value} = #{path}"
end
