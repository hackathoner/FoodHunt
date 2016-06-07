class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many   :votes

  validates :title,    :presence => true, :length  => { :maximum => 255 }
  validates :tagline,  :presence => true, :length  => { :maximum => 255 }
  validates :link,     :presence => true
  validates :user,     :presence => true

  validate  :user_under_limit?

  validates_format_of :link, :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i,   :message => "Please use a valid url"
  validates_format_of :image, :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i,  :message => "Please use a valid url", :allow_nil => true

  def self.ordered
    order("votes_count DESC")
  end

  def self.filter_by_date(start_date, end_date)
    where(:created_at => start_date.to_time..end_date.to_time)
  end

  def user_under_limit?
    if Recipe.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, user: user).count > 1
      errors.add(:user, "You can't post more than two times a day")
    end
  end
end
