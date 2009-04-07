class Author < ActiveRecord::Base
  #belongs_to :book
  has_and_belongs_to_many :books
  
  def name
    "#{first_name} #{last_name}"
  end
end
