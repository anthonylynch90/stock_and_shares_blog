require 'spec_helper'

describe "Static pages" do
	subject {page}
  describe "Home page" do
    before {visit home_path}
	it {should have_selector('h1', text: 'Welcome')}
	it {should have_selector('title', text: 'Welcome')}
	it {should have_content('Sign up now')}
  end
  
  describe "About page" do
	before {visit about_path}
	it {should have_selector('h1', text: 'About us')}
	it {should have_selector('title', text: 'About us')}
  end
  
  describe "Help page" do
	before {visit help_path}
	
	it {should have_selector('h1', text: 'Help')}
	it {should have_selector('title', text: 'Help')}
  end
end
