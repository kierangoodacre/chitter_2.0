module SessionHelpers  

  def sign_in(email, username, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'username', :with => username
    fill_in 'password', :with => password
    click_button 'Sign in'
  end

  def sign_up(email = "alice@example.com", username = 'testy', password = "oranges!", password_confirmation = 'oranges!')
    visit '/users/new'
    fill_in :email, :with => email
    fill_in :username, :with => username
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

end
