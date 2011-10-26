class User < ActiveRecord::Base

  ROLES = %w[admin]

  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable #, :registerable

  attr_accessible :email, :password, :password_confirmation, :remember_me

end