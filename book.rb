class Book
  include Comparable
  @@amount = 0

  attr_reader :name, :isbn, :authors

  def initialize(name = "", isbn = "")
    @@amount += 1
    @name, @isbn = name, isbn
    @authors = []
  end

  def add_author(author)
    self.authors << author
  end

  def <=>(other)
    name.to_s <=> other.name.to_s
  end

  def author_names
    @authors.map{|a| "#{a.first_name} #{a.last_name}"}.join(", ")
  end

  def to_s
    "#{name}, #{isbn}, by #{author_names}"
  end

  def self.amount
    @@amount
  end
end
