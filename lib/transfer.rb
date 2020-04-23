class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  # can initialize a Transfer (FAILED - 1)
  # initializes with a sender (FAILED - 2)
  # initializes with a receiver (FAILED - 3)
  # always initializes with a status of 'pending' (FAILED - 4)
  # initializes with a transfer amount (FAILED - 5)
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
  #it can only reverse executed transfers
    if valid? && receiver.balance > amount && self.status == "complete"
    receiver.balance -= amount
    sender.balance += amount
    self.status = "reversed"
    end
  end
end