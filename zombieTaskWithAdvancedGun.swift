let guns = 1
var advancedGun = 0 
var bullets = 6
let zombieKillDistance = 5
let advancedGunUsagePower = 30
var kills = 0
var totalKills = 0
var each = 0
var distanceAndPowerOfZombies: [[Int]] = [[20,1],[25,2],[30,3],[35,4],[40,5],[45,6],[50,7],[55,8],[60,9],[65,10],[70,40]].sorted {$0[0] < $1[0]}
while(each >= 0) {
    if distanceAndPowerOfZombies[each][0] == 0 || bullets <= 0 {
        print("Game Over!! Killed:",totalKills,"Remaining Bullets:",bullets,advancedGun)
        break
    }
    if distanceAndPowerOfZombies[each][0] < zombieKillDistance && distanceAndPowerOfZombies[each][1] < advancedGunUsagePower {
        totalKills += 1
        kills += 1
        bullets -= 1
        distanceAndPowerOfZombies.remove(at: each)
        if kills == 2 {
            bullets += 1
            kills = 0
        }
        if totalKills == 10 {
            advancedGun += 1
        }
        print(advancedGun)
        if (distanceAndPowerOfZombies.isEmpty) {
            print("Game Over!! Killed:",totalKills,"Remaining Bullets:",bullets,advancedGun)
            break
        }
        else {
            for zombie in 0..<distanceAndPowerOfZombies.count {
                distanceAndPowerOfZombies[zombie][0] -= 1
            }
           each = 0
        }
    }
    else if distanceAndPowerOfZombies[each][0] < zombieKillDistance && distanceAndPowerOfZombies[each][1] >= advancedGunUsagePower {
        if (advancedGun > 0) {
            totalKills += 1
            kills += 1
            advancedGun -= 1
        }
        else {
            totalKills += 1
            kills += 1
            bullets -= 3
        }
        if kills == 2 {
            bullets += 1
            kills = 0
        }
        if totalKills == 10 {
            advancedGun += 1
        }
        distanceAndPowerOfZombies.remove(at: each)
        if (distanceAndPowerOfZombies.isEmpty) {
            print("Game Over!! Killed:",totalKills,"Remaining Bullets:",bullets,advancedGun)
            break
        }
        else {
            for zombie in 0..<distanceAndPowerOfZombies.count {
                distanceAndPowerOfZombies[zombie][0] -= 1
            }
            if kills == 2 {
                bullets += 1
                kills = 0
            }
            if totalKills == 10 {
                advancedGun += 1
            }
            each = 0
        }
    }
    else {
        for zombie in 0..<distanceAndPowerOfZombies.count {
            distanceAndPowerOfZombies[zombie][0] -= 1
        }
        each = 0
    }
}
print(distanceAndPowerOfZombies)