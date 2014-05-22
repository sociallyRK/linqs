class LinksController < ApplicationController
	def main
	end

	def index
		@links = Link.all
	end

	def new
		@links = Link.new
	end

	def create
		@link = Link.new(links_params)
		if @link.save
			redirect_to link_path
		else
			flash[:errors] #something something
	end

	def edit
		@link = Link.find(params[:id])
	end

	def update
		@link = Link.find(params[:id])
		if @link.update(link_params)
			redirect_to link_path(@link)
		else
			flash[:errors] = @link.errors.full_messages
			render :edit
	end

	def destroy
		@link = Link.find(params[:id])
		@link.destroy
		redirect_to root_path
	end

	private
		def links_params
			params.require(:link).permit(:title, :url)
		end
end