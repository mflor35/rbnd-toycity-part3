class Customer
  @@customers = Array.new
  attr_reader :name

  public

  def self.find_by_name(customer_name)
    @@customers.each do |customer|
      if customer_name == customer.name
        return customer
      end
    end
    DoesNotExistCustomerError.new(customer_name)
  end

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def name
    @name
  end

  def purchase(product)
    if(product.in_stock?)
      Transaction.new(self,product)
    else
      OutOfStockError.new(product.title)
    end
  end
  
  private

  def add_to_customers
    if !contains?
    @@customers << self
    else
      DuplicateCustomerError.new(@name)
    end
  end

  def contains?
    @@customers.each do |customer|
      if @name == customer.name
        return true
      end
    end
    return false
  end
end
