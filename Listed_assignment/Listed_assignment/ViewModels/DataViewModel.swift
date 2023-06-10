//
//  DataViewModel.swift
//  Listed_assignment
//
//  Created by Aman Kumar on 10/06/23.
//

import Foundation

public enum SelectedSection: String {
    case recent = "Recent Links"
    case top = "Top Links"
}

class DataViewModel: ObservableObject {
    @Published var data: APIResponse? = nil
    @Published var selectedSection: SelectedSection = .top
    
    var links: [Link] {
        if selectedSection == .top {
            return data?.data.topLinks ?? [Link]()
        } else {
            return data?.data.recentLinks ?? [Link]()
        }
    }
    
    let urlString = "https://api.inopenapp.com/api/v1/dashboardNew"
    let apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
    
    
    func fetchData() {
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    if let data = data {
                        print("Data received:")
                        let decoder = JSONDecoder()
                        do {
                            let apiResponse = try decoder.decode(APIResponse.self, from: data)
                            DispatchQueue.main.async {
                                self.data = apiResponse
                            }
                            
                        } catch(let error) {
                            print("Error decoding JSON: \(error)")
                        }
                        
                    }
                } else {
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                }
            }
        }
        
        task.resume()
    }
    
    func updateSection() {
        if selectedSection == .top {
            selectedSection = .recent
        } else {
            selectedSection = .top
        }
    }
    
    func isTop() -> Bool {
        return selectedSection == .top
    }
    
    func isRecent() -> Bool {
        return selectedSection == .recent
    }
    
    func convertStringToDate() -> [ChartData]{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var convertedData: [ChartData] = [ChartData]()
        if let urlchart = data?.data.overallURLChart{
            for (key, value) in urlchart {
                if let date = dateFormatter.date(from: key) {
                    let data = ChartData(date: date, value: Double(value))
                    convertedData.append(data)
                }
            }
        }
        return convertedData.sorted { $0.date < $1.date }
    }
    
}

struct ChartData {
    var date : Date
    var value : Double
}
