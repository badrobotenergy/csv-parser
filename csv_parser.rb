# frozen_string_literal: true

require 'csv'

# array to hold repeater row objects and initiate headers
repeaters_info = []
headers = nil

# iterate through .csv file, headers tag makes each row a ruby object
CSV.foreach('washington_repeaters.csv', headers: true, header_converters: :symbol) do |row|
  headers ||= row.headers
  repeaters_info << row
end
