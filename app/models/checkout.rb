class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :book
  after_create :send_checkout_email,:change_checkout_status,:checkout_possible?,:change_book_status
def change_book_status
  self.book.update_attribute(:status, :Booked)
end
def send_checkout_email
  UserMailer.checkout_email(self.user).deliver_now
  end
  def change_checkout_status
    self.update_attribute(:status, :Active)
  end
  def checkout_possible?
  raise "Checking out book in the past is not allowed" if (DateTime.now - 2.hours) > self.start_time
  raise "Checkout cannot be made more than one week in the future" if(DateTime.now + 7.days < self.start_time)
  raise "Checkout not possible since the book is checked out by another member" unless self.book.available?
  else return true
end
end
