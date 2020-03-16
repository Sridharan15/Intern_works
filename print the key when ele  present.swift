let productGroups = ["1000": "/1/2/3/4/5",
                     "1002": "1/2/4" ,
                     "1004": "/5/2/4/"]
let productDetails = [["id": 0, "Name": "Boost", "Parent": 1],
                      ["id": 1, "Name": "Horlicks", "Parent": 0],
                      ["id": 2, "Name": "Complan", "Parent": 1],
                      ["id": 3, "Name": "Bournvita", "Parent": 2],
                      ["id": 4, "Name": "Moltovo", "Parent": 3]]                     
let input = 1
for (key,values) in productGroups{
    let productValues = values.split(separator : "/")
    for each in productValues{
        if each == "\(input)"{
            print(key)
        }
    } 
}
