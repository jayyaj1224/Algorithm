/*

Took 25minutes.

Runtime: 5 ms, faster than 86.74% of Swift online submissions for Binary Tree Right Side View.
Memory Usage: 14.1 MB, less than 59.67% of Swift online submissions for Binary Tree Right Side View.

Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

Example 1:
Input: root = [1,2,3,null,5,null,4]
Output: [1,3,4]

Example 2:
Input: root = [1,null,3]
Output: [1,3]

Example 3:
Input: root = []
Output: []

*/

class Solution {
    var ans: [Int] = []
    var maxDepth = -1
    var breadthInDepth = [Int:Int]()
    
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return ans }
        
        recursion(root)
        return ans
    }
    
    func recursion(_ root: TreeNode, _ depth: Int = 0) { 
        if depth <= maxDepth { 
            ans[depth] = root.val
        } else { 
            ans.append(root.val)
            maxDepth+=1
        }
        
        if let lhs = root.left { 
            recursion(lhs, depth+1)
        }
        
        if let rhs = root.right { 
            recursion(rhs, depth+1)
        }
    }
}
