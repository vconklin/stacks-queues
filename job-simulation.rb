# Since I was a little unclear on the directions (should I be writing a script with an output for a specific scenario? Or just a collection of methods that could potentially do these things?), Jeremy assigned me to make a class that can do it all.

# If you want to try it out, open it up with irb -r ./job-simulation.rb and create an instance of the class to play with (hr = HiringProcess.new). Then run hr.first_hires to set up the first part of the process.

require './Stack.rb'
require './Queue.rb'

class HiringProcess
  attr_accessor :waitlist, :workers

  def initialize
    @waitlist = Queue.new
    @workers = Stack.new
  end

# Must run this method on your new instance to do that initial hiring.
# Didn't know how to use the initializer for this without also editing the initializers of the Stack class and the Queue class so that they could take parameters. (I thought those classes are supposed to remain untouched so their use is not specific to this problem.) So I just created this company_start method to handle those first six people. Should I have copied the contents of this method into the initializer? Does it matter?
  def first_hires
    (1..10).each do |number|
      add_to_waitlist(number)
    end
    hire(6)
    self
  end

  # run this every 3 months!
  def three_month_switcheroo
    roll = dice_roll
    puts "Roll was #{roll}."
    fire(roll)
    hire(roll)
    self
  end

  # This was me trying to keep my method simple so that it can potentially be used in different contexts later. person can come from either the fire(roll) method, or maybe even any other time you'd want to add people to the end of the waitlist, like if someone applied from Craigslist you could do add_to_waitlist(<craigslisters_name>).
  def add_to_waitlist(person)
    @waitlist.enqueue(person)
  end

  # determines how many people will lose their job
  def dice_roll
    rand(1..6)
  end

  def hire(roll)
    roll.times do
      hired = @waitlist.dequeue
      @workers.push(hired)
    end
  end

  def fire(roll)
    roll.times do
      fired = @workers.pop
      add_to_waitlist(fired)
    end
  end

end
