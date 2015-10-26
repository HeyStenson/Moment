class Moment < ActiveRecord::Base
	belongs_to :user
	belongs_to :journal

	validates :description, length: {maximum: 500}
end
