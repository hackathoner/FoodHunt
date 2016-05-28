class Recipe < ActiveRecord::Base

  belongs_to :user

  validates :title,    :presence => true
  validates :tagline,  :presence => true
  validates :link,     :presence => true
  validates :user,     :presence => true
end
