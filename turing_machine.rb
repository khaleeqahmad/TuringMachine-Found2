class TuringMachine
  $mult1

  def initialize

  end
  _ = '^'      #empty
  r = 'right'   #move right
  l = 'left'    #move left
  h = 'halt'    #halt (don't move)

                       #current, new, direction, new state

  def self.rule(current, new, action, state)
        r = {cur: current, new: new, act: action, state: state}
        return r
  end

  #def self.tape(arg)
  #  if arg.sub('q')
  #      puts 'q'
  #  end
  #end

  def self.tape(arg, arg2)
    if arg.sub('q')
      puts 'q'
    end
  end

  def self.ask()
    puts "Please enter a number"
    #mult1 =
        readline();
   #puts mult1
  end

  def self.addOnes(i)
    ret = i.times{print "1"};
  end

  rules = {
           q0: {1 => rule(1, _, r, :q1), 0 => rule(_, _, l, :q9)},
           q1: {1 => rule(1, 1, r, :q1), 0 => rule(_, _, r, :q2)},
           q2: {1 => rule(1, _, r, :q3), 0 => rule(_, _, l, :q7)},
           q3: {1 => rule(1, 1, r, :q3), 0 => rule(_, _, r, :q4)},
           q4: {1 => rule(1, 1, r, :q4), 0 => rule(_, 1, l, :q5)},
           q5: {1 => rule(1, 1, l, :q5), 0 => rule(_, _, l, :q6)},
           q6: {1 => rule(1, 1, l, :q6), 0 => rule(_, 1, r, :q2)},
           q7: {1 => rule(1, 1, l, :q7), 0 => rule(_, _, l, :q8)},
           q8: {1 => rule(1, 1, l, :q8), 0 => rule(_, 1, r, :q0)},
           q9: {1 => rule(1, 1, l, :q9), 0 => rule(_, _, r, :qF)},
           qF: {1 => rule(1, 1, h, :qF)#, 0 => rule(_, _, h, :qF)
          }
  }
       #puts rules[:q0][1]
  that = ask;
  puts that.class
  #addOnes(that);

end