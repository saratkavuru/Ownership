class AvailabilityNotificationsController < ApplicationController
before_action :authenticate_user!
  def create
    an = AvailabilityNotification.new
    @book = Book.find(params[:book_id])
    @user = current_user
    an.user = @user
    an.book = @book
    if an.save
      flash[:notice] = "Registered for notification for #{an.book.name}."
    else flash[:notice] = "Already Registered for notification for #{an.book.name}."
    end
    redirect_to root_path
  end

end
