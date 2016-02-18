class Transaction
  @@transactions = []
  attr_reader :customer, :product, :id
  def initialize(init_customer,init_product)
    @customer = init_customer
    @product = init_product
    add_to_transaction
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

  def self.all
    @@transactions
  end

  def self.find(transaction_id)
    @@transactions.each do |transaction|
      if transaction.id == transaction_id
        return transaction
      end
    end
  end

  def self.export_report(filename)
    report = File.new(filename,"w+")
    header = "|%2s|%50s|%20s|\n"%["ID","Product Purchased","Customer Name"]
    dashes = "-"*(header.length - 1) + "\n"
    report.write(dashes)
    report.write(header)
    report.write(dashes)
    @@transactions.each do |transaction|
      report.write("|%2s|%50s|%20s|\n"%["#{transaction.id}","#{transaction.product.title}","#{transaction.customer.name}"])
    end
    report.write(dashes)
    report.close
  end

  private

  def add_to_transaction
    @@transactions << self
  end

  def decrease_product_stock
    @product.set_stock(@product.stock - 1)
  end


end
