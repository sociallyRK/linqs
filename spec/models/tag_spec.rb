require 'spec_helper'

describe Tag do
	subject { FactoryGirl.create(:tag) }

  describe 'name' do
  	it 'should have a tag name' do
  		subject.should be_valid
  	end
  end
end
