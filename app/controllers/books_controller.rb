class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

def search_results
  search_string = params[:book ][:search_string]
  if params[:book][:status]=="1"
    status = "Available"
  else
    status="Booked"
  end
  if(status)
    @books = Book.find_by_sql("Select * from books where (lower(name) LIKE lower('%#{search_string}%')
                                  OR lower(author) LIKE lower('%#{search_string}%')
                                  OR lower(isbn) LIKE lower('%#{search_string}%')
                                  OR lower(description) LIKE lower('%#{search_string}%'))
                                  AND status='#{status}'
                                  ")
  else
    @books = Book.find_by_sql("Select * from books where lower(name) LIKE lower('%#{search_string}%')
                                  OR lower(author) LIKE lower('%#{search_string}%')
                                  OR lower(isbn) LIKE lower('%#{search_string}%')
                                  OR lower(description) LIKE lower('%#{search_string}%')
                                  ")
  end

end

  def search
  end
  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def issue
  @book = Book.find(params[:id])
  @user = current_user
  bookid = @book[:id]
  @checkout= Checkout.create(user_id: @user[:id], book_id: bookid, start_time: DateTime.current())
  flash[:notice]='Book was successfully checked out. Admin will review the request.'
  redirect_to '/'
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :author, :ISBN, :Description, :status)
    end
end
