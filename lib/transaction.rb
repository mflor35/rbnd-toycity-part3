class Transaction
  @@transactions = []
  attr_reader :customer, :product, :id
  def initialize(init_customer,init_product)
    @customer = init_customer
    @product = init_product
    @id = @@transactions.count
    decrease_product_stock
  end

  def product
    @product
  end

  def customer
    @customer
  end

  def id
    @id
  end

  private
  def add_to_transaction
    @@transactions << self
  end

  def decrease_product_stock
    @product.set_stock(@product.stock - 1)
  end
end
