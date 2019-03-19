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

puts "Welcome to the safari adventure! Take a look at all the animals seen!"
display_all = gets.chomp
animals = Animal.all
p animals

5.times{puts}

puts "What kind of animal did you see?"
increment_animals_seen = gets.chomp
lions_seen = Animal.find_by(species: "lion")
p lions_seen.seen_count
# p lions_seen_count += Animal.seen_count
animals_seen = Animal.where({"species" => increment_animals_seen})
# animals_seen.update({"seen_count" => increment_animals_seen})
animal_seen = Animal.find_by({"species" => increment_animals_seen})
# animals.seen_count += animal_seen


if increment_animals_seen.empty?
  puts "There was no animal seen"
else 
  puts animals_seen

  # animals_seen.each do |one_animal|
  #   puts "Just saw #{one_animal}!"
  #   animals_seen.save
  # end
end
