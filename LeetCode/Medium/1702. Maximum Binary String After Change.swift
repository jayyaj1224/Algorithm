/*
You are given a binary string binary consisting of only 0's or 1's. You can apply each of the following operations any number of times:

Operation 1: If the number contains the substring "00", you can replace it with "10".
For example, "00010" -> "10010"
Operation 2: If the number contains the substring "10", you can replace it with "01".
For example, "00010" -> "00001"
Return the maximum binary string you can obtain after any number of operations. Binary string x is greater than binary string y if x's decimal representation is greater than y's decimal representation.

 

Example 1:

Input: binary = "000110"
Output: "111011"
Explanation: A valid transformation sequence can be:
"000110" -> "000101" 
"000101" -> "100101" 
"100101" -> "110101" 
"110101" -> "110011" 
"110011" -> "111011"
*/

class Solution {
    func maximumBinaryString(_ binary: String) -> String {
        var binary = Array(binary) 
        let c = binary.count
        
        var zeroStartPoint = -1
        var zeroCount = 0
        
        for i in 0..<c where binary[i]=="0" { 
            zeroCount+=1
            if zeroStartPoint == -1 { 
                zeroStartPoint = i
            }
        }
        if zeroCount <= 1 {
            return String(binary)
        } else {
            var ans = ""
            ans+=String(repeating: "1", count: zeroStartPoint+zeroCount-1)
            ans+="0"
            ans+=String(repeating: "1", count: c-zeroCount-zeroStartPoint)
            return ans
        }
    }
}

