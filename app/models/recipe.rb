class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many   :votes

  validates :title,    :presence => true
  validates :tagline,  :presence => true
  validates :link,     :presence => true
  validates :user,     :presence => true

  def self.ordered
    order("votes_count DESC")
  end

  def self.filter_by_date(start_date, end_date)
    where(:created_at => start_date.to_time..end_date.to_time)
  end
end
