class Library < ApplicationRecord
  has_many :rooms
  validates :name , :presence => true
  enum name: { Hunt: 0, Hill: 1 }

  def to_s
    return self.name
  end
end
