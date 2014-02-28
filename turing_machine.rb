class TuringMachine

  E = '\u2227'.gsub(/\\u[\da-f]{4}/i) { |m| [m[-4..-1].to_i(16)].pack('U') }      #empty character unicode
  RIGHT = 'right'   #move right
  LEFT = 'left'    #move left
  HALT = 'halt'    #halt (don't move)



  def initialize
    @multiplicand=0
    @multiplier =0
    @tape = E
  end


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
    puts "Please enter your first number (multiplicand)"
    a = gets.chomp();

    puts "Please enter the number you would like to multipy by (multiplier)"
    b = gets.chomp();

    @multiplicand = a.to_i
    @multiplier   = b.to_i
  end

  def self.printOnes(i)
    chars = ''
    i.times{chars << "#{1}" }
    return chars
  end

  def self.printEmpties(i)
    chars = ''
    i.times{chars << E}
    return chars
  end

  #def self.printOnes(n)
  #  ret = ''
  #    for i in 1..n
  #        ret << '1'
  #    end
  #  return ret
  #end
  #
  #def self.printEmpties(n)
  #  if n == nil
  #    return E
  #  else
  #
  #    ret =''
  #    for i in 1..n
  #      ret << E
  #    end
  #    return ret
  #  end
  #end

  rules = {
           q0: {1 => rule(1, E, RIGHT, :q1), 0 => rule(E, E, LEFT, :q9)},
           q1: {1 => rule(1, 1, RIGHT, :q1), 0 => rule(E, E, RIGHT, :q2)},
           q2: {1 => rule(1, E, RIGHT, :q3), 0 => rule(E, E, LEFT, :q7)},
           q3: {1 => rule(1, 1, RIGHT, :q3), 0 => rule(E, E, RIGHT, :q4)},
           q4: {1 => rule(1, 1, RIGHT, :q4), 0 => rule(E, 1, LEFT, :q5)},
           q5: {1 => rule(1, 1, LEFT, :q5), 0 => rule(E, E, LEFT, :q6)},
           q6: {1 => rule(1, 1, LEFT, :q6), 0 => rule(E, 1, RIGHT, :q2)},
           q7: {1 => rule(1, 1, LEFT, :q7), 0 => rule(E, E, LEFT, :q8)},
           q8: {1 => rule(1, 1, LEFT, :q8), 0 => rule(E, 1, RIGHT, :q0)},
           q9: {1 => rule(1, 1, LEFT, :q9), 0 => rule(E, E, RIGHT, :qF)},
           qF: {1 => rule(1, 1, HALT, :qF)#, 0 => rule(E, E, h, :qF)
          }
  }
       #puts rules[:q0][1]
  @tape = E   # create empty tape (ie initial blank symbol)
  ask()       # ask for input
  product = (@multiplicand * @multiplier)
  # append input to tape and print:
        #  1s (* multiplicand)       +  separator       +  1s (* multiplier)
  @tape << printOnes(@multiplicand) << E << printOnes(@multiplier)  #<< printEmpties(product)
  puts @tape

end