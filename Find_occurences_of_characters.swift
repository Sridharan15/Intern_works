let paragraph = """
And since Swift strings have full support for Unicode, thi
""" .lowercased()
var dict = [String: Int]()
for each in paragraph {
    if each.isLetter { 
        dict["\(each)", default: 0] += 1
    }
}
let sortedDict = dict.sorted(by: <)  //sort the elements to print an ordered dict
print(sortedDict)
print(paragraph.length)             //print the total string count
print(dict.count)                   //print the unique string count
