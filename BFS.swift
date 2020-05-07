func breadthFirstSearch(graph: [Int: [Int]], source: Int) {
    var source = source
    var visited = Array(repeating: false,count: graph.count)
    var traversal = [Int]()
    traversal.append(source)
    visited[source] = true
    while traversal.count > 0 {
        source = traversal.remove(at: 0)
        print(source,terminator: " ")
        for each in graph[source]! {
            if visited[each] == false {
                traversal.append(each)
                visited[each] = true
            }
        }
    }
}
var graph = [Int: [Int]]()
graph[0] = [1,2]
graph[1] = [2]
graph[2] = [0,3]
graph[3] = [3,3]
let sourceVertex = 2
print ("Following is Breadth First Traversal (starting from vertex 2)")
breadthFirstSearch(graph: graph,source: sourceVertex) 