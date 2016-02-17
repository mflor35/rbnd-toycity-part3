class DuplicateProductError < StandardError
  attr_reader :msg
  def initialize(product_title)
    @msg = "DuplicateProductError: '#{product_title}' already exists."
    puts @msg
  end
end
