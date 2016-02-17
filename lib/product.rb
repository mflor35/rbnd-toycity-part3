class Product
  attr_reader :title, :price, :stock

  @@products = Array.new
  public

  def initialize(options = {})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def price
    @price
  end

  def stock
    @stock
  end

  def title
    @title
  end

  def in_stock?
    return @stock > 0
  end

  def self.in_stock
    in_stock_list = []
    @@products.each do |product|
      if(product.in_stock?)
        in_stock_list.push(product)
      end
    end
    return in_stock_list
  end

  def self.find_by_title(product_title)
    @@products.each do |product|
      if product_title == product.title
        return product
      end
    end
    DoesNotExistProductError.new(product_title)
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
