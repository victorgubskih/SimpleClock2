import Foundation
import UIKit

class FileRepository: Repository {
    func save(preview: ClockViewFactory.Preview) {
        save(preview, toFileName: "preview.json")
    }
    
    func save(color: UIColor) {
        save(color, toFileName: "color.json")
    }

    func save(timeZone: TimeZone) {
        save(timeZone, toFileName: "timeZone.json")
    }
    
    func preview() -> ClockViewFactory.Preview? {
        return read(fromFileName: "preview.json")
    }
    
    func color() -> UIColor? {
        return read(fromFileName: "color.json")
    }
    
    func timeZone() -> TimeZone? {
        return read(fromFileName: "timeZone.json")
    }

    private func save(_ value: Encodable, toFileName fileName: String) {
        guard let data = try? JSONEncoder().encode(value) else {
            return
        }
        let fileManager = FileManager.default
        guard let fileURL = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(fileName) else {
            return
        }
        try? data.write(to: fileURL)
    }

    private func read<T: Decodable>(fromFileName fileName: String) -> T? {
        let fileManager = FileManager.default
        guard let fileURL = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(fileName) else {
            return nil
        }
        guard let data = try? Data(contentsOf: fileURL) else {
            return nil
        }

        let value = try? JSONDecoder().decode(T.self, from: data)
        return value
    }
}
