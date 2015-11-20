class Place < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  acts_as_followable
  acts_as_likeable
  acts_as_mentionable
end
