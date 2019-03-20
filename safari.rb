require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "pg"
  gem "activerecord"
end

require "active_record"

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "safari_vacation",
)

class Animal < ActiveRecord::Base
end

# display all animals when type display_all in the terminal

loop do
puts "Welcome to the safari adventure! Take a look at all the animals seen!"
comment = gets.chomp
if comment == "display_all"
  p Animal.all
  break
elsif comment == "increment"
    puts "What kind of animal did you see?"
    increment_animals_seen = gets.chomp
    animal = Animal.find_by({"species" => increment_animals_seen})
    animal.seen_count += 1
    animal.save
    puts "#{animal.species} count: #{animal.seen_count}"
elsif comment == "species"
  puts "What was the species you saw?"
  species_seen = gets.chomp
  # puts "where did you see #{species_seen}"
  animal = Animal.find_by({"species" => species_seen})
  puts "Saw #{animal.seen_count} #{animal.species}s #{animal.last_seen_location}"
elsif comment == "spot"
  puts "What animal did you spot?!"
  animal_seen = gets.chomp
  puts "Where did you see #{animal_seen}?"
  location = gets.chomp
  animal = Animal.find_by({"species" => animal_seen})
  animal.last_seen_location = location
  animal.save
  break
elsif comment == "extinct"
  puts "What's a location you wanna destroy?"
  extinct_location = gets.chomp
  animal = Animal.where({"last_seen_location" => extinct_location})
  animal.destroy_all
  puts "#{extinct_location} destroyed!"
elsif comment == "total"
  puts Animal.sum(:seen_count)
  end
end
# 5.times{puts}


# lions_seen = Animal.find_by(species: "lion")
# p lions_seen.seen_count
# p lions_seen_count += Animal.seen_count
# animals_seen = Animal.where({"species" => increment_animals_seen})
# animals_seen.update({"seen_count" => increment_animals_seen})
# animals.seen_count += animal_seen


# if increment_animals_seen.empty?
#   puts "There was no animal seen"
# else 
#   puts animals_seen

  # animals_seen.each do |one_animal|
  #   puts "Just saw #{one_animal}!"
  #   animals_seen.save
  # end
# end
