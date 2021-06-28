// 나의 풀이 

import Foundation

var answer = 0
func solution(_ n:Int, _ a:Int, _ b:Int) -> Int  {
    if a <= n/2 && b <= n/2 && n != 2 {
        solution(n/2, a, b)
    } else if a > n/2 && b > n/2 && n != 2 {
        let _a = a%(n/2) == 0 ? n/2 : a%(n/2)
        let _b = b%(n/2) == 0 ? n/2 : b%(n/2)
        solution(n/2, _a, _b)
    } else {
        answer = Int(log2(Double(n)))
    }
    return answer
}


// 다른사람 풀이 
import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    var nextA = a
    var nextB = b

    repeat {
        nextA = (nextA + 1) / 2
        nextB = (nextB + 1) / 2
        answer += 1
    } while nextA != nextB

    return answer
}
