class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :token_authenticatable

  has_many :downloadables
  has_many :mods

  recommends :downloadables

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  after_create :send_analytics

  attr_accessible :email
  attr_accessible :username
  attr_accessible :password, :password_confirmation, :remember_me

  private

  def send_analytics
    Librato.increment "account.signup" if Rails.env.production?
  end
end
