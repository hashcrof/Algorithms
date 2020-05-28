class DivideConquer

  def self.quick_sort(arr, low= 0, high = arr.size - 1)
    if low < high
      p_index = partition_index(arr, low, high)
      quick_sort(arr, low, p_index - 1)
      quick_sort(arr, p_index + 1, high)
    end
    arr
  end

  def self.partition_index(arr, low, high) #[ 658, 786, 531, 47, 169, 397], 0 , 5
    pivot_index = rand(low..high)
    pivot = arr[pivot_index]
    arr[pivot_index], arr[high] = arr[high], arr[pivot_index] #pivot is at the end
    p_index = low
    (low).upto(high-1) do |idx|
      if arr[idx] <= pivot
        arr[idx], arr[p_index] = arr[p_index], arr[idx]
        p_index += 1
      end
    end
    arr[p_index], arr[high] = arr[high], arr[p_index]
    p_index
  end

  def self.merge_sort(arr) #Onlogn time; On space
    n = arr.size
    return arr if n <= 1
    mid = n / 2
    lft = arr[0...mid]
    rgt = arr[mid...n]
    merge(merge_sort(lft), merge_sort(rgt))
  end

  def self.merge(lft, rgt)
    sorted = []
    until lft.empty? or rgt.empty?
      sorted << lft.first <= rgt.first ? lft.shift : rgt.shift
    end
    sorted + lft + rgt
  end


  def self.count_inversions_and_sort(arr)
    n = arr.size
    return [arr, 0] if n <= 1
    mid = n/2
    lft, inv_lft = count_inversions_and_sort(arr[0...mid])
    rgt, inv_rgt = count_inversions_and_sort(arr[mid...n])
    final_arr, split_inv = count_split_inversions_and_sort(lft, rgt)
    return [final_arr, inv_lft + inv_rgt + split_inv]
  end

  def self.count_split_inversions_and_sort(lft, rgt)
    final_arr = []
    split_inv = 0
    until lft.empty? or rgt.empty?
      if lft.first < rgt.first
        final_arr << lft.shift
      else
        final_arr << rgt.shift
        split_inv += lft.size
      end
    end
    final_arr = final_arr + lft + rgt
    [final_arr, split_inv]
  end
end
