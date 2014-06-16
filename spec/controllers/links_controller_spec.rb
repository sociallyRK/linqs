require 'spec_helper'

describe LinksController do
  describe 'GET index' do
  	it 'renders the index view' do
  		expect { User.new(id: "1", email: "rspec@test.com", password: "12345678", password_confirmation: "12345678") }
  		get :index, FactoryGirl.attributes_for(:link, user: @user)
  		response.should render_template :index
  	end
  end

  describe 'new' do
  	it 'creates new tags associated with a new link' do
  		@link = FactoryGirl.create(:link)
  		@link_tag = @link.link_tags.build
    	@link_tag.build_tag
    	tags = @link.tags
    	tags.count.should eq(1)
    end
  end

  describe 'private links' do
		it 'should separate private and public links' do
			# make a private link
			# make a public link
			# check that they display on different parts of the page?
		end

		it 'should only show private links belonging to current user' do
			# check current user, assign it to user1
			# make a link, assign it to user2
			# check that link doesn't show up for user1
		end

		it 'should require log in before creating link' do
			# i don't know how to do this with devise
		end
  end

  describe 'sort_by_title' do
  	it 'should order links by title' do
  		linkA = Link.new(title: "A", url: "http:/www.A.com", tags: "A")
  		linkB = Link.new(title: "B", url: "http:/www.B.com", tags: "B")
  		linkC = Link.new(title: "C", url: "http:/www.C.com", tags: "C")
  		links = Link.all.order(:title)
  		links.first.should eq(linkA)
  	end
  end

  describe 'up_vote' do
  	it 'should increase the link\'s votes' do
  		# link1 = Link.new
  		# link1.upvotes = 1
  		# link2 = Link.new
  		# link2.upvotes = 2
  		# @links = Link.all
  	end
  end



end
