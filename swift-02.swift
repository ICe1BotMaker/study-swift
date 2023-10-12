/*  */
import Foundation;

struct Person {
    let uuid: String;
    var name: String;
    var age: Int;
    var address: String;
}

protocol PersonProtocol {
    init(person: Person);
    func modify(person: Person);
    func introduce();
}

class CharacterController: PersonProtocol {
    var data: Person;

    required init(person: Person) {
        self.data = person;
    }
}

extension CharacterController {
    func modify(person: Person) {
        self.data = person;
    }

    func introduce() {
        print("[\(self.data.uuid)]\n\(self.data.address)에 거주중인 \(self.data.age)세 \(self.data.name)이라고 합니다.");
    }
}

var ice1github: Person = Person(uuid: "ice1github-783y4tg", name: "", age: 0, address: "");
let control: CharacterController = CharacterController(person: ice1github);

ice1github.name = "ice1";
ice1github.age = 18;
ice1github.address = "경기도";
control.modify(person: ice1github);
control.introduce();