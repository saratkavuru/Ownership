class UserMailer < ApplicationMailer
  default from: 'notifications@frontdesk.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://frontdesk517oodd.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to our library')
  end
  def checkout_email(user)
    @user = user
    @url  = 'https://frontdesk517oodd.herokuapp.com'
    mail(to: @user.email, subject: 'Book Checkout Notification')
  end
  def book_available_email(user,book)
    @user=user
    @book=book
    @url  = 'https://frontdesk517oodd.herokuapp.com'
    mail(to: @user.email, subject: 'Book Available Notification')
  end
end
