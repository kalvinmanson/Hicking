class Place < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  #has_many   :attributes
  has_many   :specifications, foreign_key: "place_id", class_name: "Attribute"

  has_and_belongs_to_many :categories, :before_add => :validates_category

  def validates_category(category)
    raise ActiveRecord::Rollback if self.categories.include? category
  end

  acts_as_followable
  acts_as_likeable
  acts_as_mentionable

  #URLs amigables
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  after_create :remake_slug

  def slug_candidates
    [
      :name,
      [:name, :id],
    ]
  end

  def remake_slug
    self.update_attribute(:slug, nil)
    self.save!
  end
  
end
