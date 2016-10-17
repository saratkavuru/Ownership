class Book < ApplicationRecord
  has_many :checkouts,:dependent => :destroy
  has_many :availability_notifications,:dependent => :delete_all
  before_create :default_status
validates :name,:author,:ISBN,:Description ,presence:true
validates :ISBN,uniqueness: true
validates :name, :uniqueness => {:scope => :author}

  def available?
    if self.status=='Available'
      return true
      else return false
    end
  end
  def default_status
    self.status="Available"
  end
  def to_s
    return self.name
  end
end
