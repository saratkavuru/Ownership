class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :book
  before_save :checkout_possible?
  after_save :change_book_status

def change_book_status
  self.book.update_attribute(:status, false)
end
def checkout_possible?
  raise "Checking out book in the past is not allowed" if (DateTime.now - 2.hours) > self.start_time
  raise "Checkout cannot be made more than one week in the future" if(DateTime.now + 7.days < self.start_time)
  raise "Checkout not possible since the book is checked out by another member" unless self.book.status
  else return true
end
end
