class User < ApplicationRecord
  has_many :Checkout
  has_many :availability_notifications
  validates :name,:email,:password , presence: true
  rolify

  after_create :assign_default_role, :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
  def assign_default_role
    add_role(:member)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
