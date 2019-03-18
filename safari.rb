require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "pg"
  gem "activerecord"
end

require "active_record"

ActiveRecord::Base.logger = Longer.new(STDOUT)

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "safari_vacation"
)