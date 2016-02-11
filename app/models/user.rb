class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :city

  #Paperclip Avatar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

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
  
  #Socializame
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_likeable
  acts_as_mentionable
  
end
