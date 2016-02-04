require 'csv'
require 'pry'

class CollegeScorecard

  attr_reader :data

  def initialize
    @data = prep_scorecard
  end

  def prep_scorecard
    CSV.read("./2013_college_scorecards.csv",
              headers: true,
              header_converters: :symbol)
  end

  def by_state(state)
    @data.map { |row| row[:instnm] if row[:stabbr] == state }.compact
  end

  def top_average_faculty_salary(num)
    sorted = @data.sort_by { |row| row[:avgfacsal].to_i }.reverse
    sorted.to_a[0..(num - 1)].map { |row| row[:instnm] }
  end

  def median_debt_between(min, max)
    sorted = @data.select do |row|
      row[:grad_debt_mdn].to_i > min && row[:grad_debt_mdn].to_i < max
    end
    sorted = sorted.sort_by { |row | row[:grad_debt_mdn].to_i }.reverse
    sorted.map { |row| "#{row[:instnm]} ($#{row[:grad_debt_mdn]})" }
  end
end

college_scorecard = CollegeScorecard.new

case ARGV[0]
when "by_state"
  puts college_scorecard.by_state(ARGV[1])
when "top_average_faculty_salary"
  puts college_scorecard.top_average_faculty_salary(ARGV[1].to_i)
when "median_debt_between"
  puts college_scorecard.median_debt_between(ARGV[1].to_i, ARGV[2].to_i)
end
