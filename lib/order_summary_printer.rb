class OrderSummaryPrinter
  def initialize(io)
    @io = io
  end

  def print_summary(order)
    if order.get_order == {}
      @io.puts "You haven't added anything to your order yet."
    else
      @io.puts "Your order summary:"
      order.get_order.each do |meal, quantity|
        @io.print "#{quantity}x #{meal.get_name} - £#{sprintf("%.2f", meal.get_price)}"
        if quantity > 1
          @io.puts " each"
        else
          @io.print "\n"
        end
      end
      @io.puts "Total: £#{sprintf("%.2f", order.get_total)}"
      @io.puts ""
    end
  end
end