import Foundation

class PokemonAPIService {
    static let shared = PokemonAPIService()
    private let baseURL = "https://pokeapi.co/api/v2"
    private let session = URLSession.shared
    
    func fetchPokemonList(limit: Int = 20, offset: Int = 0, completion: @escaping (Result<[NamedAPIResource], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/pokemon?limit=\(limit)&offset=\(offset)") else {
            completion(.failure(NSError(domain: "URL inválida", code: -1)))
            return
        }
        
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data else {
                completion(.failure(NSError(domain: "Sem dados", code: -1)))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchPokemonDetails(for name: String, retries: Int = 3, completion: @escaping (Result<Pokemon, Error>) -> Void) {
        guard let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let url = URL(string: "\(baseURL)/pokemon/\(encodedName)") else {
            completion(.failure(NSError(domain: "URL inválida", code: -1)))
            return
        }
        
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                if retries > 0 {
                    print("Erro: \(error.localizedDescription). Tentando novamente... (\(retries) restantes)")
                    self.fetchPokemonDetails(for: name, retries: retries - 1, completion: completion)
                } else {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Sem dados", code: -1)))
                return
            }
            
            do {
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(.success(pokemon))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }


}
