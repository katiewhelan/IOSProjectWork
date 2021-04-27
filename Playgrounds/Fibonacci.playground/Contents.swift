import UIKit
import Foundation

func fibonacci(n: Int) {

    //Write your code here.
    var printArray = [Int]()
   


    for k in 0...n {
        if k == 0 {
            printArray.append(k)
        } else if k == 1{
            let q = printArray[k-1] + k
            printArray.append(q)
        } else {
            let m = printArray[k-1] + printArray[k-2]
            printArray.append(m)
        }
    }
    print(printArray)



    }
fibonacci(n: 10)
    

