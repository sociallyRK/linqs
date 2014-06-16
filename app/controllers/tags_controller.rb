class TagsController < ApplicationController
  before_action :find_tag, only: [:show, :edit, :update, :destroy]

  def index
    # finds tags by search input and orders alphabetically by tag name
    @tags = Tag.search(params[:search]).order(:name)
    respond_to do |format|
      format.html
      format.json { render :json => {:tags => @tags.as_json}}
    end
  end

  def new
    # creates a new tag associated with a link_id through link_tags
    @tag = Tag.new
    @tag.link_tags.build
  end

  def create
    # saves new tag and redirects to the show page for that tag id
    @tag = Tag.new(tags_params)
    if @tag.save
      redirect_to tag_path(@tag)
    else
      flash[:errors] = @tag.errors.full_messages
    end
  end
  

  def show
    # renders show page (displays all links associated with that tag)
  end

  def edit
    # find all link_ids assoc'd with tag_id in link_tags
    @links = []
    @tag.link_tags.find_by(tag_id: @tag.id).each do |link|
      @links.push(link)
    end
  end

  def update
    if @tag.update(tags_params)
      redirect_to tag_path(@tag)
    else
      flash[:errors] = @tag.errors.full_messages
      render :edit
    end
  end

  def destroy
    #@tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to root_path
  end

  private
  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tags_params
    params.require(:tag).permit(:name)
  end
end
