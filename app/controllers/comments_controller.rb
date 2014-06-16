class CommentsController < ApplicationController
# find the link that the comment belong to before each method runs
before_filter :load_link

  def index  #retrieve all of the comments for the link.
    @comments = @link.comments.all
  end

  def new  # create an empty new comment for the link that will be passed a long to the form.
  	@comment = @link.comments.new
  end

  def show  
  	@comment = @link.comments.find(params[:id])
  end

  def create #create a new comment for this post and call the comment_params method for the params
  	@comment = @link.comments.create(comment_params)
  	@comment[:user_id] = current_user.id
  	  if @comment.save # if the comment saved to the database redirect to the link's comment's index
  	  	redirect_to link_comments_path(@link)
  	  end 
  end

  private 
    def load_link
    	@link = Link.find(params[:link_id])
    end

    def comment_params # require that the params hash contains a bid, permit the amount attribute.
    	params.require(:comment).permit(:content, :user_id)
    	
    end
end
