module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
  cardnumber = number.to_s.reverse.chars.map(&:to_i)
  sum = 0

  cardnumber.each_slice(2) do |odd, even|
    sum += odd
    next unless even
    even *= 2
    even = even.divmod(10).inject(:+) if even > 9
    sum += even
  end

  return sum.modulo(10) == 0
end


##    nums_a = number.to_s.chars.map(&:to_i)
##    checkdigit = nums_a[nums_a.length - 1]
##    nums_a[nums_a.length - 1] = 0
##    nums_a.reverse!
##    sum=0
##    for i in 1..nums_a.length
##      if i%2==0 
##        sum = sum + nums_a[i].to_i  
##        next
##      end
##      nums_a[i] = (nums_a[i].to_i*2 < 9 ) ? (nums_a[i].to_i*2) : (nums_a[i].to_i*2 - 9)
##      sum = sum + nums_a[i].to_i
##    end 
##  (10 - sum%10).to_i == checkdigit.to_i
##  end
end
