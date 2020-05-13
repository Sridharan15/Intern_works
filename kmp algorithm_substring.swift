var substring = "AABA"
var mainstring = "AABAACAADAABAABA"
var count = 0
while mainstring.count != 0 {
    if mainstring.prefix(substring.count) == substring {
        count += 1
    }
    mainstring = "\(mainstring.dropFirst(1))"
}
print(count)