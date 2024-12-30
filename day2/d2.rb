def increaseDecreaseCheck (line)
  increasing = true
  decreasing = true

  increasing = line[0] < line[1] 
  decreasing = line[0] > line[1]

  for c in 0..line.length()-2
    if line[c] < line[c+1]
      decreasing = false
    end
    if line[c] > line[c+1]
      increasing = false
    end

    if !increasing && !decreasing
      return 0
    end
  end

  if increasing && decreasing
    return 0
  elsif increasing
    return 1
  elsif decreasing
    return 2
  end
end

def checkIncDecAmt (line)
  for i in 0..line.length()-2
    diff = (line[i] - line[i+1])
    if (diff < -3) || (diff > 3) || (diff == 0)
      return false
    end
  end
  return true
end

def increaseDecreaseCheckCorrection (line)
  increasing = true
  decreasing = true

  increasing = line[0] < line[1] 
  decreasing = line[0] > line[1]

  correction = true

  for c in 0..line.length()-2
    if line[c] < line[c+1]
      if correction
        correction = false
        line.delete_at(c)
      else
        decreasing = false
      end
    end
    if line[c] > line[c+1]
      if correction
        correction = false
        line.delete_at(c)
      else
        increasing = false
      end
    end

    if !increasing && !decreasing
      return 0
    end
  end

  if increasing && decreasing
    return 0
  elsif increasing
    return 1
  elsif decreasing
    return 2
  end
end

def checkIncDecAmtCorrection (line)
  correction = true
  for i in 0..line.length()-2
    diff = (line[i] - line[i+1])
    if (diff < -3) || (diff > 3) || (diff == 0)
      if correction
        correction = false
      else
        return false
      end
    end
  end
  return true
end



#-------------------------------------------------
input = File.read("testdata")

lines = input.split("\n")
count = 0
for line in lines
  nums = line.split(" ").map(&:to_i)
#  puts increaseDecreaseCheck nums
#  puts checkIncDecAmt nums
  puts line
  if ((increaseDecreaseCheckCorrection nums) > 0) && (checkIncDecAmtCorrection nums )
    count += 1
    puts "True"
  else
    puts "False"
  end

end

puts count
