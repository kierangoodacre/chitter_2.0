env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost:15432/bookmark_manager_test")


DataMapper.finalize

DataMapper.auto_upgrade!