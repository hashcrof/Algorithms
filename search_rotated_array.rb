# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
    len = nums.length

    return -1 if len < 1

    i = 0
    j = len - 1
    pivot = find_pivot(nums)

    if pivot >= 0 && target <= nums[pivot - 1] && target > nums[len - 1]
        j = pivot - 1
    elsif pivot >= 0 && target >= nums[pivot] && target < nums[0]
        i = pivot
    end

    while i <= j
        mid = i + ((j - i) / 2)
        if target == nums[mid]
            return mid
        elsif target < nums[mid]
            j = mid - 1
        else
            i = mid + 1
        end
    end
    -1
end

def find_pivot(arr)
    j = arr.length - 1

    (j - 1).downto(0) do |i|
      if arr[i] >= arr[j]
        return i + 1
      end
    end
    -1
end
