require 'spec_helper'

describe "User Pages" do
	subject{page}

  describe "signup page with valid information" do
    before{visit signup_path}
	
	it{should have_selector('h1', 	text: 'Sign in details')}
	it{should have_selector('title', 	text: 'Sign up')}
	
	
	fill_in "Name", with: "Example User"
	fill_in "Email", with: "Example@example.com"
	fill_in "Password", with: "123456"
	fill_in "confirmation", with: "123456"
	expect do
		click_button "Create my account"
	end.to change(User, :count).by(1)
  end
  
  describe "invalid signup page" do
    before{visit signup_path}	
	expect{click_button "Create my account"}.not_to change(User, :count)
  end
  
  describe "Profile Page" do
	let(:user) {FactoryGirl.create(:user)}
    before{visit user_path(user)}
	
	it{should have_selector('h1', 	text: "#{user.name}")}
	it{should have_selector('title', 	text: user.name)}
  end
end
