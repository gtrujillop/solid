class BankProduct
  CREDIT_CARD_RATE = 0.025
  CREDIT_CARD_USAGE = 21_000
  LOAN_RATE = 0.012
  ACCOUNT_RATE = 0.01
  attr_accessor :id, :type, :initial_value, :current_value
  @@random_id = Random.new
  def initialize(type, initial_value)
    @type = type
    @initial_value = initial_value.to_f
    @current_value = @initial_value
    @transactions = []
    generate_product_number
  end

  def use_product(periods, value = nil)
    case @type
    when 'credit card'
      if value
        @current_value -= value
        period_payment = ((value / periods) + (value * CREDIT_CARD_RATE) + CREDIT_CARD_USAGE)
        puts "You must pay #{period_payment} per month in #{periods} month(s)"
        @transactions << Transaction.new(value, 'Credit Card Debit')
      end
    when 'loan'
      @current_value -= @initial_value
      period_payment = ((value / periods) + (value * LOAN_RATE))
      puts "You must pay #{period_payment} per month in #{periods} month(s)"
      @transactions << Transaction.new(value, 'Loan usage')
    when 'account'
      if value
        @current_value -= value
        puts "You paid #{value}."
        puts "Current funds: #{@current_value}"
        @transactions << Transaction.new(value, 'Account Debit.')
      end
    else
      0
    end
  end

  def generate_product_number
    @id = case @type
          when 'credit card'
            @@random_id.rand(10**16)
          when 'loan'
            @@random_id.rand(10**13)
          when 'account'
            @@random_id.rand(10**11)
          else
            0
          end
  end
  private :generate_product_number
end
