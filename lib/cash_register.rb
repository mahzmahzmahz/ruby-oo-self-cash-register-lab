
require 'pry'

#Idk if people read this stuff, but I needed to talk myself through this code to make sure I got it as I went along. I know this looks messy but it helped a lot. 

class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction #big thanks to Josh for pointing out the need for a last_transaction instance - scroll down to #add_item

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
       self.total += price * quantity #total + price multiplied by however many items there are
       quantity.times do #items will be shoveled to title the amount of times the number quantity represents deems appropriate
        @items << title
        
       end
       @last_transaction = price * quantity #this allowed me to store whatever ran through this method most recently as last_transaction to be used in the last method

    end

    def apply_discount
        if @discount != 0 #if the dicount is not 0
            @total = @total - (@total * (@discount/100.0)) #@total will be equal to (lets say a 20% discount on $1000) 1000 = 1000 - (1000 * (20/100))
             "After the discount, the total comes to $#{@total.truncate}." #first time running this it came back 800.0, use .truncate to knock out that decimal
        else
            @total
             "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - @last_transaction
    end

end
