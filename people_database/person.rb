class Person

  attr_reader :first_name, :last_name, :email, :state

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @email = info[:email]
    @state = info[:state]
  end

end
