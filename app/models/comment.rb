class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  acts_as_likeable
end
