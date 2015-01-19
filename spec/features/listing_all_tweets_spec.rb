feature "User browses the list of links" do

  before(:each) {
    Tweet.create(:text => "Yeah baby")
    Tweet.create(:text => "First")
    Tweet.create(:text => "Second")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Yeah baby")
  end

  # scenario "filtered chronologically" do
  # 	visit '/peeps/search'
  # 	expect(page).not_to have_content("Yey!")
  # 	expect(tweets)[0].to have_content("First")
  # 	expect(tweets)[1].to have_content("Second") 
  # end


end