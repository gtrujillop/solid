class BankProduct
  CREDIT_CARD_RATE = 0.025
  LOAN_RATE = 0.012
  ACCOUNT_RATE = 0.01
  attr_accessor :id, :client, :type, :initial_value, :current_value
  @@random_id = Random.new

  def initialize(type, client, initial_value)
    @type = type
    @client = client
    @initial_value = initial_value.to_f
    @current_value = @initial_value
    generate_product_number
  end

  def generate_product_number
    @id = case  @type
    when 'credit card'
      @id = @@random_id.rand(10**16)
    when 'loan'
      @id = @@random_id.rand(10**13)
    when 'account'
      @id = @@random_id.rand(10**11)
    else
      @id = 0
    end
  end
  private :generate_product_number
end
