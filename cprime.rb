# frozen_string_literal: true

require 'prime'

# method to calculate longest consecutive prime sum
def cprime_sum(num)  
  p_array = []
  prev_count = 0
  last_prime = 2
  break_flag = false
  t1 = Time.now

  Prime.each(num) do |p|
    p_array << p
    p_clone = p_array.dup
    loop do
      sum = p_clone.sum
      if sum >= num
        break_flag = true
        break
      end

      count = p_clone.size
      if Prime.prime?(sum) && count > prev_count
        last_prime = sum
        prev_count = count
      end

      p_clone.shift
      break if p_clone.empty?
    end
    break if break_flag == true
  end

  t2 = Time.now
  puts 'Prime :  ' + last_prime.to_s
  puts 'Length: ' + prev_count.to_s
  puts 'Time  :' + (t2 - t1).to_s
end

num = ARGV.size.zero? ? 1_000_000 : ARGV[0].to_i
cprime_sum(num)
