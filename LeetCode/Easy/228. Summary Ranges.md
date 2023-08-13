<img width="836" alt="Screenshot 2023-07-19 at 22 45 44" src="https://github.com/jayyaj1224/Algorithm/assets/73763976/42c71bfe-9f72-4c1a-a721-cb8866a1b657">
<img width="851" alt="Screenshot 2023-07-19 at 22 45 35" src="https://github.com/jayyaj1224/Algorithm/assets/73763976/aed07617-0469-4b6c-aa0c-ca445348865c">

```swift
class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        let count = nums.count
        var lhs = 0, rhs = 1
        var res = [String]()
        guard count != 1 else { return ["\(nums[0])"]}
        
        while rhs < count { 
            if nums[rhs] - nums[lhs] == rhs - lhs { 
                if rhs == count - 1 { 
                    res.append("\(nums[lhs])->\(nums[rhs])")
                }
                rhs += 1
            } else { 
                if rhs - lhs == 1 { 
                    res.append("\(nums[lhs])")
                    if rhs == count - 1 { 
                        res.append("\(nums[rhs])")
                    } 
                    lhs += 1
                    rhs += 1
                } else { 
                    res.append("\(nums[lhs])->\(nums[rhs-1])")
                    lhs = rhs
                    rhs += 1
                    if lhs == count - 1 { 
                        res.append("\(nums[lhs])")
                    }
                }
            }
        }
        return res
    }
}
```
