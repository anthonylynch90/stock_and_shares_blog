# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe User do
  before {@user = User.new(name: "Example User", email: "user@example.com")}
  
  subject{@user}
  
  it{should respond_to(:name)}
  it{should respond_to(:email)}  
  
  describe "When name is not present" do
	before{@user.name = ""}
	it{should_not be_valid}
  end
  
  describe "When name is not present" do
	before{@user.update_attributes(name: "example", email: "")}
	it{should_not be_valid}
  end
  
  describe "When name is too long" do
	before{@user.update_attributes(name: "a"*51, email: "user@example.com")}
	it{should_not be_valid}
  end
  
  describe "Checks name of 50 is valid" do
	before{@user.update_attributes(name: "a"*50, email: "user@example.com")}
	it{should be_valid}
  end
  
  describe "invalid email addresses" do
	addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com] 
	addresses.each do |invalid_address|
		before{@user.email = invalid_address}
		it{should_not be_valid}
	end
  end
  
  describe "should be valid" do
	addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	addresses.each do |valid_address|
		before{@user.email = valid_address}
		it{should be_valid}
	end
  end
  
  describe "should not have duplicate values" do
	before do
		user_with_same_email = @user.dup
		user_with_same_email.email.upcase!
		user_with_same_email.save
	end
	it{should_not be_valid}
  end
end
