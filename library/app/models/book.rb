class Book < ActiveRecord::Base
  validates_presence_of :isbn, :title
  validates_uniqueness_of :isbn
  
  #has_many :authors
  has_and_belongs_to_many :authors
  
  def to_param
    "#{id}-#{title.gsub(/\s/, "-")}"
  end
end
