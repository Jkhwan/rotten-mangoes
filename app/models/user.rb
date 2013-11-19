class User < ActiveRecord::Base
  has_secured_password

  validates :email, presence: true
  validates :password, length { in: 6..20 }, on: :create
  validates :firstname, presence: true
  validates :lastname, presence: true

end
