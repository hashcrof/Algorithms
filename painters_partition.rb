class PaintersPartition

  def self.number_of_painters(arr, length_per_painter)
    n = arr.size
    total = 0
    painters = 0
    0.upto(n-1) do |i|
      total += arr[i]
      if total > length_per_painter #the smaller the length_per_painter, the more painters needed
        painters += 1
        total = arr[i]
      end
    end
    painters
  end

  def self.partition(arr, k, t)
    n = arr.size
    low = arr.max
    high = arr.reduce(:+)
    while low < high do
      mid = (high + low) / 2
      painters = number_of_painters(arr, mid)
      if painters == k
        break
      elsif painters < k
        high = mid
      else
        low = mid + 1
      end
    end
    p "#{low}, #{high}"
    partition_totals = partition_totals(arr, high)
    puts partition_totals.max * t
  end

  def self.partition_totals(arr, sum)
    n = arr.size
    partition_totals = []
    total = 0
    #time
    (n-1).downto(0) do |idx|
      total += arr[idx]
      if total > sum
          partition_totals << total - arr[idx]
          total = arr[idx]
      end
    end
    partition_totals
  end
end
