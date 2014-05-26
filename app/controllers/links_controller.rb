class LinksController < ApplicationController
  # not currently being used; we may want to set our SPA homepage to main
  def main
  end

# will eventually display all public links via ajax get request
  def index
    @links = Link.all
  end

# should build new tags associated with the new link - is this working??
  def new
    @link = Link.new
    @link_tag = @link.link_tags.build
    @link_tag.build_tag
  end

# will send new instance of link via ajax post to db and retrieves json for same link to display on page without reloading
  def create
    @link = Link.new(links_params)
    if @link.save
      redirect_to link_path(@link)
    else
      flash[:errors] = @link.errors.full_messages
    end
  end

# shows details of a single link, including all tags assoc'd with it
  def show
    @link = Link.find(params[:id])
    @title = @link.title
    @url = @link.url
  end

# loads link and assoc'd tags to edit
  def edit
    @link = Link.find(params[:id])
    @link_tag = @link.link_tags.build
    @link_tag.build_tag
  end

 # will send updated link attributes via ajax post 
  def update
    @link = Link.find(params[:id])
    if @link.update(links_params)
      redirect_to link_path(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :edit
    end
  end

    def destroy
      @link = Link.find(params[:id])
      @link.destroy
      redirect_to root_path
    end

    private
    def links_params
      params.require(:link).permit(:title, :url, link_tags_attributes: [tags_attributes: [:name] ])
    end
  end
