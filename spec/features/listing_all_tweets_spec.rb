require 'spec_helper'
require './lib/tweet'

feature "User browses the list of links" do

  before(:each) {
    Tweet.create(:text => "Yeah baby",)
  }

  scenario "when opening the home page" do
    visit '/'
    # save_and_open_page
    expect(page).to have_content("Yeah baby")
  end
end