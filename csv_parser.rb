# Objective:
# iterate through the entire csv file
# match strings 'near Seattle' 'near Sultan' 'near Vancouver' 'near Spokane'
# write matched values to a new an array of hashes
# write matching lines out to location relevant .csv files

# frozen_string_literal: true

require 'csv'

# array to hold repeater row objects and initiate headers
# repeaters for each specific location
repeaters_info_seattle = []
repeaters_info_sultan = []
repeaters_info_vancouver = []
repeaters_info_spokane = []
repeaters_info_gold_bar = []
headers = nil

# iterate through .csv file, headers tag makes each row an addressable ruby object
CSV.foreach('washington_repeaters.csv', headers: true, header_converters: :symbol) do |row|
  headers ||= row.headers

  # Add rows to specific arrays depending on the locale.
  if row[16].include? 'near Seattle'
    repeaters_info_seattle << row
  elsif row[16].include? 'near Sultan'
    repeaters_info_sultan << row
  elsif row[16].include? 'near Vancouver'
    repeaters_info_vancouver << row
  elsif row[16].include? 'near Spokane'
    repeaters_info_spokane << row
  elsif row[16].include? 'near Gold Bar'
    repeaters_info_gold_bar << row
  end
end

# Create the csv files and write matched rows to them

CSV.open('seattle_repeaters.csv', 'wb') do |csv|
  csv << headers
  repeaters_info_seattle.each do |row|
    csv << row
  end
end

CSV.open('sultan_repeaters.csv', 'wb') do |csv|
  csv << headers
  repeaters_info_sultan.each do |row|
    csv << row
  end
  repeaters_info_gold_bar.each do |row|
    csv << row
  end
end

CSV.open('vancouver_repeaters.csv', 'wb') do |csv|
  csv << headers
  repeaters_info_vancouver.each do |row|
    csv << row
  end
end

CSV.open('spokane_repeaters.csv', 'wb') do |csv|
  csv << headers
  repeaters_info_spokane.each do |row|
    csv << row
  end
end
