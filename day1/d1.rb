def getDistances (dataA, dataB) 
  foundcount = 0
  foundIndexesA = []
  foundIndexesB = []
  distances = []
  
  while foundcount != dataA.length() 
    curA = nil
    curB = nil
    curFIA = 0
    curFIB = 0
    for i in 0..(dataA.length()-1)
      if (!foundIndexesA.include? i) && ( curA == nil || dataA[i] < curA)
        curA = dataA[i]
        curFIA = i
      end
      if (!foundIndexesB.include? i) && ( curB == nil || dataB[i] < curB)
        curB = dataB[i]
        curFIB = i
      end
    end 
    foundIndexesA.push(curFIA)
    foundIndexesB.push(curFIB)
    foundcount += 1
    dist = curA - curB
    if dist < 0 
      dist *= -1
    end
    distances.push dist
  end
  puts "found Count: " + foundcount.to_s
  total = 0
  for i in distances
    total += i
  end
  return total
end


input = File.read("data")

lines = input.split("\n")

dataA = []
dataB = []

for line in lines do
  d = line.split("   ")
  dataA.push(d[0].to_i)
  dataB.push(d[1].to_i)
end
puts "Done reading into arrays"
puts "dA: " + dataA.length().to_s
puts "dB: " + dataB.length().to_s
puts "Distance: " + getDistances(dataA, dataB).to_s 
