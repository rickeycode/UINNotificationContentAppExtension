import UIKit

var str = "Hello, playground"

protocol CellModel {
    func configure()
}

protocol FollowFeedCellModelFactory {
    func createCellModel(_ input: FollowFeedCellModel.Input) -> CellModel?
}

extension FollowFeedCellModelFactory {
    func createCellModel(_ input: FollowFeedCellModel.Input) -> CellModel? {
        return FollowFeedCellModel(input)
    }
}

struct HogeModel: FollowFeedCellModelFactory {
    let text: String
    let int: Int
}

class FollowFeedCellModel: CellModel {
    
    typealias Input = (text: String, int: Int)
    
    let text: String
    let int: Int
    
    init(_ input: Input) {
        text = input.text
        int = input.int
    }
    
    func configure() {
    }
}

class FollowFeedAdCellModel: CellModel {
    
    typealias Input = (data: HogeModel, selector: () -> ())
    
    let text: String
    let int: Int
    
    init(_ input: Input) {
        text = input.data.text
        int = input.data.int
    }
    
    func configure() {
    }
}

let list: [FollowFeedCellModelFactory] = []

list.forEach {
    let input: FollowFeedCellModel.Input = (text: "", input: 9)
    $0.createCellModel()
}
