var a = [[1,2,3],
         [5,6,7],
         [9, 10,11]]
// [1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5, 6, 7, 11, 10]
var i = 0, j = 0
var row = a.count, column = a[0].count
var result = a[0]
while(i < row && j < column) {
    if(i > 0) {
        for each in j..<column {
            result.append(a[i][each])
        }
    }
    i += 1
    for each in i..<row {
        result.append(a[each][column - 1])
    }
    column -= 1
    if (i < row) {
        for each in stride(from: column - 1, to: j - 1, by: -1) {
            result.append(a[row - 1][each])
        }
        row -= 1
    }
    if (j < column) {
        for each in stride(from: row - 1, to: i - 1, by: -1) {
            result.append(a[each][j])
        }
        j += 1
    }
}
print(result)
