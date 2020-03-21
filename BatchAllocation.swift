import Foundation
var orderedValues =  102
let cases = 50, outers = 5, pieces = 1
var batches = [["name": "batchJan", "avail": 50, "cased": 0, "outer": 0, "piece": 0],
               ["name": "batchFeb", "avail": 25, "cased": 0, "outer": 0, "piece": 0],
               ["name": "batchMar", "avail": 125, "cased": 0, "outer": 0, "piece": 0]]
var totalAvail = 0
for each in 0..<batches.count {
    totalAvail += (batches[each]["avail"] as! Int)
}
if orderedValues > totalAvail {
    print("Out Of Stock")
}
else {
    for each in 0..<batches.count {
        while(batches[each]["avail"] as! Int > 0 && orderedValues != 0) {
            if batches[each]["avail"] as! Int >= cases, orderedValues >= cases{
                batches[each]["cased"] = batches[each]["cased"] as! Int + 1
                orderedValues = orderedValues - cases
                batches[each]["avail"] = batches[each]["avail"] as! Int -  cases
            } else if batches[each]["avail"] as! Int >= outers, orderedValues >= outers {
                batches[each]["outer"] = batches[each]["outer"] as! Int + 1
                orderedValues = orderedValues -  outers
                batches[each]["avail"] = batches[each]["avail"] as! Int - outers
            } else {
                batches[each]["piece"] = batches[each]["piece"] as! Int +  1
                orderedValues = orderedValues -  pieces
                batches[each]["avail"] = batches[each]["avail"] as! Int - pieces
            }
        }
    }
}

print(batches)
