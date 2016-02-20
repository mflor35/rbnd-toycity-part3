class Customer
  @@customers = Array.new
  attr_reader :name, :id

  public

  def initialize(options={})
    @name = options[:name]
    add_to_customers
    @id = @@customers.count
  end

  def self.find_by_name(customer_name)
    @@customers.each do |customer|
      if customer_name == customer.name
        return customer
      end
    end
    DoesNotExistCustomerError.new(customer_name)
  end

  def self.find_by_id(customer_id)
    @@customers.each do |customer|
      if customer.id == customer_id
        return customer
      end
    end
  end

  def id
    @id
  end

  def self.all
    @@customers
  end

  def name
    @name
  end

  def purchase(product)
    begin
      raise OutOfStockError.new(product.title) unless product.in_stock?
      Transaction.new(self,product)
    rescue Exception => msg
      puts msg
    end
  end

  private

  def add_to_customers
    begin
      raise DuplicateCustomerError.new(@name) unless !contains?
      @@customers << self
    rescue Exception => msg
      puts msg
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
