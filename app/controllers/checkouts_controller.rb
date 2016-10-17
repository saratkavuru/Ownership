class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  def new
    @checkout=Checkout.new
  end
  def show
    @checkout=Checkout.all
  end
  def index
  end
  def create
    @checkout=Checkout.new(checkout_params)
      if @checkout.save
    session[:checkout_id] = @checkout.id
    flash[:notice]='Book was successfully checked out. Admin will review the request.'
    redirect_to ("/")
        else flash[:notice]='Book could not be checked out.'
        redirect_to ("/")
        end
  end
  def destroy
    @checkout.destroy
    flash.now[:notice]='Checkout was successfully deleted. Admin will review the request.'
    redirect to '/'
  end
def history

end

  def return
    @checkout = Checkout.find(params[:id])
    @checkout.update(:status => "Archive ")
    @checkout.book.update(:status => "Available")
   # @checkout.book.availability_notifications.users.each do |user|
    users = @checkout.book.availability_notifications.map {|reg| reg.user}.uniq
    users.each do |user|
    UserMailer.book_available_email(user, @checkout.book).deliver_now
    redirect_to '/'
    end
    end
def checkout_params
  params.require(:checkout).permit(:user_id, :book_id, :start_time)
end
end
