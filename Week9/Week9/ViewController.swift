//
//  ViewController.swift
//  Week9
//
//  Created by 이서영 on 2022/11/26.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tourData: TourData?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "대전에서 뭐하지?"
        getTourData()
    }


}

// MARK: - UITableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tourData?.msgBody.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell") as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        guard let tourBody = tourData?.msgBody else {
            return UITableViewCell()
        }
        
        let data = tourBody[indexPath.row]
        
        cell.titleLabel.text = data.name
        cell.recommendationLabel.isHidden = data.recommend == "Y" ? false : true
        cell.keywordLabel.text = "\(data.addr1) \(data.addr2 ?? "")"
        if let imagePath = data.idxImgPath {
            if let url = URL(string: "http://www.daejeon.go.kr/" + imagePath) {
                cell.tourImageView.load(url: url)
            }
        } else {
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - Networking
extension ViewController {
    func getTourData() {
        let url = "http://apis.data.go.kr/6300000/tourDataService/tourDataListJson?serviceKey=XDi%2BqCjoN12K8%2F3o4EwQcahsuyr0Ze%2FpSYz7Y8HFH%2FUMY6FHw2erTR5s%2FvaXB%2FqJsEmibIzX2E0gLGSEefv3FA%3D%3D&pageNo=1&numOfRows=30"
//        let url = "http://apis.data.go.kr/6300000/tourDataService/tourDataListJson"
//        let key = "XDi%2BqCjoN12K8%2F3o4EwQcahsuyr0Ze%2FpSYz7Y8HFH%2FUMY6FHw2erTR5s%2FvaXB%2FqJsEmibIzX2E0gLGSEefv3FA%3D%3D"
//        let parameters: Parameters = [
//            "serviceKey": key,
//            "pageNo": 1,
//            "numOfRows": 30
//        ]
        
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: TourData.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    self.tourData = response
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
