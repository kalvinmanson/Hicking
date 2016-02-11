class Category < ActiveRecord::Base

  has_and_belongs_to_many :options, :before_add => :validates_option
  has_and_belongs_to_many :places, :before_add => :validates_place

  def validates_place(place)
    raise ActiveRecord::Rollback if self.places.include? place
  end
  def validates_option(option)
    raise ActiveRecord::Rollback if self.options.include? option
  end

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
