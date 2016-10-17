class SuggestionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @suggestions = Suggestion.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @suggestion = Suggestion.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @suggestion = Suggestion.new(suggestion_params)
      if @suggestion.save
        flash[:notice]='Suggestion was successfully created.'
      redirect_to '/'
      else
       flash[:notice]="Suggestion could not be created"
       redirect_to '/'
      end
    end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
      if @suggestion.update(suggestion_params)
        flash[:notice]='Suggestion was successfully updated.'
        redirect_to '/'
      else
        flash[:notice]="Suggestion could not be updated"
      end
    end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    flash[:notice]='Suggestion was successfully deleted.'
    redirect to '/'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_suggestion
    @suggesiton = Suggestion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def suggestion_params
    params.require(:suggestion).permit(:name, :author, :ISBN, :Description, :status)
  end
end

