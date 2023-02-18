class CashRegister
    attr_accessor :total, :discount, :last_transaction

    attr_reader :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item title, price, quantity = 1
        self.last_transaction = price * quantity
        self.total = self.total + self.last_transaction
        quantity.times{|item| @items << title}    
    end

    def apply_discount
        if self.discount != 0
            discounted = (self.discount.to_f/100.0 * self.total.to_f)
            self.total = (self.total - discounted).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
        @items.pop
        self.total = self.total - self.last_transaction
    end
end

