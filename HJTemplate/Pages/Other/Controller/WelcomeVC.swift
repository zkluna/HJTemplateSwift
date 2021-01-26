//
//  DTWelcomeVC.swift
//  ThirdPartyL
//
//  Created by zhaoke on 2017/7/6.
//  Copyright © 2017年 hhh. All rights reserved.
//

import UIKit
import SnapKit

class WelcomeVC: UIViewController {
    var scrollView: UIScrollView = UIScrollView()
    var pageControl: PageControl?
    let totalPage = 4
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpChildView()
    }
    func setUpChildView() {
        //
        scrollView.frame = view.bounds
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.bounces = false
        scrollView.contentSize = CGSize(width: kScreenWidth * CGFloat(totalPage), height: kScreenHeight)
        view.addSubview(scrollView)
        //
        for i in 0..<totalPage {
            let tempView = getGuidePage(page: i)
            scrollView.addSubview(tempView)
        }
        //
        pageControl = PageControl(frame: CGRect(x: 0, y: kScreenHeight - 110, width: kScreenWidth, height: 5))
        view.addSubview(pageControl!)
    }
    func getGuidePage(page: Int) -> UIView {
        let imageArr = ["guide_image_0", "guide_image_1", "guide_image_2", "guide_image_3"]
        let temp = UIView(frame: CGRect(x: kScreenWidth * CGFloat(page), y: 0, width: kScreenWidth, height: kScreenHeight))
        temp.backgroundColor = .white
        let imageContent = UIImageView(image: UIImage(named: imageArr[page]))
        temp.addSubview(imageContent)
        
        let imageH = kScreenWidth / 1125.0 * 2001
        imageContent.frame = CGRect(x: 0, y: min((kScreenHeight - imageH) / 2, kScreenHeight - imageH - 90), width: kScreenWidth, height: imageH)
        imageContent.hj_centerX = view.hj_width / 2
        imageContent.hj_centerY = view.hj_height / 2
        imageContent.layer.borderColor = UIColor.white.cgColor
        imageContent.layer.borderWidth = 1
        imageContent.layer.masksToBounds = true
        
        if (page == 3) {
            let btn = UIButton(type: .custom)
            btn.setImage(UIImage(named: "guide_image_sure"), for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            btn.addTarget(self, action: #selector(guideFinishAction), for: .touchUpInside)
            temp.addSubview(btn)
            btn.sizeToFit()
            btn.hj_centerX = view.hj_width / 2
            btn.hj_centerY = view.hj_height - 70
        }
        return temp
    }
    @objc func guideFinishAction() {
        UserDefaults.standard.set(true, forKey: HJFirstLaunch)
        UserDefaults.standard.synchronize()
        UIApplication.shared.delegate?.window??.rootViewController = HJTabBarController()
    }
}
extension WelcomeVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentIndex = Int((self.scrollView.contentOffset.x + self.scrollView.hj_width / 4) / self.scrollView.hj_width)
        self.pageControl!.currentPage = currentIndex
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let currentIndex = Int((self.scrollView.contentOffset.x + self.scrollView.hj_width / 4) / self.scrollView.hj_width)
        if(currentIndex == self.totalPage - 1) {
            if(self.scrollView.panGestureRecognizer.velocity(in: self.view).x < 0) {
                self.guideFinishAction()
            }
        }
    }
}

class PageControl: UIView {
    var pages: Array<UIView> = [UIView]()
    var _currentPage: Int = 0
    var currentPage: Int? {
        get {
            return _currentPage
        }
        set {
            _currentPage = newValue!
            for i in 0..<self.pages.count {
                let btn = self.pages[i]
                btn.backgroundColor = i == currentPage ? HJColor(r: 92, g: 119, b: 233) : HJColor(r: 209, g: 218, b: 255)
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadPages()
        currentPage = 0
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadPages() {
        for i in 0..<4 {
            let temp = UIView.init(frame: CGRect(x: 0, y: 0, width: self.hj_height, height: self.hj_height))
            temp.hj_centerX = self.hj_width / 2.0 + ((CGFloat(i) - 1.5) * 24)
            temp.backgroundColor = HJColor(r: 196, g: 206, b: 210)
            temp.layer.cornerRadius = self.hj_height / 2.0
            temp.layer.masksToBounds = true
            addSubview(temp)
            pages.append(temp)
        }
    }
}
//private let reuseIdentifier = "welcomeCellId"
//
//class WelcomeVC: UICollectionViewController {
//
//    private let images = ["guide_image_0", "guide_image_1", "guide_image_2", "guide_image_3"]
//    private var layout = DTWelcomeLayout()
//    init() {
//        super.init(collectionViewLayout: layout)
//        collectionView?.backgroundColor = UIColor.white
//        collectionView?.showsHorizontalScrollIndicator = false
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.collectionView!.register(DTWelcomeCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        print(view.frame)
//        print(view.safeAreaLayoutGuide.layoutFrame)
//        print(view.safeAreaInsets)
//    }
//    // MARK: UICollectionViewDataSource
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return images.count
//    }
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DTWelcomeCell
//        cell.iconView.image = UIImage(named: images[indexPath.item])
//        cell.iconView.backgroundColor = UIColor.white
//        if indexPath.item == 3 {
//            cell.startBtn.isHidden = false
//            cell.startBtn.addTarget(self, action: #selector(startBtnAction), for: .touchUpInside)
//        } else {
//            cell.startBtn.isHidden = true
//        }
//        return cell
//    }
//    // MARK: UICollectionViewDelegate
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if indexPath.item == 3 { startBtnAction() }
//    }
//    @objc func startBtnAction() {
//        UIApplication.shared.delegate?.window??.rootViewController = HJTabBarController()
//    }
//}
//private class DTWelcomeCell: UICollectionViewCell {
//    fileprivate lazy var iconView = UIImageView()
//    fileprivate lazy var startBtn: UIButton = {
//        let btn = UIButton()
//        btn.setBackgroundImage(UIImage(named: "guide_image_sure"), for: .normal)
//        btn.layer.masksToBounds = true
//        btn.isUserInteractionEnabled = true
//        btn.isHidden = true
//        return btn
//    }()
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setUI()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    func setUI(){
//        contentView.addSubview(iconView)
//        iconView.addSubview(startBtn)
//        iconView.contentMode = .scaleAspectFill
//        iconView.frame = UIScreen.main.bounds
//        startBtn.snp.makeConstraints { (make) in
//            make.bottom.equalTo(iconView).offset(-60)
//            make.width.equalTo(181)
//            make.height.equalTo(39)
//            make.centerX.equalTo(iconView)
//        }
//    }
//}
//private class DTWelcomeLayout: UICollectionViewFlowLayout {
//    // 自定义FlowLayout
//    fileprivate override func prepare() {
//        itemSize = UIScreen.main.bounds.size
//        minimumLineSpacing = 0
//        minimumInteritemSpacing = 0
//        scrollDirection = .horizontal
//        collectionView?.showsVerticalScrollIndicator = false
//        collectionView?.bounces = false
//        collectionView?.isPagingEnabled = true
//    }
//}
