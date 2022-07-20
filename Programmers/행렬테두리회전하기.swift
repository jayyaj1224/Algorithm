import Foundation

// 전제 arr -> arr 리턴하는 회전시켜주는 함수
// 거기서 미니멈 찾는 함수

//qr  [2, 2, 5, 4]   , [3, 3, 6, 6], [5, 1, 6, 3]

var ans = [Int]()
var qrs = [[Int]]()

func rotation(_ arr: [[Int]] ) {
    var rotated = arr
    var min = 10000
    let q = (x1: qrs.first![0]-1, y1: qrs.first![1]-1, x2: qrs.first![2]-1, y2: qrs.first![3]-1)
    //상      2         4
    for y in q.y1...q.y2-1 {
        rotated[q.x1][y+1] = arr[q.x1][y]
        if rotated[q.x1][y+1] < min {
            min = rotated[q.x1][y+1]
        }
    }
    //하
    for y in q.y1+1...q.y2 {
        rotated[q.x2][y-1] = arr[q.x2][y]
        if rotated[q.x2][y-1]  < min {
            min = rotated[q.x2][y-1]
        }
    }
    //좌
    for x in q.x1+1...q.x2 {
        rotated[x-1][q.y1] = arr[x][q.y1]
        if rotated[x-1][q.y1]  < min {
            min = rotated[x-1][q.y1]
        }
    }
    //우
    for x in q.x1...q.x2-1 {
        rotated[x+1][q.y2] = arr[x][q.y2]
        if rotated[x+1][q.y2]  < min {
            min = rotated[x+1][q.y2]
        }
    }
    ans.append(min)
    qrs.removeFirst()
    if !qrs.isEmpty {
        rotation(rotated)
    }
}

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    let initialArr = Array(0...rows-1)
        .map { num -> [Int] in Array(1...columns).map{ $0 + columns*num } }
    qrs = queries
    rotation(initialArr)
    return ans
}

solution(6, 6, [[2,2,5,4],[3,3,6,6],[5,1,6,3]])
