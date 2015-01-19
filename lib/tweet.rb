require 'data_mapper'

class Tweet

	include DataMapper::Resource

	property :text, Text
	property :id, Serial

end