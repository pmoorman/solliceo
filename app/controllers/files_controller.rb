class FilesController < ApplicationController
	before_filter :get_viewer

	def new
		@file = FileUpload.new
	end

	def create
		@file = @viewer.file_uploads.new(params[:file_upload])
		if @file.save
			flash[:notice] = "File added"
			redirect_to [:edit, @viewer]
		else
			flash[:alert] = @file.errors.full_messages.to_sentence
			render action: :new
		end
	end

	def edit
		@file = @viewer.file_uploads.find(params[:id])
	end

	def destroy
		@file = @viewer.file_uploads.find(params[:id])
		@file.destroy
		flash[:notice] = "File removed"
		redirect_to viewer_url(@viewer)
	end

	def update
		@file = @viewer.file_uploads.find(params[:id])
		attachment = params[:file_upload].delete(:file)
		@file.file = attachment unless attachment.blank?

		if @file.update_attributes(params[:file_upload])
			flash[:notice] = "File updated"
			redirect_to [:edit, @viewer]
		else
			flash[:alert] = @file.errors.full_messages.to_sentence
			render action: :edit
		end
	end

	private

	def get_viewer
		@viewer = Viewer.find(params[:viewer_id])
	end

	# def file_u_params
	# 	params.require(:file_upload).permit(:file, :name)
	# end
end
