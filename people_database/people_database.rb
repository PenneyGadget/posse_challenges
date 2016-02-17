require 'pry'
require_relative 'person'

class PeopleDatabase

  attr_accessor :people

  def initialize(people = [])
    @people = people
  end

  def add(info)
    person = Person.new(info)
    people << person
  end

  def remove_by_email(email)
    people.delete_if { |person| person.email == email }
  end

  def people_by_state(state)
    return people.select { |person| person.state == state }
  end

  def num_by_state(state)
    return people.select { |person| person.state == state }.count
  end

  def return_all_emails
    people.map { |person| p person.email }
  end

end
