var paragraph = """
And since Swift strings have full support for Unicode, thi
""" .lowercased()
var dict = [String: Int]()
for each in paragraph{
    if each.isLetter{ 
     dict["\(each)", default: 0] += 1
}
}
print(dict)

