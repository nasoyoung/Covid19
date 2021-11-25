//
//  HomeVC.swift
//  COVID-19
//
//  Created by 또용이 on 2021/08/21.
//

import UIKit

class HomeVC: UIViewController {
    
    var covidModel: TotalModel?
    var covidSndModel: FirstModel?

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var textView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var totalCase: UILabel!
    @IBOutlet weak var todayCase: UILabel!
    
    @IBOutlet weak var totalRCCase: UILabel!
    @IBOutlet weak var todayRecovered: UILabel!
    
    @IBOutlet weak var totalDeath: UILabel!
    @IBOutlet weak var todayDt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromJson()
        sndgetDataFromJson()
        viewCustom()
    
    }
    
    func viewCustom() {
        textView.layer.cornerRadius = 13
        textView.layer.shadowColor = UIColor.black.cgColor
        textView.layer.masksToBounds = false
        textView.layer.shadowOffset = CGSize(width: 4, height: 4)
        textView.layer.shadowRadius = 13
        textView.layer.shadowOpacity = 0.3
    }
    
    func getDataFromJson() {
        if let url = URL(string: "https://api.corona-19.kr/korea/?serviceKey=S8oXrvGFsQgZEwntuR4YLMBOb2jxVfPhp") {
            var request = URLRequest.init(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(TotalModel.self, from: data) {
                    self.covidModel = json
                   //print(json)
                }
                
                DispatchQueue.main.async {
                    guard let updateTime = self.covidModel?.updateTime else { return }
                    guard let updateCase = self.covidModel?.TotalCase else { return }
                    guard let updateRCCase = self.covidModel?.TotalRecovered else { return }
                    guard let todayRecovery = self.covidModel?.TodayRecovered else { return }
                    guard let updateDeath = self.covidModel?.TotalDeath else { return }
                    guard let todayRCCase = self.covidModel?.TodayDeath else { return }
                    
                    self.timeLabel.text = updateTime
                    self.totalCase.text = updateCase
                    self.totalRCCase.text = updateRCCase
                    self.todayRecovered.text = "\(todayRecovery)▲"
                    self.totalDeath.text = updateDeath
                    self.todayDt.text = "\(todayRCCase)▲"
                }
                
            }.resume()
        }
    }
    
    func sndgetDataFromJson() {
        if let url = URL(string: "https://api.corona-19.kr/korea/country/new/?serviceKey=S8oXrvGFsQgZEwntuR4YLMBOb2jxVfPhp") {
            var request = URLRequest.init(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(FirstModel.self, from: data) {
                    self.covidSndModel = json
                    //print(json)
                }
                
                DispatchQueue.main.async {
                    guard let updateToday = self.covidSndModel?.korea?.newCase else { return }
                    
                    self.todayCase.text = "\(updateToday)▲"
                }
                
            }.resume()
        }
    }
    
    @IBAction func goToRegion(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegionVC") as! RegionVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
