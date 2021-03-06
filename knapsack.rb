=begin
You are given weights and values of N items, put these items in a knapsack of capacity W to get the maximum total value in the knapsack.
Note that we have only one quantity of each item.
In other words, given two integer arrays val[0..N-1] and wt[0..N-1] which represent values and weights associated with N items respectively.
Also given an integer W which represents knapsack capacity, find out the maximum value subset of val[] such that sum of the weights of this subset is smaller than or equal to W.
You cannot break an item, either pick the complete item, or don’t pick it (0-1 property).
=end

def knapsack(vals, wts, capacity)
  weight_value_key = []
  wts.each_with_index do |el, idx|
    weight_value_key << [el, vals[idx]]
  end

  weight_value_key = weight_value_key.sort {|a, b| a[0] <=> b[0]}
  puts weight_value_key.inspect
  n = weight_value_key.length
  rows =  n + 1
  cols = capacity + 1

  knapsack_grid = Array.new(rows) { Array.new(cols) }

  max = 0

  0.upto(n) do |i|
    #cell = k[i][j]
    0.upto(capacity) do |j|
      item_idx = i - 1
      item_wt = weight_value_key[item_idx][0]
      item_val = j >= item_wt ? weight_value_key[item_idx][1] : 0
      leftover_wt_capacity = j - item_wt
      leftover_val = knapsack_grid[item_idx][leftover_wt_capacity]

      knapsack_grid[i][j] = leftover_val && leftover_wt_capacity >= 0 ?
      [leftover_val + item_val, knapsack_grid[item_idx][j]].max : 0

      if knapsack_grid[i][j] > max
        max = knapsack_grid[i][j]
      end
    end
  end

  max
end

puts knapsack([60, 100, 120], [10, 20, 30], 50) == 220
