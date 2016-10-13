class Book < ApplicationRecord
  has_many :checkouts

  def to_s
    return self.name
  end
end
