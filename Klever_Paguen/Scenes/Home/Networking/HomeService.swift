
import Foundation

struct HomeService {
    
    private let urlApi: String = "https://625732594428bb6c08201927.mockapi.io/api/v1/createBoleto"
    
    func get (completion: @escaping (Result<[Boleto],Error>) -> Void){

            guard let url = URL(string: "\(urlApi)") else {
                print ("Not found url")
                return
            }

            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error", error?.localizedDescription ?? "")
                    return
                }

                guard let data = data else { return }
                do {
                    let ArrayBoletos = try JSONDecoder().decode([Boleto].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(ArrayBoletos))
                    }
                }catch  {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }.resume()
    }
    
    func delete(id: String, completion: @escaping (Error?) -> ()){
        guard let url = URL(string: "\(urlApi)/\(id)") else {
            print ("Not found url")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        
       
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                completion(error)
                return
            }                
            completion(nil)
        }.resume()
    }
}
