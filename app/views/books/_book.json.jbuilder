json.extract! book, :id, :name, :author, :ISBN, :Description, :status, :created_at, :updated_at
json.url book_url(book, format: :json)