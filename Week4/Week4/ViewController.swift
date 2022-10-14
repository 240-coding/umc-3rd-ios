//
//  ViewController.swift
//  Week4
//
//  Created by 이서영 on 2022/10/15.
//

import UIKit

struct MemoDataModel {
    var title: String
    var date: String
    var content: String
}

class ViewController: UIViewController {
    
    let memoData: [MemoDataModel] = [
        MemoDataModel(title: "메모입니다", date: "2022/10/15", content: "안녕하세요~~"),
        MemoDataModel(title: "오늘 할 일", date: "2022/10/12", content: "UMC 세미나 듣기, iOS 공부하기, 시험 공부"),
        MemoDataModel(title: "아이유 - 마음", date: "2022/09/17", content: "나를 알아주지 않으셔도 돼요 찾아오지 않으셔도 다만 꺼지지 않는 작은 불빛이 여기 반짝 살아있어요 영영 살아있어요"),
        MemoDataModel(title: "세븐틴 - Darl+ing", date: "2022/05/27", content: "You know without you I'm so lonely When you're not here 911 calling"),
        MemoDataModel(title: "Harry Styles - As It Was", date: "2022/03/31", content: "In this world, It's just us, You know it's not the same as it was"),
        MemoDataModel(title: "Conan Gray - Wish You Were Sober", date: "2020/03/20", content: "Nineteen but you act twenty-five now Knees weak but you talk pretty fly wow"),
        MemoDataModel(title: "내일 먹을 거!!", date: "2020/02/01", content: "연어덮밥 떡볶이"),
    ]
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "메모"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: nil)
        
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
        
        if #available(iOS 15.0, *) {
            tableView.tableHeaderView = UIView()
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell") as? MemoTableViewCell else {
            return UITableViewCell()
        }
        
        let data = memoData[indexPath.row]
        
        cell.titleLabel.text = data.title
        cell.dateLabel.text = data.date
        cell.contentLabel.text = data.content
        
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.width)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
