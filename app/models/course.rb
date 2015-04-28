class Course < ActiveRecord::Base
	has_many :announcements, dependent: :destroy
end
