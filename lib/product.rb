class Product
  attr_reader :title

  @@products = Array.new

  def initialize(options = {})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
  end

  private

  def add_to_products
    if !contains?
      @@products << self
    else
      DuplicateProductError.new(@title)
    end
  end

  def contains?
    @@products.each do |product|
      if @title == product.title
        return true
      end
    end
    return false
  end
end
