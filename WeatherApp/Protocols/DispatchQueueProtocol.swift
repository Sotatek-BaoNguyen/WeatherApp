import Foundation

protocol DispatchQueueProtocol {
    func async(execute work: @escaping @convention(block) () -> Void)
}
