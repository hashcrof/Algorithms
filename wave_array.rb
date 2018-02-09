#Given an array of integers, sort the array into a wave like array and return it,
#In other words, arrange the elements into a sequence such that a1 >= a2 <= a3 >= a4 <= a5.....
#Given [1, 2, 3, 4, 5]
#One possible answer : [2, 1, 4, 3, 5]
#Another possible answer : [5, 3, 2, 1, 4]
#return lexicographically smallest i.e [2,1,4,3,5]

class WaveArray

  def self.wave(a)
    n = a.size
    a = a.sort #to return lexicographically smallest
    (0...n).step(2) do |i|
         if (i>0) && (a[i]<a[i-1])
             a[i], a[i-1] = a[i-1], a[i]
         end

         if (i<n-1) && (a[i]<a[i+1])
             a[i], a[i+1] = a[i+1], a[i]
         end
     end
     a
  end

end
