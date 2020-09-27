import Foundation
import Alamofire
import SwiftyJSON

class HandlingOfSkiddle {
    let baseUrl = "https://www.skiddle.com/api/v1/events/search/?"
    let apiKey = "api_key=52f07458a25911d3e1b89ab9f7f0c448"
    let decoder = JSONDecoder()
    var jsonString = ""

    
    func createUrl(term: String?) -> String? {
        guard let searchTerm = term else {
            print("No search term provided")
            return nil}
        
        let path = "&keyword=\(searchTerm)&order=date&description=1".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = baseUrl + apiKey + path
        return url
    }
    
    func createJsonString(urlEntry: String) {
        if let url = URL(string: urlEntry) {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                 if let jsonString = String(data: data, encoding: .utf8) {
                    print("")
                    print(jsonString)
                    self.jsonString = jsonString
                 } else {
                    print("Error creating json string")
                 }
               }
           }.resume()
        } else {
            print("Error creating url")
        }
    }
    
    func parsingJson(json: Data) -> SkiddleEventResponse? {
        if let eventResponse = try? decoder.decode(SkiddleEventResponse.self, from: json) {
            return eventResponse
        } else {
            print("Failed to decode to Event Response")
            return nil
        }
    }
    
        
    func parseJson(json: String) {
        guard let jsonString = try? String(contentsOf: URL(fileURLWithPath: json), encoding: String.Encoding.utf8) else {
            print("Error at url decoding")
            return
        }
        
        print(jsonString)
    }
    
    func searchByName() -> [Event]? {
        return nil
    }
}
