require_relative '../../spec/spec_helper.rb'
describe User do
  let(:name) { 'mock_user' }
  let(:email) { 'mock.user@miemail.com' }
  let(:phone) { '3245454' }
  let(:user) { User.new(name, email, phone) }
  let(:type) { 'credit card' }
  let(:initial_value) { 4_000_000 }
  let(:product) { BankProduct.new(type, initial_value) }

  describe 'initialize' do
    it 'generates the user id' do
      expect(user.id).to_not be_nil
    end

    it 'generates a numeric user id' do
      expect(user.id).to be_an_instance_of(Fixnum)
    end

    it 'initializes an empty array of products' do
      expect(user.products).to be_empty
    end
  end
  describe '#add_product' do
    it 'adds a product to the list' do
      user.add_product(product)
      expect(user.products).to_not be_empty
    end
  end
  describe '#use_product' do
    it 'adds a product to the list' do
      type = 'credit card'
      periods = 3
      value = 1_000_000
      current_value = product.current_value
      user.add_product(product)
      expect { user.use_product(type, periods, value) }.to change { product.current_value }.from(current_value).to(current_value - value)
    end
  end
  describe '#use_product' do
    it 'adds a product to the list' do
      type = 'credit card'
      periods = 3
      value = 1_000_000
      current_value = product.current_value
      user.add_product(product)
      expect { user.use_product(type, periods, value) }.to change { product.current_value }.from(current_value).to(current_value - value)
    end
  end
end
