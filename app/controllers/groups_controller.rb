class GroupsController < ApplicationController
	def index
		@groups = Group.all
	end

	def show
		@group = Group.find(params[:id])
		@posts = @group.posts
	end

	def new
		@group = Group.new		
	end

	def create
		@group = Group.new(group_params)
		@group.save

		redirect_to groups_path
	end

	def edit
		@group = Group.find(params[:id])
	end

	def update
		@group = Group.find(params[:id])

		if @group.update(group_params)
			redirect_to groups_path(@group)
		else
			render :edit
		end
	end

	def destroy
		@group = Group.find(params[:id])

		@group.destroy

		redirect_to groups_path
	end

	def group_params
		params.require(:group).permit(:title, :description)
	end
end
