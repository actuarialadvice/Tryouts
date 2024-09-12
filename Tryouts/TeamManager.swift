import RealmSwift

class TeamManager {
    static let shared = TeamManager()
    private init() {}

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
        
        // Create an array to hold predicates
        var predicates: [NSPredicate] = []
        
        // Add predicates based on non-nil parameters
        if let sport = sport {
            predicates.append(NSPredicate(format: "sport == %@", sport))
        }
        if let grade = grade {
            predicates.append(NSPredicate(format: "grade == %@", grade))
        }
        if let gender = gender {
            predicates.append(NSPredicate(format: "gender == %@", gender))
        }
        if let level = level {
            predicates.append(NSPredicate(format: "level == %@", level))
        }
        if let location = location {
            predicates.append(NSPredicate(format: "location == %@", location))
        }
        
        // Combine all predicates using AND
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        
        // Fetch and return the results
        return realm.objects(Team.self).filter(compoundPredicate)
    }
}
