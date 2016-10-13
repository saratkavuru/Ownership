class Book < ApplicationRecord
  has_many :checkouts

  def available?
    return self.status
  end
  def to_s
    return self.name
  end
end
