def shortestWordEditPath(source, target, words):
	if target not in words:
    return -1
	allwords = [source] + words
  #Preprocessing to get a dictionary that maps from (template word with 1 *) -> list of words that match
  dictionary = collections.defaultDict(list)
  for word in allwords:
    for i in range(len(word)):
      dictionary[word[0:i] + '*' + word[i+1:]].append(word)

  #Create a table with list of neighbors
  #[1,2].extend[3,4,5] -> [1,2,3,4,5]
  neighbors = collections.defaultDict(set)
  for word in allwords:
    for i in range(len(word)):
      template = word[0:i] + '*' + word[i+1:]
      for candidate in dictionary[template]:
        if candidate != word:
          neighbors[word].add(candidate)

  #BFS
  queue = [(start , 0)]
  while queue:
    node, level = queue[0]
    if node == target:
      return level
    else:
      for neighbor in neighbors[node]:
        #check that the neighbor has not been visited
        if neighbor in words:
          queue.append((neighbor, level + 1))
          words.remove(neighbor)
  return -1
	pass #your code goes here
