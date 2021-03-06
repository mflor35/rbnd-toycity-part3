class DuplicateProductError < StandardError
  attr_reader :msg
  def initialize(product_title)
    @msg = "DuplicateProductError: '#{product_title}' already exists."
    super(@msg)
  end
end

class DoesNotExistProductError < StandardError
  attr_reader :msg
  def initialize(product_title)
    @msg = "DoesNotExistProductError: '#{product_title}' does not exists."
    super(@msg)
  end
end

class DuplicateCustomerError < StandardError
  attr_reader :msg
  def initialize(customer_name)
    @msg = "DuplicateCustomerError: '#{customer_name}' already exists."
    super(@msg)
  end
end

class DoesNotExistCustomerError < StandardError
  attr_reader :msg
  def initialize(customer_name)
    @msg = "DoesNotExistCustomerError: '#{customer_name}' does not exists."
    super(@msg)
  end
end

class OutOfStockError < StandardError
  attr_reader :msg
  def initialize(product_title)
    @msg = "OutOfStockError: '#{product_title}' is out of stock."
    super(@msg)
  end
end
