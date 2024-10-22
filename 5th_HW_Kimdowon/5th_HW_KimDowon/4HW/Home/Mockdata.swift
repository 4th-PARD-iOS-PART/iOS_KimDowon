import UIKit




struct MockDataItem {
    let title: String
    let name: String  // 이미지 파일 이름
}

struct MockData {
    static let modeling: [[MockDataItem]] = [
        [
            MockDataItem(title: "", name: "30days"),
            MockDataItem(title: "", name: "monster"),
            MockDataItem(title: "", name: "gumsa"),
            MockDataItem(title: "", name: "okja")
        ],
        [
            MockDataItem(title: "", name: "busan"),
            MockDataItem(title: "", name: "don"),
            MockDataItem(title: "", name: "newworld"),
            MockDataItem(title: "", name: "exit")
        ],
        
        // 나머지 섹션도 추가 가능
    ]
}
