require 'spec_helper'


describe Link do
	subject { FactoryGirl.create(:link) }

  describe 'title' do
  	it 'should have a title' do
  		subject.should be_valid
  	end

  	it 'should have a minimum of 2 characters' do
  		subject.should be_valid
  	end
  end

  describe 'url' do
  	it 'should have a url' do
  		subject.should be_valid
  	end

  	it 'should have a minimum of 5 characters' do
  		subject.should be_valid
  	end
  end

# We currently don't have any user-link association. Need to add?
  # describe 'user' do
  # 	it 'should have a user' do
  # 		subject.user_id = nil
  # 		subject.should_not be_valid
  # 	end
  # end
end
