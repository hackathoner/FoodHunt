class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe, :counter_cache => true

  validates :user, :presence => true
  validates :recipe, :presence => true
end
