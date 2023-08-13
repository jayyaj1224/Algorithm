<img width="796" alt="Screenshot 2023-08-13 at 23 37 33" src="https://github.com/jayyaj1224/Algorithm/assets/73763976/67fccb8a-5868-4382-afd3-adb54f46995f">

```swift
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        return TreeNode(root.val, invertTree(root.right), invertTree(root.left))
    }
}
```
