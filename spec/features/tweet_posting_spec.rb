require 'spec_helper'
require './lib/tweet'

feature 'Posting tweets' do

	scenario "when browsing the homepage" do
		expect(Tweet.count).to eq(0)
    visit '/'
    # save_and_open_page
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

	# scenario "with username attached" do
 #    visit "/"
 #    add_link("http://www.makersacademy.com/",
 #                "Makers Academy",
 #                ['education', 'ruby'])
 #    link = Link.first
 #    expect(link.tags).to include("education")
 #    expect(link.tags).to include("ruby")
 #  end

 #  def add_link(url, title, tags = [])
 #    within('#new-link') do
 #      fill_in 'url', :with => url
 #      fill_in 'title', :with => title
 #      # our tags will be space separated
 #      fill_in 'tags', :with => tags.join(' ')
 #      click_button 'Add link'
 #    end
 #  end

end