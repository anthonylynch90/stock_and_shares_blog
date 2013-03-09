require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'Welcome'" do
		visit '/static_pages/home'
		page.should have_content('Welcome')
    end
  end
  
  describe "About page" do
    it "should have the content 'About us'" do
		visit '/static_pages/about'
		page.should have_content('About us')
    end
  end
  
  describe "Help page" do
    it "should have the content 'Help'" do
		visit '/static_pages/help'
		page.should have_content('Help')
    end
  end
end