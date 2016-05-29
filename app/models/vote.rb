class Vote < ActiveRecord::Base
  validates :user, :presence => true
  validates :recipe, :presence => true
end
