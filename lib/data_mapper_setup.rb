require './lib/tweet'
require './lib/user'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost:15432/tweet_manager_development")

DataMapper.finalize