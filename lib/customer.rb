class Customer
  @@customers = Array.new

  def initialize(options={})
    add_to_customers
  end

  def self.all
    @@customers
  end

  def add_to_customers
    @@customers << self
  end
end
