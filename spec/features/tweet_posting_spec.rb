require 'spec_helper'
require './lib/tweet'

feature 'Posting tweets' do

	scenario "when browsing the homepage" do
		expect(Tweet.count).to eq(0)
    visit '/'
    add_tweet("First tweet")
    expect(Tweet.count).to eq(1)
    tweet = Tweet.first
    expect(tweet.text).to eq("First tweet")
  end

	def add_tweet(tweet)
		within('#tweet-deck') do
			fill_in 'tweet', :with => tweet
			click_button 'tweet'
		end
	end 

end