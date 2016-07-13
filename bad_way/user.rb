class User
  attr_accessor :name, :email, :id, :phone, :account
  @@id_generator = Rand.new

  def initialize(name, email, phone)
    @name = name
    @email = email
    @phone = phone
    @id = @@id_generator.rand(40999999..79999999)
    @account = nil
    @transactions = []
  end

  def use_product(value, type)
    #code
  end

  def check_transaction_history
    #code
  end
end
