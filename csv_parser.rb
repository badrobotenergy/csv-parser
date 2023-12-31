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
repeaters_info_kingston = []
repeaters_info_poulsbo = []
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
  elsif row[16].include? 'near Kingston'
    repeaters_info_kingston << row
  elsif row[16].include? 'near Poulsbo'
    repeaters_info_poulsbo << row
  end
end

# Set the header values to the correct values based off the Chirp
# export so that Chirp accepts it.
headers[0] = "Location"
headers[1] = "Name"
headers[2] = "Frequency"
headers[3] = "Duplex"
headers[4] = "Offset"
headers[5] = "Tone"
headers[6] = "rToneFreq"
headers[7] = "cToneFreq"
headers[8] = "DtcsCode"
headers[9] = "DtcsPolarity"
headers[10] = "RxDtcsCode"
headers[11] = "CrossMode"
headers[12] = "Mode"
headers[13] = "TStep"
headers[14] = "Skip"
headers[15] = "Power"
headers[16] = "Comment"
headers[17] = "URCALL"
headers[18] = "RPT1CALL"
headers[19] = "RPT2CALL"
headers[20] = "DVCODE"


# Create the csv files and write matched rows to them
CSV.open('seattle_repeaters.csv', 'wb') do |csv|
  csv << headers
  # The first value in the row determines the row placement in Chirp.
  # This variable is to make sure the rows will be added to the begiining
  # of Chirp.
  indexNumber = 0
  repeaters_info_seattle.each do |row|
    row[0] = indexNumber
    csv << row
    indexNumber = indexNumber + 1
  end
end

CSV.open('sultan_repeaters.csv', 'wb') do |csv|
  csv << headers
  indexNumber = 0
  repeaters_info_sultan.each do |row|
    row[0] = indexNumber
    csv << row
    indexNumber = indexNumber + 1
  end
  repeaters_info_gold_bar.each do |row|
    row[0] = indexNumber
    csv << row
    indexNumber = indexNumber + 1
  end
end

CSV.open('vancouver_repeaters.csv', 'wb') do |csv|
  csv << headers
  indexNumber = 0
  repeaters_info_vancouver.each do |row|
    row[0] = indexNumber
    csv << row
    indexNumber = indexNumber + 1
  end
end

CSV.open('spokane_repeaters.csv', 'wb') do |csv|
  csv << headers
  indexNumber = 0
  repeaters_info_spokane.each do |row|
    row[0] = indexNumber
    csv << row
    indexNumber = indexNumber + 1
  end
end

CSV.open('kingston_repeaters.csv', 'wb') do |csv|
  csv << headers
  indexNumber = 0
  repeaters_info_kingston.each do |row|
    row[0] = indexNumber
    csv << row
    indexNumber = indexNumber + 1
  end
end

CSV.open('poulsbo_repeaters.csv', 'wb') do |csv|
  csv << headers
  indexNumber = 0
  repeaters_info_poulsbo.each do |row|
    row[0] = indexNumber
    csv << row
    indexNumber = indexNumber + 1
  end
end
