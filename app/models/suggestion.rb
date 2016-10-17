class Suggestion < ApplicationRecord
  belongs_to :books
  before_create :default_status
  before_save :create_book_if_processed
  validates :name,:author,:ISBN,:Description ,presence:true
  validates :ISBN,uniqueness: true
  validates :name, :uniqueness => {:scope => :author}
  def default_status
    self.status="Not Processed"
  end
  def create_book_if_processed
    if self.status== "Processed"
      book = Book.new(:ISBN => self.ISBN,
                      :name => self.name,
                      :Description => self.Description,
                      :author => self.author
                      )
      book.save
    end
  end
  def to_s
    return self.name
  end
end
