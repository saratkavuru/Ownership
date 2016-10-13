class Book < ApplicationRecord
  has_many :checkout

  def to_s
    return self.name
  end
end
