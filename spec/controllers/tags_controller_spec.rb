require 'spec_helper'

describe TagsController do
  describe 'new' do
    it 'associates a new tag with a link' do
    end
  end

  describe 'show' do
    it 'should render the show page' do
    end
  end

  describe 'create multiple tags' do
	  # it 'should create multiple tags divided by commas' do
		# # need to add logic to split tags by comma, OR add multiple tag fields using javascript
		# end
  end

  describe 'private tags' do
    it 'should only show private links belonging to current user' do
      @user1 = FactoryGirl.create(:user)
      @tag = Tag.new(name: "private", user_id: @user1.id)
      @user2 = FactoryGirl.create(:user)
      @user2.tags.should_not include(@tag)
    
    end

  describe 'tag redundancy' do
  	it 'should search existing tags before creating a new one' do
  		tag1 = Tag.create(name: "tag1")
  		tag2 = Tag.create(name: "tag1")
      tag2.save.should raise_error
  	end
  end


end
