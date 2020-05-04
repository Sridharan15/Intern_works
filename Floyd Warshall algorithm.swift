public let vertices = 4
public let INF = 99999
func floydWarshall(graph: [[Int]]) {
    var distanceBetweenVertices = Array(repeating: Array(repeating: 0,count: vertices), count: vertices)
    for eachRow in 0..<vertices {
        for eachColumn in 0..<vertices {
            distanceBetweenVertices[eachRow][eachColumn] = graph[eachRow][eachColumn]
        }
    }
    for freezingRowAndColumn in 0..<vertices {
        for eachRow in 0..<vertices {
            for eachColumn in 0..<vertices {
                distanceBetweenVertices[eachRow][eachColumn] = min(distanceBetweenVertices[eachRow][eachColumn], (distanceBetweenVertices[eachRow][freezingRowAndColumn] + distanceBetweenVertices[freezingRowAndColumn][eachColumn])) 
            }
        }
    }
    printTheShortestDistances(distance: distanceBetweenVertices)
}
func printTheShortestDistances(distance: [[Int]]) {
    print("Following matrix shows the shortest paths between every pair of vertices")
    for eachRow in 0..<vertices {
        for eachColumn in 0..<vertices {
            if distance[eachRow][eachColumn] == INF {
                print("INF",terminator: " ")
            }
            else {
                print(distance[eachRow][eachColumn],terminator: "   ")
            }
        }
        print(" ")
    }
}
let graph = [[0, 3, INF, 5],
         [2, 0, INF, 4],
         [INF, 1, 0, INF],
         [INF, INF, 2, 0]]
floydWarshall(graph : graph)
