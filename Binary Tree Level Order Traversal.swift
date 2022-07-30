/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    var ans = [[Int]]()
    var dic = [Int:[Int]]()
    var lastDepth = 0
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if let root = root { 
            dic[0] = [root.val]
            recursion(root, 1)
        }
        print("\(lastDepth) -> \(dic[3])")
        for d in 0...lastDepth { 
            if let arr = dic[d] { 
                ans.append(arr)
            }
        }
        return ans
    }
    
    func recursion(_ t: TreeNode, _ depth: Int) { 
        lastDepth = max(depth, lastDepth)
        
        if let left = t.left { 
            var arr = (dic[depth] ?? [])
            arr.append(left.val)
            dic[depth] = arr
            recursion(left, depth+1)
        }
        
        if let right = t.right { 
            var arr = (dic[depth] ?? [])
            arr.append(right.val)
            dic[depth] = arr
            recursion(right, depth+1)
        }
    }
}
