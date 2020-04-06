let guns = 1
var bullets = 5
let zombieKillDistance = 5
var kills = 0
var totalKills = 0
var each = 0
 var distanceOfZombies: [Int] = [2,3,3,3,4,5,6,7,8,9,10]
while(each >= 0){
    if distanceOfZombies[each] == 0 {
        print("Game Over!! Killed:",totalKills)
        break
    }
    if distanceOfZombies[each] < zombieKillDistance {
        totalKills += 1
        kills += 1
        distanceOfZombies.remove(at: each)
        if (distanceOfZombies.isEmpty) {
            print("Game Over!! Killed:",totalKills)
            break
        }
        else {
            for zombie in 0..<distanceOfZombies.count {
                distanceOfZombies[zombie] -= 1
            }
            if kills == 2 {
                bullets += 1
                kills = 0
            }
            else {
                bullets -= 1
            }
            each = 0
        }
    }
}
print(distanceOfZombies)
