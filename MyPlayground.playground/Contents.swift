var arr = [1,8,1,6,5,6,8]
var newArr = arr
newArr = newArr.sort { $1 > $0 }
print(newArr)
var n = arr.count
var same = false
var pNum = 0

if n == 1{
    print(arr[0])
}
else{
    for var i in 1..<n {
        
        if i+1 < n {
            

        if newArr[i] != newArr[i-1] && newArr[i] != newArr[i+1] {
                pNum = newArr[i]
            }
            else if newArr[n-1] != newArr[n-2]{
                pNum = newArr[n-1]
            }
        }
        
    }
    print(pNum)
}