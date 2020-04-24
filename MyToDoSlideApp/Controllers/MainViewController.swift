



import UIKit
import SegementSlide

class MainViewController: SegementSlideViewController {
    
    let text = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
        scrollToSlide(at: 0, animated: true)
        
        
    }
    
    override var headerView: UIView?{
        let headerView = UIImageView()
        headerView.contentMode = .scaleToFill
        headerView.image = UIImage(named: "header")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        let headerViewHeight:CGFloat
        if #available(iOS 11.0,*){
            headerViewHeight = view.bounds.height/3 + view.safeAreaInsets.top
        }else{
            headerViewHeight = view.bounds.height/3 + topLayoutGuide.length
        }
        
        headerView.heightAnchor.constraint(equalToConstant: headerViewHeight).isActive = true
        return headerView
    }
    
    override var titlesInSwitcher: [String]{
        return ["DAY","MONTH","YEAR","LIFE","BOOK"]
    }
    
    override func segementSlideContentScrollView(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        switch index {
        case 0:
            return DayTableViewController() as! SegementSlideContentScrollViewDelegate
        default:
            return DayTableViewController() as! SegementSlideContentScrollViewDelegate
        }
    }


}

