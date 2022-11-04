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
    
    var memoData: [MemoDataModel] = [
        MemoDataModel(title: "메모입니다", date: "2022/10/15", content: "안녕하세요~~"),
        MemoDataModel(title: "오늘 할 일", date: "2022/10/12", content: "UMC 세미나 듣기, iOS 공부하기, 시험 공부"),
        MemoDataModel(title: "아이유 - 마음", date: "2022/09/17", content: "나를 알아주지 않으셔도 돼요 찾아오지 않으셔도 다만 꺼지지 않는 작은 불빛이 여기 반짝 살아있어요 영영 살아있어요"),
        MemoDataModel(title: "세븐틴 - Darl+ing", date: "2022/05/27", content: "You know without you I'm so lonely When you're not here 911 calling"),
        MemoDataModel(title: "오늘의 일기", date: "2022/05/20", content: "오늘은 동기랑 투다리에서 포도소주 먹었다"),
        MemoDataModel(title: "우효 - 민들레", date: "2022/04/18", content: "우리 손 잡을까요 지난날은 다 잊어버리고 나를 사랑한다고 말해주세요"),
        MemoDataModel(title: "NewJeans - Hype Boy", date: "2022/04/01", content: "'Cause I know what you like boy You're my chemical hype boy"),
        MemoDataModel(title: "Harry Styles - As It Was", date: "2022/03/31", content: "In this world, It's just us, You know it's not the same as it was"),
        MemoDataModel(title: "Conan Gray - Wish You Were Sober", date: "2020/03/20", content: "Nineteen but you act twenty-five now Knees weak but you talk pretty fly wow"),
        MemoDataModel(title: "내일 먹을 거!!", date: "2020/02/01", content: "연어덮밥 떡볶이"),
        MemoDataModel(title: "명언1", date: "2020/01/26", content: "나는 단 한번도 이성적인 사고를 통해 발견한 적이 없다."),
        MemoDataModel(title: "명언2", date: "2020/01/21", content: "얼굴이 계속 햇빛을 향하도록 하라. 그러면 당신의 그림자를 볼 수 없다."),
        MemoDataModel(title: "명언3", date: "2020/01/17", content: "어린 아이들을 고통 받게 놔두는 한, 이 세상에 참된 사랑은 없다."),
        MemoDataModel(title: "명언4", date: "2020/01/15", content: "디자인은 제품이나 서비스의 연속적인 외층에 표현되는 인간 창조물의 영혼입니다."),
        MemoDataModel(title: "명언5", date: "2020/01/12", content: "편견과 관습의 도움 없이는 방을 가로질러 내 길을 찾아갈 수 없다."),
        MemoDataModel(title: "랜덤 문장", date: "2020/01/10", content: "I'd always thought lightning was something only I could see."),
        MemoDataModel(title: "랜덤 문장 2", date: "2020/01/08", content: "She felt that chill that makes the hairs on the back of your neck when he walked into the room."),
        MemoDataModel(title: "랜덤 문장 3!!!", date: "2020/01/07", content: "Situps are a terrible way to end your day."),
        MemoDataModel(title: "랜덤 문장 4!!!", date: "2020/01/06", content: "He knew it was going to be a bad day when he saw mountain lions roaming the streets."),
        MemoDataModel(title: "랜덤 문장 5!!!", date: "2020/01/05", content: "Nobody loves a pig wearing lipstick."),
        MemoDataModel(title: "랜덤 문장 6!!!", date: "2020/01/04", content: "I may struggle with geography, but I'm sure I'm somewhere around here."),
        
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
        
        if indexPath.row == 3 {
            let config = UIImage.SymbolConfiguration(scale: .large)
            cell.heartButton.setImage(UIImage(systemName: "heart.fill")?.withConfiguration(config), for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "위로🆙", handler: {
            action, view, completionHandler in
            self.memoData.insert(self.memoData[indexPath.row], at: 0)
            self.memoData.remove(at: indexPath.row+1)
            tableView.moveRow(at: indexPath, to: IndexPath(row: 0, section: 0))
            completionHandler(true)
        })
        
        action.backgroundColor = .systemGreen
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "지워요?🥺", handler: { action , view, completionHandler in
            self.memoData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        })
        
        action.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}
