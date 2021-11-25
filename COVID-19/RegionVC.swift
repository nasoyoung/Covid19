//
//  RegionVC.swift
//  COVID-19
//
//  Created by 김현수 on 2021/08/21.
//

import UIKit

class RegionVC: UIViewController {
    
    @IBOutlet weak var customNavi: UINavigationBar!
    
    var cityCovidModel: FirstModel?
    
    var regionName = ["서울\n확진자 현황", "부산\n확진자 현황", "대구\n확진자 현황", "인천\n확진자 현황", "광주\n확진자 현황", "대전\n확진자 현황", "울산\n확진자 현황", "세종\n확진자 현황", "경기\n확진자 현황", "강원\n확진자 현황", "충북\n확진자 현황", "충남\n확진자 현황", "전북\n확진자 현황", "전남\n확진자 현황", "경북\n확진자 현황", "경남\n확진자 현황", "제주\n확진자 현황", "검역\n확진자 현황"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sndgetDataFromJson()
        
        UINavigationBar.appearance().isTranslucent = false
        customNavi?.titleTextAttributes = [.foregroundColor: UIColor.white]
        customNavi.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        customNavi.shadowImage = UIImage()
    

    }
    
    func sndgetDataFromJson() {
        if let url = URL(string: "https://api.corona-19.kr/korea/country/new/?serviceKey=S8oXrvGFsQgZEwntuR4YLMBOb2jxVfPhp") {
            var request = URLRequest.init(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(FirstModel.self, from: data) {
                    self.cityCovidModel = json
                    print(json)
                }
                
            }.resume()
        }
    }
    
    @IBAction func goToHomeVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension RegionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return regionName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RegionCVC", for: indexPath) as? RegionCVC else { return UICollectionViewCell() }
        
        cell.regionTitle.text = regionName[indexPath.item]
        
        collectionView.backgroundColor = #colorLiteral(red: 0.8217374682, green: 0.3638318181, blue: 0.4465807676, alpha: 1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.modalPresentationStyle = .overCurrentContext
        
        //서울 데이터
        if indexPath.row == 0 {
            vc.receiveRegion = cityCovidModel?.seoul?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.seoul?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.seoul?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.seoul?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.seoul?.death ?? "nil"
        } else if indexPath.row == 1 {
            vc.receiveRegion = cityCovidModel?.busan?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.busan?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.busan?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.busan?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.busan?.death ?? "nil"
        } else if indexPath.row == 2 {
            vc.receiveRegion = cityCovidModel?.daegu?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.daegu?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.daegu?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.daegu?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.daegu?.death ?? "nil"
        } else if indexPath.row == 3 {
            vc.receiveRegion = cityCovidModel?.incheon?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.incheon?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.incheon?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.incheon?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.incheon?.death ?? "nil"
        } else if indexPath.row == 4 {
            vc.receiveRegion = cityCovidModel?.gwangju?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.gwangju?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.gwangju?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.gwangju?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.gwangju?.death ?? "nil"
        } else if indexPath.row == 5 {
            vc.receiveRegion = cityCovidModel?.daejeon?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.daejeon?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.daejeon?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.daejeon?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.daejeon?.death ?? "nil"
        } else if indexPath.row == 6 {
            vc.receiveRegion = cityCovidModel?.ulsan?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.ulsan?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.ulsan?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.ulsan?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.ulsan?.death ?? "nil"
        } else if indexPath.row == 7 {
            vc.receiveRegion = cityCovidModel?.sejong?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.sejong?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.sejong?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.sejong?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.sejong?.death ?? "nil"
        } else if indexPath.row == 8 {
            vc.receiveRegion = cityCovidModel?.gyeonggi?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.gyeonggi?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.gyeonggi?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.gyeonggi?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.gyeonggi?.death ?? "nil"
        } else if indexPath.row == 9 {
            vc.receiveRegion = cityCovidModel?.gangwon?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.gangwon?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.gangwon?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.gangwon?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.gangwon?.death ?? "nil"
        } else if indexPath.row == 10 {
            vc.receiveRegion = cityCovidModel?.chungbuk?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.chungbuk?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.chungbuk?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.chungbuk?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.chungbuk?.death ?? "nil"
        } else if indexPath.row == 11 {
            vc.receiveRegion = cityCovidModel?.chungnam?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.chungnam?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.chungnam?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.chungnam?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.chungnam?.death ?? "nil"
        } else if indexPath.row == 12 {
            vc.receiveRegion = cityCovidModel?.jeonbuk?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.jeonbuk?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.jeonbuk?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.jeonbuk?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.jeonbuk?.death ?? "nil"
        } else if indexPath.row == 13 {
            vc.receiveRegion = cityCovidModel?.jeonnam?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.jeonnam?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.jeonnam?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.jeonnam?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.jeonnam?.death ?? "nil"
        } else if indexPath.row == 14 {
            vc.receiveRegion = cityCovidModel?.gyeongbuk?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.gyeongbuk?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.gyeongbuk?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.gyeongbuk?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.gyeongbuk?.death ?? "nil"
        } else if indexPath.row == 15 {
            vc.receiveRegion = cityCovidModel?.gyeongnam?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.gyeongnam?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.gyeongnam?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.gyeongnam?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.gyeongnam?.death ?? "nil"
        } else if indexPath.row == 16 {
            vc.receiveRegion = cityCovidModel?.jeju?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.jeju?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.jeju?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.jeju?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.jeju?.death ?? "nil"
        } else if indexPath.row == 17 {
            vc.receiveRegion = cityCovidModel?.quarantine?.countryName ?? "nil"
            vc.receiveTotalCase = cityCovidModel?.quarantine?.totalCase ?? "nil"
            vc.receiveNewCase = cityCovidModel?.quarantine?.newCase ?? "nil"
            vc.receiveRecovered = cityCovidModel?.quarantine?.recovered ?? "nil"
            vc.receiveDeath = cityCovidModel?.quarantine?.death ?? "nil"
        }
    
        self.present(vc, animated: true, completion: nil)
        
    }
}

extension RegionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (collectionView.bounds.width - (20 * 3)) / 2
        let height: CGFloat = width + 15
        
        return CGSize(width: width, height: height)
    }
}


class RegionCVC: UICollectionViewCell {
    
    @IBOutlet weak var regionTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowRadius = 7
        contentView.layer.shadowOffset = CGSize(width: 4, height: 4)
        contentView.layer.shadowColor = UIColor.black.cgColor
        
        layer.cornerRadius = 15
        layer.masksToBounds = false
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 7
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowColor = UIColor.black.cgColor
    }
}
