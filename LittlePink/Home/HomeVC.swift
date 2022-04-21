//
//  HomeVC.swift
//  LittlePink
//
//  Created by 孙剑昆 on 2022/4/20.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
    // MARK: 设置上方的bar, 按钮 ,条的UI
        //1.整体bar--在sb上设置
        //2.selectedBar--按钮下方的条
        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        settings.style.selectedBarHeight = 3
        //3.buttonBarItem--文本或图片的按钮
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemTitleColor = .label
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        
        super.viewDidLoad()
        
        //设置不划出边界
        containerView.bounces = false
        //设置选中前后不同样式
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }
        //首先显示中间页面, 有警告(为完成上一个动画,就执行下一个动画)
        DispatchQueue.main.async{
            self.moveToViewController(at: 1, animated: false)
        }
    }
    
    
    //home 包含 discover , follow , nearby 三个页面切换
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]{
        let followVC = storyboard!.instantiateViewController(withIdentifier: kFollowVCID)
        let discoverVC = storyboard!.instantiateViewController(withIdentifier: kDiscoverVCID)
        let nearByVC = storyboard!.instantiateViewController(withIdentifier: kNearByVCID)
        return [followVC,discoverVC,nearByVC]
    }
    
    
}

