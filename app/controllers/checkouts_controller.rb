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
       @checkout.save
    session[:checkout_id] = @checkout.id
    flash[:notice]='Book was successfully checked out. Admin will review the request.'
    redirect_to ("/books")
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
    # bookid = @checkoutid.book_id
    @checkout.book.update(:status => "Available")
    redirect_to '/'
  end
def checkout_params
  params.require(:checkout).permit(:user_id, :book_id, :start_time)
end
end
