require 'data_mapper'

class Tweet

	include DataMapper::Resource

	has n, :tweets, :through => Resource

	property :text, Text
	property :id, Serial

end