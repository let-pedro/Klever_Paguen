
import Foundation


struct ModalEditorSergice {
    
    
    private let urlApi: String = "https://625732594428bb6c08201927.mockapi.io/api/v1/createBoleto"
    
    func put(parametros: [String: Any], completion: @escaping (Error?) -> ()) {
        let updateURL = URL(string: "\(urlApi)\(String(describing: parametros["id"]!))/")
        
        guard  updateURL != nil else {
            print ("not found url")
            return
        }

        
        guard let body = try? JSONSerialization.data(withJSONObject: parametros, options: []) else { return }
        
        var urlRequest = URLRequest(url: updateURL!)
        urlRequest.httpMethod = "PUT"
        urlRequest.httpBody = body
        urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
        
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            
            guard error != nil else {
                completion(nil)
                return }
            
            completion(error)
            
        }.resume()
    } 
}
