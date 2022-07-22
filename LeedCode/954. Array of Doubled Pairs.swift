Given an integer array of even length `arr`, return `true` *if it is possible to reorder* `arr` *such that* `arr[2 * i + 1] = 2 * arr[2 * i]` *for every* `0 <= i < len(arr) / 2`*, or* `false` *otherwise*.

### Mine 1st (4256 ms)

```swift
class Solution {
    func canReorderDoubled(_ arr: [Int]) -> Bool {
        var ans = false
        var dic = [Int:[Int]]()
        
        for n in arr.sorted() {
            let k = key(n)
            var arr = dic[k] ?? []
            arr.append(n)
            dic[k] = arr
        }
        
        for k in dic.keys {
            var array = dic[k]!.map { abs($0) }.sorted()
            if array.count%2 != 0 { return false }
            
            while !array.isEmpty {
                let num = array[0]
                if let index = array.firstIndex(where: { $0 ==  num*2 }) {
                    array.remove(at: index)
                    array.removeFirst()
                } else {
                    return false
                }
            }
        }
        return true
    }
    
    func key(_ num: Int) -> Int {
        if (num*num != 1) && (num != 0) && (num%2 == 0) {
            return  key(num/2)
        } else {
            return num
        }
    }
}
```

### Mine 2nd (1600 ms)

```swift
func canReorderDoubled(_ arr: [Int]) -> Bool {
        var array = arr.sorted { abs($0) < abs($1) }
        
        while !array.isEmpty {
            let num = array[0]
            if let index = array[1..<array.endIndex].firstIndex(where: { $0 ==  num*2 }) {
                array.remove(at: index)
                array.removeFirst()
            } else {
                return false
            }
        }
        return true
    }
```

### Mine 3rd (500 ms)

```swift
class Solution {
    func canReorderDoubled(_ arr: [Int]) -> Bool {
        var dic = [Int:Int]()
        
        for n in arr.sorted { abs($0) < abs($1) } { 
            if dic[n, default: 0] > 0 { 
                dic[n]!-=1
                continue
            }
            dic[2*n, default: 0]+=1
        }
        
        return dic.values.reduce(0,+) == 0
    }
}
```

```swift
Difference between both beneath

						if let val = dic[n] {
               dic[n] = val-1
            } else { 
                dic[2*n, default: 0]+=1
            } 

            if dic[n, default: 0] > 0 { 
                dic[n]!-=1
                continue
            }
            dic[2*n, default: 0]+=1
```

---

### Simple Greedy(600 ms)

```swift
func canReorderDoubled(_ arr: [Int]) -> Bool {
        var counts: [Int:Int] = [:]
        
        for num in arr.sorted {abs($0) < abs($1)} {            
            if counts[num, default: 0] > 0 {
                counts[num]! -= 1
                continue
            }
            
            counts[num*2, default: 0] += 1
        }
        
        return counts.values.reduce(0, +) == 0
    }
```

func canReorderDoubled(_ arr: [Int]) -> Bool {
var dic = [Int:Int](notion://www.notion.so/London-Dev-97410f8843a44fdb94a8566f9987d6c0?p=32de4cfeabb0437ebca775f3d270a526)
