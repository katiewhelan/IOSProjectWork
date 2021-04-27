import Foundation

var width : Float = 1.5
var height : Float = 2.3
// 1 bucket of paint 1.5sqm

var bucketOfPaint: Int {
    get {
        let area = width * height
        let totalBuckets = area/1.5
        return Int(ceilf(totalBuckets))
    }
    set {
        let area = Double(newValue) * 1.5
        print("Can cover an area of \(area)")
    }
}

print("\(bucketOfPaint) buckets needed")






bucketOfPaint = 8
