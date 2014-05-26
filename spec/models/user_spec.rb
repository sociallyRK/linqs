require 'spec_helper'

describe User do
  subject { FactoryGirl.create(:user) }

  describe 'email' do
  	it 'should have an email address' do
  		subject.should be_valid
  	end

  	it 'should be in email format' do
  		subject.email = "fake_email.com"
      subject.should_not be_valid
  	end

  	it 'should be unique' do
  		user1 = User.create(email: "user1@email.com", password: "12345678", password_confirmation: "12345678")
  		user2 = User.create(email: "user1@email.com", password: "12345678", password_confirmation: "12345678")
  		user2.should_not be_valid
  	end
  end
end
