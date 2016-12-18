//
//  ReportFragment.swift
//  Etady
//
//  Created by trung on 12/7/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//
import Foundation
import XLPagerTabStrip
import Alamofire
import SwiftyJSON

class ReportViewController: ButtonBarPagerTabStripViewController {
    
    var isReload = false
    var groupData:JSON? = nil
    var groupID: Int?
    var numberGroup:Int = 1
    
    
    func setGroupId(id: Int){
        print("Init data group ")
        self.groupID = id
//        getGroup(SystemUtils.getAccessToken(), group_Id:id)       
    }
    
    func getGroup(token:String, group_Id:Int){
        if SystemUtils.checkConnected(){
            let parameters = [
                "access_token":token,
                "report_group_id": group_Id]
            print(parameters)
            Alamofire.request(.POST, "http://etady.com/api/warning/getgroup", parameters: parameters as! [String : AnyObject], encoding: .URL)
                .responseJSON { response in
                    print("get data")
                    print(response.result.value!)
                    let data = JSON(response.result.value!)
                    print("data json")
                    self.groupData = data                    
                    print(self.groupData)
            }            
        } 
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
    }

    
    override func viewDidLoad() {
        settings.style.selectedBarBackgroundColor = UIColor(colorLiteralRed: 0.0, green: 187/255, blue: 155/255, alpha: 1.0)

        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewControllersForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var reportViewControllers:[ReportTableView] = []
        if groupData!["error"].intValue == 0 {
            for i in 0...groupData!["data"].count-1 {
                let childInfo = IndicatorInfo(title: SharingCategory.pinTitlesUppered[groupData!["data"][i]["tag"].int!-1])
                let childReportView = self.storyboard?.instantiateViewControllerWithIdentifier("ReportTableView") as! ReportTableView
                childReportView.indicator = childInfo
                childReportView.groupData = groupData!["data"][i]
                childReportView.reports = groupData!["data"][i]["reports"].arrayValue
                print(groupData!["data"][i]["reports"].arrayValue)
                reportViewControllers.append(childReportView)                
            }
        }

        return  reportViewControllers
    }    
}
