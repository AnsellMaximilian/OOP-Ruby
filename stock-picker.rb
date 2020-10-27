def stock_picker(prices)
    buy_day = 0
    sell_day = 1

    prices.each_with_index do |price, index|
        if index == 0
            buy_day = index
        end

        prices.each_with_index do |price_compare, index_compare|
            
            if index_compare > index
                
                if price_compare - price >= prices[sell_day] - prices[buy_day]
                    buy_day = index
                    sell_day = index_compare
                    puts "ass #{buy_day} #{sell_day} index=#{index}"
                end

            end

        end
    end
    puts [buy_day, sell_day]
end

stock_picker([17,3,6,9,15,8,6,1,10])