class AddCourseToAnnouncements < ActiveRecord::Migration
  def change
    add_reference :announcements, :course, index: true, foreign_key: true
  end
end
