class Customer
  @@customers = Array.new
  attr_reader :name

  public

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
