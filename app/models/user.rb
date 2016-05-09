class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:twitter, :facebook]

  # Relations
  has_many :articles
  has_many :comments

  def email_required?
  	false
  end

  def self.find_or_create_by_omniauth(auth)
  	user = User.where(provider: auth[:provider], uid: auth[:uid]).first

  	unless user
  		user = User.create(
  			name: auth[:name],
  			username: auth[:username],
  			uid: auth[:uid],
  			provider: auth[:provider],
  			image: auth[:image],
  			password: Devise.friendly_token[0,20]
  			)
  	end
  	user
  end
end
