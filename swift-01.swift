/* opt logging */
import Foundation;

struct OptObject {
    var uuid: String;
    var value: Any;
}

class OptLog {
    var opt: Array<OptObject> = [];

    init() {
        for i in 1...5 {
            self.opt.insert(OptObject(uuid: "uuid-0\(i)", value: false), at: i - 1);
        }
    }

    func find(uuid: String) -> OptObject {
        if let object = self.opt.first(where: { $0.uuid == uuid }) {
            return object;
        }

        return OptObject(uuid: "", value: "");
    }

    func remove(uuid: String) -> Bool {
        if let index = self.opt.firstIndex(where: { $0.uuid == uuid }) {
            self.opt.remove(at: index);
            return true;
        }

        return false;
    }

    func add(object: OptObject) -> Bool {
        self.opt.insert(object, at: self.opt.count);
        return true;
    }

    func modify(uuid: String, value: Any) -> Bool {
        if let index = self.opt.firstIndex(where: { $0.uuid == uuid }) {
            self.opt[index] = OptObject(uuid: self.opt[index].uuid, value: value);
            return true;
        }

        return false;
    }
}


let optlogging = OptLog();

print(optlogging.opt);

print(optlogging.add(object: OptObject(uuid: "uuid-06", value: true)));
print(optlogging.modify(uuid: "uuid-06", value: "end"));
print(optlogging.find(uuid: "uuid-06"));
print(optlogging.remove(uuid: "uuid-06"));
print(optlogging.find(uuid: "uuid-06"));