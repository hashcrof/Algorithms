# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
    n = nums.length
    return n if n < 1

    #pointer i points to el = 0
    #point j points to el != 0
    i = j = 0

    while j < n
        #increments j until nums[j] is not zero
        if nums[j] != 0
            temp = nums[i]
            nums[i] = nums[j]
            nums[j] = temp
            i += 1
        end
        j += 1
    end
    i
end

=begin

Mistakes

Did not swap nums[i] & nums[j] initially
Incremented i before swap

=end
