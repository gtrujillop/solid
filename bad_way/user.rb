require_relative 'bank_product'
require_relative 'transaction'
class User
  attr_accessor :name, :email, :id, :phone, :account, :products
  @@id_generator = Random.new

  def initialize(name, email, phone)
    @name = name
    @email = email
    @phone = phone
    @id = @@id_generator.rand(40_999_999..79_999_999)
    @products = []
  end

  def add_product(product)
    @products.push(product)
  end

  def use_product(type, periods, value = nil)
    product = @products.find do |p|
      p.type == type
    end
    product.use_product(periods, value)
  end

  def check_transaction_history
    @products.each do |p|
      p.transactions.each do |transaction|
        puts "Date and Hour: #{transaction.timestamp}"
        puts "Transaction Type: #{transaction.type}"
        puts "Value: $#{transaction.value}"
        puts "\n"
      end
    end
  end
end
