arr = [4,7,4,10,9,1,5]

#linear time, with 2n
def profit(arr)
  profit = 0
  #buy and sell index
  sell = 0
  #set min to first value
  min = arr[0]

  arr.each_with_index do |x,i|
    #get min value
    min = x if min > x
    tmp = x - min
    #if difference is greater than previous profit, assign new profit
    if profit < tmp
      #sets sell index and assign new profit
      sell = i
      profit = tmp
    end
  end
  puts profit

  #another loop to get the buy index
  buy = 0
  arr.each_with_index do |x,i|
    #if different is equal to profit, then it must be buy index
    buy = i; break if arr[sell] - x == profit
    #i didn't want to use Array.index because it may cause problems with identical values
  end
  return {'buy':buy,'sell':sell}
end

#slower version with n^2
def profitslow(arr)
  max = 0
  buy = 0
  sell = 0
  len = arr.length
  #improved version of the combination
  arr.each_with_index do |x,i|
    j = i
    while (j < len)
      tmp = arr[j] - arr[i]
      if max < tmp
        max = tmp
        buy = i
        sell = j
      end
      j += 1
    end
  end
  puts arr[sell] - arr[buy]
  return {'buy':buy,'sell':sell}
end

puts profit(arr)
puts profitslow(arr)
