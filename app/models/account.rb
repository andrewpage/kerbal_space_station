class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :token_authenticatable

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  attr_accessible :email
  attr_accessible :username
  attr_accessible :password, :password_confirmation, :remember_me
end
