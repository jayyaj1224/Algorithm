/*
A phrase is a **palindrome** if, after converting all uppercase letters into lowercase letters 
and removing all non-alphanumeric characters, it reads the same forward and backward. 
Alphanumeric characters include letters and numbers.
Given a string `s`, return `true` *if it is a **palindrome**, or* `false` *otherwise*.
*/


// ## Solution 1

// Runtime: 26 ms, faster than 46.29% of Swift online submissions for Valid Palindrome.
// Memory Usage: 18.9 MB, less than 5.59% of Swift online submissions for Valid Palindrome.

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var dic = [Int:String]()
        var mIndex = 0, nIndex = 0
        let _s = Array(s)
        let endIndex = _s.endIndex
        
        for i in 0..<endIndex {
            guard mIndex < endIndex-i else { break }
            
            let m = _s[i].lowercased(), n = _s[endIndex-1-i].lowercased()

            if returnFalse(m, mIndex, {mIndex+=1}) 
            || returnFalse(n, nIndex, {nIndex+=1}) {
                return false
            }
        }
        
        func returnFalse(_ c: String, _ index: Int, _ indexCount: ()->Void) -> Bool {
            if c.first!.isLetter || c.first!.isNumber {
                if let _n = dic[index], c != _n  {
                    return true
                } else {
                    dic[index] = c
                    indexCount()
                }
            }
            return false
        }
        
        return true
    }
}

// ## Solution 2

// Runtime: 8 ms, faster than 98.18% of Swift online submissions for Valid Palindrome.
// Memory Usage: 16.6 MB, less than 23.03% of Swift online submissions for Valid Palindrome.
func isPalindrome(_ s: String) -> Bool {
        var arr = [Character]()
        var count = 0
        
        for c in s { 
            if c.isLetter || c.isNumber { 
                arr.append(c)
                count+=1
            }
        }
        guard count >= 2 else { return true }
        
        for i in 0...count/2-1 { 
            if arr[i].lowercased() != arr[count-1-i].lowercased() { 
                return false
            }
        }
        return true
   }
