import RealmSwift

class Team: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var sport = ""
    @objc dynamic var grade = ""
    @objc dynamic var gender = ""
    @objc dynamic var level = ""
    @objc dynamic var location = ""
    @objc dynamic var contactEmail: String? = nil
    @objc dynamic var contactPhone: String? = nil
    @objc dynamic var postDate = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
