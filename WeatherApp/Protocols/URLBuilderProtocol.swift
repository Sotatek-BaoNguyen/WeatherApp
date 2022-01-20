import Foundation

protocol URLBuilderProtocol {
    var baseURLString: String { get set }
    init(baseURL: String)
    func build(for endpoint: Endpoint, with query: String) -> URL?
}
