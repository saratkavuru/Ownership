class User < ApplicationRecord
  has_many :books
  rolify
  after_create :assign_default_role

  def assign_default_role
    add_role(:member)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
