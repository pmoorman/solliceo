require 'rexml/document'
require 'open-uri'

class ViewersController < ApplicationController
  # GET /viewers
  # GET /viewers.json

  # Authenticate user before they can take actions on viewers
  before_filter :authenticate_user!, except: [:index, :show]

  # override layout for the Viewers
  layout "viewer", :only => :show


  def index
    render and return unless current_user
    # Only show user's own viewers in the index
    @viewers = current_user.viewers.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @viewers }
    end
  end

  # GET /viewers/1
  # GET /viewers/1.json
  def show
    @viewer = Viewer.find(params[:id])
    @thumbnail = nil
    # getting video thumbnail image url for sharing:
    # vimeo API returns xml document:
    begin
      doc = REXML::Document.new(open("http://vimeo.com/api/v2/video/#{@viewer.user.videoid.to_i}.xml").read)
      doc.elements.each('/videos/video/thumbnail_small') { |element| @thumbnail = element.get_text }
    rescue #some error occurred while making request to Vimeo API. Do nothing
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @viewer }
    end
  end

  # GET /viewers/new
  # GET /viewers/new.json
  def new
    @viewer = current_user.viewers.new
    4.times{ @viewer.file_uploads.build }
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @viewer }
    end
  end

  # GET /viewers/1/edit
  def edit
    @viewer = current_user.viewers.find(params[:id])
    (4 - @viewer.file_uploads.count).times{ @viewer.file_uploads.build }
  end

  # POST /viewers
  # POST /viewers.json
  def create
    @viewer = current_user.viewers.new(params[:viewer])

    respond_to do |format|
      if @viewer.save
        format.html { redirect_to @viewer, notice: 'Viewer was successfully created.' }
        format.json { render json: @viewer, status: :created, location: @viewer }
      else
        format.html { 
          @empty_count = 4 - @viewer.file_uploads.to_a.count
          @empty_count.times{ @viewer.file_uploads.build }
          render action: "new" 
        }
        format.json { render json: @viewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /viewers/1
  # PUT /viewers/1.json
  def update
    @viewer = current_user.viewers.find(params[:id])

    respond_to do |format|
      if @viewer.update_attributes(params[:viewer])
        format.html { redirect_to @viewer, notice: 'Viewer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { 
          @empty_count = 4 - @viewer.file_uploads.to_a.count
          @empty_count.times{ @viewer.file_uploads.build }
          render action: "edit" 
        }
        format.json { render json: @viewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viewers/1
  # DELETE /viewers/1.json
  def destroy
    @viewer = current_user.viewers.find(params[:id])
    @viewer.destroy

    respond_to do |format|
      format.html { redirect_to viewers_url }
      format.json { head :no_content }
    end
  end
end
