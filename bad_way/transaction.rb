require 'date'
class Transaction
  attr_accessor :timestamp, :value, :type
  def initialize(value, type)
    @value = value
    @timestamp = DateTime.new
    @type = type
  end
end
