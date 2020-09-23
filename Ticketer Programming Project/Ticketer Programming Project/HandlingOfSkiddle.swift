import Foundation
import Alamofire
import SwiftyJSON

class HandlingOfSkiddle {
    let baseUrl = "https://www.skiddle.com/api/v1/events/search/?"
    let apiKey = "api_key=52f07458a25911d3e1b89ab9f7f0c448"
    let decoder = JSONDecoder()
    let search: String
    
    init(search: String) {
        self.search = search
    }
    
    func createUrl(term: String?) -> String? {
        guard let searchTerm = term else {
            print("No search term provided terminating request")
            return nil}
        
        let path = "&keyword=\(searchTerm)&order=date&description=1".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = baseUrl + apiKey + path
        print(url)
        return url
        
    }
    
    func getJson(urlString: String) {
        guard let url = URL(string: urlString) else {
                print("Invalid URL")
                return
        }
        let request = URLRequest(url: url)
        //parseJson(json: String(request))
        //URLSession.shared.dataTask(with: request) { (data,response, error) in
        //    self.parseJson(json: String(data)!)
        //}.resume()
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
