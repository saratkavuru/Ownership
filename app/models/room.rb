class Room < ApplicationRecord
belongs_to :library
enum capacity: { "Small-4 Chairs" => 4,"Medium-6 Chairs" => 6,"Large-8 Chairs" => 8 }
validates :room_number, :presence => true
validates :room_number, :uniqueness => {:scope => :library}
validates :capacity, :presence => true
validates :library, :presence => true
end
