class Product
  @@products = Array.new
  def initialize(*args)
    @@products << self
  end


  def self.all
    @@products
  end

end
