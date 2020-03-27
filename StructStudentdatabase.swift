import Foundation
 struct studentDatabase {
     private var name: String
     private var id: Int
     private var email: String
     private var physics: Int
     private var chemistry: Int
     private var maths: Int
    init(name: String,id: Int,email: String,physics: Int,chemistry: Int,maths: Int) {
        self.name = name
        self.id = id
        self.email = email
        self.physics = physics
        self.chemistry = chemistry
        self.maths = maths
    }
    func totalMarksOfAllStudents() -> [String] {
        let marks = [physics,chemistry,maths]
        let failed = marks.filter { $0 <= 45 }
        if failed != [] {
            var failedStudents = [name,"\(id)",email,"fail"]
            return failedStudents
        }
        else {
            var total = marks.reduce(0, +)
            rankList.append(total)
            var passedStudents = [name,"\(id)",email,"pass"]            
            return passedStudents
        }
    }
} 
var rankList = [Int]()   
let studentDetails = ["dharan,1,dharan@gmail.com, {physics:67, chemistry:45, maths:10}",
                      "kishore,2,kishore@gmail.com, {physics:80, chemistry:75, maths:50}",
                      "tony,3, tony@gmail.com, {physics:75, chemistry:55, maths:80}",
                      "ram,4,ram@gmail.,{physics:60, chemistry:78, maths:78}"]                      
for eachstudent in studentDetails {
    let each = eachstudent.replacingOccurrences(of: "}", with: "")
    var nameAndId = each.components(separatedBy: ",")
    var tempPhysics = each.components(separatedBy: "physics:")
    let physics = tempPhysics[1].components(separatedBy: ",")
    let tempChemistry = each.components(separatedBy: "chemistry:")
    let chemistry = tempChemistry[1].components(separatedBy: ",")
    let tempMaths = each.components(separatedBy: "maths:")
    let maths = tempMaths[1].components(separatedBy: ",")
    //checking valid email address
    let email = nameAndId[2]  
    if email.contains("@"), email.contains(".") {
        let nameBeforeAt = email.components(separatedBy: "@")
        let nameBeforeAndAfterDot = nameBeforeAt[1].components(separatedBy: ".")
        if nameBeforeAndAfterDot[0] != "" , nameBeforeAndAfterDot[1] != "" ,nameBeforeAt[0] != "" {
            let eachDetail = studentDatabase(name: nameAndId[0], id: Int(nameAndId[1]) ?? 0,email: nameAndId[2], physics: Int(physics[0]) ?? 0,chemistry: Int(chemistry[0]) ?? 0, maths: Int(maths[0]) ?? 0)
            print(eachDetail.totalMarksOfAllStudents())
        }
    else {
        print("Please enter valid email id for \(nameAndId[0])")
    }
    }   
}
if rankList != [] {
    rankList.sort(by: >)
    for rank in 0..<rankList.count {
        print("Rank \(rank + 1) is \(rankList[rank])")
    }
}

