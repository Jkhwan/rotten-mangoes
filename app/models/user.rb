class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :email, presence: true, email: true
  validates :password, length: { in: 6..20 }, on: :create
  validates :firstname, presence: true
  validates :lastname, presence: true

  def full_name
    "#{firstname} #{lastname}".strip
  end
end
