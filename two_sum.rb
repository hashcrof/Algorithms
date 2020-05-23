
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    seen = Hash.new {|h, k| h[k] = -1 }

    #can optimize space complexity by using something different from each_with_index
    nums.each_with_index do |el, idx|
        diff = target - el
        return [seen[diff], idx] if seen[diff] > -1
        seen[el] = idx
    end
end


=begin
Mistakes made:

1) seen[diff] = idx instead of seen[el] = idx
=end
