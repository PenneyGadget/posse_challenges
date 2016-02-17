class Initials

  def self.give_me_the_initials(*name)
    puts name.flatten.collect { |x| x[0]}.join
  end

end

Initials.give_me_the_initials(ARGV[0..-1])

# ruby initials.rb Carly Rae Jeppsen
