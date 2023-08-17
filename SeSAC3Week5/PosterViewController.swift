//
//  PosterViewController.swift
//  SeSAC3Week5
//
//  Created by JongHoon on 2023/08/16.
//

import UIKit

import Alamofire
import SwiftyJSON

import Kingfisher

protocol CollectionViewAttributedProtocol {
    func configureCollectionView()
    func configureCollectionViewLayout()
}

final class PosterViewController: UIViewController {
    
    private var list: Recommendation = Recommendation(
        totalResults: 0,
        page: 0,
        totalPages: 0,
        results: []
    )
    private var secondList: Recommendation = Recommendation(
        totalResults: 0,
        page: 0,
        totalPages: 0,
        results: []
    )
    private var thirdList: Recommendation = Recommendation(
        totalResults: 0,
        page: 0,
        totalPages: 0,
        results: []
    )
    private var fourthList: Recommendation = Recommendation(
        totalResults: 0,
        page: 0,
        totalPages: 0,
        results: []
    )
    
    private var movieIDs: [Int] = [447365, 569094, 976573, 872585]
    
    @IBOutlet var posterCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
//        LottoManager.shared.callLotto(completionHandler: { bonus, number in
//            print("클로저 꺼내온 값: \(bonus), \(number)")
//        })
        
        configureCollectionView()
        configureCollectionViewLayout()
        
//        callRecommendation(
//            id: 872585,
//            completionHander: { [weak self] data in
//                self?.list = data
//
//                self?.callRecommendation(
//                    id: 976573,
//                    completionHander: { [weak self] data in
//                        self?.secondList = data
//
//                        self?.callRecommendation(
//                            id: 569094,
//                            completionHander: { [weak self] data in
//                                self?.thirdList = data
//
//                                self?.callRecommendation(
//                                    id: 447365,
//                                    completionHander: { [weak self] data in
//                                        self?.fourthList = data
//                                        self?.posterCollectionView.reloadData()
//                                    }
//                                )
//                            }
//                        )
//                    }
//                )
//            }
//        )
    
        let group = DispatchGroup()
        for (index, id) in movieIDs.enumerated()   {
            group.enter()
            
            callRecommendation(id: id, completionHander: { [weak self] recommendation in
                switch index {
                case 0:
                    self?.list = recommendation
                case 1:
                    self?.secondList = recommendation
                case 2:
                    self?.thirdList = recommendation
                case 3:
                    self?.fourthList = recommendation
                default:
                    break
                }
                group.leave()
            })
        }
        
        group.notify(queue: .main, execute: { [weak self] in
            self?.posterCollectionView.reloadData()
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        showAlert(
//            title: "타이틀",
//            message: "메시지",
//            button: "확인",
//            completionHandler: { [weak self] in
//                print("확인 버튼을 클릭했습니다.")
//                self?.posterCollectionView.backgroundColor = .lightGray
//            }
//        )
    }
    
    // 오펜하이머 872585
    // 엘리멘탈 976573
    // 스파이더맨 569094
    // 가오갤 447365
    func callRecommendation(
        id: Int,
        completionHander: @escaping (Recommendation) -> Void
    ) {
        let url = "https://api.themoviedb.org/3/movie/\(id)/recommendations?api_key=\(APIKey.tmdbKey)&language=ko-KR"
        
        AF.request(
            url
        )
        .validate()
        .responseDecodable(
            of: Recommendation.self,
            completionHandler: { response in
                                
                switch response.result {
                case let .success(value):
                    completionHander(value)
                case let .failure(error):
                    print(error)
                }
            }
        )
    }
}

extension PosterViewController: UICollectionViewDataSource {
    
    func numberOfSections(
        in collectionView: UICollectionView
    ) -> Int {
        return 4
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        
        if section == 0 {
            return list.results?.count ?? 0
        } else if section == 1 {
            return secondList.results?.count ?? 0
        } else if section == 2 {
            return thirdList.results?.count ?? 0
        } else {
            return fourthList.results?.count ?? 0
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PosterCollectionViewCell.identifier,
            for: indexPath
        ) as? PosterCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        if indexPath.section == 0 {
            cell.posterImageView.kf.setImage(with: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2\(list.results?[indexPath.item].posterPath ?? "")"))
        } else if indexPath.section == 1 {
            cell.posterImageView.kf.setImage(with: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2\(secondList.results?[indexPath.item].posterPath ?? "")"))
        } else if indexPath.section == 2 {
            cell.posterImageView.kf.setImage(with: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2\(thirdList.results?[indexPath.item].posterPath ?? "")"))
        } else {
            cell.posterImageView.kf.setImage(with: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2\(fourthList.results?[indexPath.item].posterPath ?? "")"))
        }
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderPosterCollectionReusableView.identifier,
                for: indexPath
            ) as? HeaderPosterCollectionReusableView
            else {
                return UICollectionReusableView()
            }
            
            return view
            
        } else {
            return UICollectionReusableView()
        }
    }
}

extension PosterViewController: UICollectionViewDelegate {
    
}

extension PosterViewController: CollectionViewAttributedProtocol {
    func configureCollectionView() {
        
        // protocol as type
        posterCollectionView.dataSource = self
        posterCollectionView.delegate = self
        
        posterCollectionView.register(
            UINib(
                nibName: PosterCollectionViewCell.identifier,
                bundle: nil
            ),
            forCellWithReuseIdentifier: PosterCollectionViewCell.identifier
        )
        posterCollectionView.register(
            UINib(
                nibName: HeaderPosterCollectionReusableView.identifier,
                bundle: nil
            ),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderPosterCollectionReusableView.identifier
        )
    }
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: 100,
            height: 100
        )
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .vertical
        layout.headerReferenceSize = CGSize(
            width: 300,
            height: 50
        )
        
        posterCollectionView.collectionViewLayout = layout
    }
}

/*
 Protocol as Type
 */

/*
protocol Test {
func test()
}

class A: Test {
    func test() {
        
    }
}

class B: Test {
    func test() {
        
    }
}

class C: A {
    
}

let example = A()

let value: Test = C()
*/
