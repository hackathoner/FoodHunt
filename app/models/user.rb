class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  has_many :recipes
  has_many :votes

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name      = auth.info.name
      user.email     = auth.info.email
      user.image     = auth.info.image
      user.password  = Devise.friendly_token[0,20]
    end
  end

  def submitted
    Recipe.where(:user => self)
  end

  def voted
    recipes = []

    votes = Vote.where(:user => self)
    votes.each do |vote|
      recipes.push(vote.recipe)
    end
    recipes
  end

  def voted?(recipe)
    recipe.votes.each do |vote|
      if vote.user = self
        return true
      end
    end

    false
  end

end
