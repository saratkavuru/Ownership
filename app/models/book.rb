class Book < ApplicationRecord
  has_many :checkouts
  before_create :default_status

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
