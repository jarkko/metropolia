class AudioBook < Book
  attr_reader :duration
  
  def initialize(name, isbn, duration)
    super(name, isbn)
    @duration = duration
  end
  
  def to_s
    super + ", Duration: #{duration}"
  end
end