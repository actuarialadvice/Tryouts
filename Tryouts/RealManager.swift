import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    private init() {}

    var realm: Realm {
        do {
            let realm = try Realm()
            return realm
        } catch {
            fatalError("Unable to initialize Realm: \(error)")
        }
    }

    func saveTeam(sport: String, grade: String, gender: String, level: String, location: String, email: String?, phone: String?) {
        let team = Team()
        team.sport = sport
        team.grade = grade
        team.gender = gender
        team.level = level
        team.location = location
        team.contactEmail = email
        team.contactPhone = phone

        let realm = RealmManager.shared.realm
        try? realm.write {
            realm.add(team)
        }
    }

    func fetchTeams(sport: String? = nil, grade: String? = nil, gender: String? = nil, level: String? = nil, location: String? = nil) -> Results<Team> {
        let realm = RealmManager.shared.realm
        var predicate = NSPredicate(value: true)
        
        if let sport = sport {
            predicate = NSPredicate(format: "sport == %@", sport)
        }
        if let grade = grade {
            predicate = NSPredicate(format: "grade == %@", grade)
        }
        if let gender = gender {
            predicate = NSPredicate(format: "gender == %@", gender)
        }
        if let level = level {
            predicate = NSPredicate(format: "level == %@", level)
        }
        if let location = location {
            predicate = NSPredicate(format: "location == %@", location)
        }
        
        return realm.objects(Team.self).filter(predicate)
    }
}
