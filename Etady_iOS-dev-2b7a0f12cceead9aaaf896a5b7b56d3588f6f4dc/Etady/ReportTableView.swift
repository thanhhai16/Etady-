//
//  ReportTableView.swift
//  Etady
//
//  Created by trung on 12/7/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//
import Foundation
import XLPagerTabStrip
import SwiftyJSON
import SDWebImage
class ReportTableView:UIViewController, UITableViewDataSource, IndicatorInfoProvider{
    var groupData:JSON?
    var reports:Array<JSON>?
    let cellIdentifier = "ReportCell"
    var indicator = IndicatorInfo(title: "View")
    //Vote bar
    @IBOutlet weak var voteBar: UIView!
    @IBOutlet weak var numberReport: UILabel!
    @IBOutlet weak var userReport: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var disLikeButton: UIButton!
    //Table view
    @IBOutlet weak var tableView: UITableView!
    
//    init(itemInfo: IndicatorInfo) {
//        self.indicator = itemInfo
//        super.init()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        tableView.dataSource = self
        
        setVoteBar()
    }
    
    func setVoteBar(){
        numberReport.text = reports?.count.description
        userReport.text = "người đăng"
        likeButton.setTitle((groupData!["upvote"].int)!.description, forState: .Normal)
        disLikeButton.setTitle((groupData!["downvote"].int)!.description, forState: .Normal)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        NSNotificationCenter.defaultCenter().addObserverForName(.UIContentSizeCategoryDidChange, object: .None, queue: .Main, usingBlock: nil){
            self.tableView.reloadData()
//        }
//        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
//        self?.tableView.reloadData()
//        }
        }
    
    // MARK: - UITableViewDataSource
    
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return indicator
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(reports?.count)
        return (reports?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ReportItem    
        print(reports![indexPath.row])
        let dataReport = reports![indexPath.row]
        cell.selectionStyle = .None
        cell.title.textAlignment = .Left        
        cell.icon.image = UIImage(named: "avatar")
        cell.title.text = dataReport["first_name"].string! + " " + dataReport["last_name"].string!
        cell.content.text = dataReport["description"].string
        
        if dataReport["image"] != nil {

           cell.image_report?.sd_setImageWithURL(NSURL(string: dataReport["image"].string! ), placeholderImage: UIImage(named: "place_holder"))
        }
        return cell
    }
}


