require './divide_conquer.rb'
class Sort

  def self.merge_sort(arr)
    DivideConquer.merge_sort(arr)
  end

  def self.quick_sort(arr)
    DivideConquer.quick_sort(arr)
  end

  def self.insertion_sort(arr) #On^2 time; O1 space
    #arr = [5,4]
    n = arr.size #n = 2
    return arr if n <= 1
    for i in (1...n) #i = 1
      key = arr[i]  #key = 4
      j = i - 1     #j = 0
      while j >= 0 and arr[j] > key do #j >= 0 and 5 > 4
        arr[j+1] = arr[j]  #arr[0+1] = arr[0] = 5; arr = [5,5]
        j -= 1 #j = -1
      end
      arr[j+1] = key #arr[-1+1] = 4; arr[0] = 4; arr = [4,5]
    end
    arr #[4,5]
  end

  def self.selection_sort(arr) #On^2 time; O1 space
    n = arr.size
    return arr if n <= 1

    #swap the element in the first index with the smallest value in the array and so on...
    for i in (0...n - 1)
      min = i
      j = i + 1
      while j < n do
        min = j if arr[j] < arr[min]
        j += 1
      end
      arr[i], arr[min] = arr[min], arr[i] #swap
    end
    arr
  end
end
