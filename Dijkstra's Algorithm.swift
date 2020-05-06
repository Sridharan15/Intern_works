public let vertices = 6
public let INF = 99999
public let sourceVertex = 0
func findMinimumDistance(distance: [Int],queue: [Bool]) -> Int {
    var minimumDistanceValue = INF
    var minimumVertex: Int = 0
    for each in 0..<vertices {
        if(queue[each] == false && distance[each] <= minimumDistanceValue) {
            minimumDistanceValue = distance[each]
            minimumVertex = each
        }
    }
    return minimumVertex
}
func dijkstra(graph: [[Int]], source: Int) {
    var distanceFromSourceToOtherVertices = Array(repeating: INF,count: vertices)
    var queue = Array(repeating: false,count: vertices)
    var parentVertices = Array(repeating: -1,count: vertices)
    distanceFromSourceToOtherVertices[source] = 0
    for _ in 0..<(vertices - 1) {
        let nearestVertex = findMinimumDistance(distance: distanceFromSourceToOtherVertices,queue: queue)
        queue[nearestVertex] = true
        for each in 0..<vertices {
            if (queue[each] == false) && (graph[nearestVertex][each] != 0) && (distanceFromSourceToOtherVertices[nearestVertex] != INF) && ((distanceFromSourceToOtherVertices[nearestVertex] + graph[nearestVertex][each]) < distanceFromSourceToOtherVertices[each]) {
                    distanceFromSourceToOtherVertices[each] = distanceFromSourceToOtherVertices[nearestVertex] + graph[nearestVertex][each]
                    parentVertices[each] = nearestVertex
            }
        }
    }
    printTheShortestPath(distance: distanceFromSourceToOtherVertices,parent: parentVertices)
}
func printTheShortestPath(distance: [Int],parent: [Int]) {
    print("vertex \t\t Distance\t\tParent")
    for each in 0..<vertices {
        print("\(sourceVertex) -> \(each) \t\t \(distance[each])   \t\t   \(parent[each])")
    }
}
let graph = [[0,4,4,0,0,0], 
             [4,0,2,0,0,0], 
             [4,2,0,3,6,1], 
             [0,0,3,0,2,0], 
             [0,0,6,2,0,3], 
             [0,0,1,0,3,0]]
dijkstra(graph: graph,source: sourceVertex)