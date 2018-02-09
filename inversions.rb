require './divide_conquer.rb'

class Inversions
  def self.count(arr)
    sorted_arr, num_of_inversions = DivideConquer.count_inversions_and_sort(arr)
    return num_of_inversions
  end
end
