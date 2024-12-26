Approach to problems
Systematic thought process for approaching coding problems:
First Level Questions (Basic Pattern Recognition):


# Ask yourself:
# 1. Is it about arrays/strings? Consider:
   - Two Pointers (sorted array problems)
   - Sliding Window (consecutive elements/subarray)
   - Prefix Sum (range queries)

# 2. Is it about searching? Consider:
   - Binary Search (sorted data)
   - DFS (paths, tree/graph exploration)
   - BFS (shortest path, level-order)

# 3. Is it about optimization? Consider:
   - Dynamic Programming (optimal value problems)
   - Greedy (local optimal choices)
Second Level Questions (Specific Hints):


# Look for these hints in problem:
- "Consecutive" -> Sliding Window
- "Sorted" -> Binary Search or Two Pointers
- "Shortest/Least" -> BFS or Dijkstra
- "All Possible" -> Backtracking or DFS
- "Optimal/Maximum/Minimum" -> DP or Greedy
Example Thought Process:


"Find longest substring with k distinct characters"

Think:
1. Substring -> Consecutive elements
   -> Could be Sliding Window

2. "Longest" -> Need to track max
   -> Definitely need to consider all possibilities
   -> But don't need all combinations (just consecutive)
   -> Sliding Window confirmed!

3. "k distinct" -> Need to track frequency
   -> HashMap within Sliding Window
Process of Elimination:


Problem: "Find two numbers that sum to target"

Think:
1. Two numbers -> Pairs
   Options:
   - Two Pointers (if sorted)
   - HashMap (if unsorted)
   - Brute Force (last resort)

2. Eliminate:
   - No consecutive elements -> Not Sliding Window
   - No graph structure -> Not DFS/BFS
   - No optimal subproblems -> Not DP
Priority Order (Generally):


1. Simple Patterns:
   - Two Pointers
   - Sliding Window
   - Binary Search

2. Data Structure Based:
   - HashMap/Set solutions
   - Stack/Queue approaches

3. Graph Patterns:
   - DFS
   - BFS
   - Union Find

4. Complex Patterns:
   - Dynamic Programming
   - Backtracking
   - Complex Graph Algorithms
Example Decision Tree:


Is array sorted?
├── Yes: Consider Binary Search/Two Pointers
└── No: Are we looking for pairs?
    ├── Yes: Consider HashMap
    └── No: Is it about subarrays?
        ├── Yes: Consider Sliding Window
        └── No: Is it about paths/connections?
            ├── Yes: Consider DFS/BFS
            └── No: Is it optimization?
                ├── Yes: Consider DP/Greedy
                └── No: Consider other patterns
