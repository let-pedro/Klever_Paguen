
import Foundation


struct RegistrarService {
    
    private let urlApi: String = "https://625732594428bb6c08201927.mockapi.io/api/v1/createBoleto"
    
    func post(_ parametros: [String: Any], completion: @escaping(Error?) -> Void) {
        
        guard let url = URL(string: "\(urlApi)") else {
            print ("Not found url")
            return
        }
        
        guard let body = try? JSONSerialization.data(withJSONObject: parametros, options: []) else { return }
                
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "POST"
        requisicao.setValue("application/json", forHTTPHeaderField: "Content-Type")
        requisicao.httpBody = body
        
        URLSession.shared.dataTask(with: requisicao) { data, resposta, error in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                completion(error)
                return
            }
            completion(nil)
            
        }.resume()
    }
}



