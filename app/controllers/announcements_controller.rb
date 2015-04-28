class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]

  # GET /announcements
  def index
    @announcements = Announcement.all
  end

  # GET /announcements/1
  def show
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
  end

  # GET /announcements/1/edit
  def edit
  end

  # announcement /announcements
  def create
    @course = Course.find(params[:course_id])
    @announcement = @course.announcements.create(announcement_params)
    @announcement.user_id = current_user.id if current_user
    @announcement.save

    if @announcement.save
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to @announcement, notice: 'Announcement was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /announcements/1
  def destroy
    @announcement.destroy
    redirect_to announcements_url, notice: 'Announcement was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def announcement_params
      params.require(:announcement).permit(:title, :content)
    end
end
