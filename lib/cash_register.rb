class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction_amount
    
    def initialize(discount=0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction_amount = 0
    end
    
    def add_item(title, price, quantity=1)
      item_cost = price * quantity
      self.total += item_cost
      quantity.times do
        items << title
      end
      self.last_transaction_amount = item_cost
    end
    
    def apply_discount
      if discount > 0
        discount_percent = (100.0 - discount.to_f) / 100.0
        self.total *= discount_percent
        "After the discount, the total comes to $#{total.to_i}."
      else
        "There is no discount to apply."
      end
    end
    
    def void_last_transaction
      self.total -= last_transaction_amount
    end
  end
  
