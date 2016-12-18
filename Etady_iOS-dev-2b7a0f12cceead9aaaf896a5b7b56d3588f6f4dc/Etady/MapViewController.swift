//
//  ViewController.swift
//  Etady
//
//  Created by trung on 11/8/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON
import Alamofire
import GoogleMaps


class MapViewController: UIViewController, MapCallbackProtocol, UISearchBarDelegate{
    
    static let share = MapViewController()
    
    
    // IBOutlet
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    //    @IBOutlet var mMapView: MGLMapView!
    @IBOutlet var mMapView: GMSMapView!
    @IBOutlet weak var shareFragment: UIView!
    @IBOutlet weak var mShareButton: UIButton!
    @IBOutlet weak var mLocateMeButton: UIButton!
    
    @IBOutlet weak var guestureRegion: UIView!
    @IBOutlet weak var btnLeftMenu: UIButton!
    //Location Info
    @IBOutlet weak var locationTitle: UILabel!
    @IBOutlet weak var locationInfo: UIView!
    var currentGroupId:Int?
    //Global let
    var mReportController:ReportController?
    var isFirstLoad = true
    var isShowShare = false
    var isShowLocationInfo = false
    
    let locationManager = CLLocationManager()
    
    var searchView : SearchView!
    var moreSearchView : MoreSearchView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        reLogin()
        initMap()
        initComponent()
        initControllerCoponent()
        initUIComponent()
        self.setSearchView()
        self.setMoreSearchView()
        print("hai", self.topBar.frame.origin.y)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(showUP), name: "btn", object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    // TopBar Search
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.moreSearchView.hidden = true
        self.searchView.hidden = true
    }
    func showUP () {
        if self.moreSearchView.hidden {
            self.moreSearchView.hidden = false
            self.searchView.hidden = true
        } else {
            self.moreSearchView.hidden = true
            self.searchView.hidden = false
        }
    }
    
    func setMoreSearchView() {
        self.moreSearchView = NSBundle.mainBundle().loadNibNamed("MoreSearchView", owner: nil, options: nil)?.first as! MoreSearchView
        self.moreSearchView.frame.origin.x = 0
        self.moreSearchView.frame.origin.y = self.searchView.frame.origin.y
        self.moreSearchView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.width * 3/4)
        self.moreSearchView.setUI()
        self.view.addSubview(moreSearchView)
        self.moreSearchView.hidden = true
    }
    
    func setSearchView() {
        self.searchView = NSBundle.mainBundle().loadNibNamed("SearchView", owner: nil, options: nil)?.first as! SearchView
        self.searchView.frame.origin.x = 0
        self.searchView.frame.origin.y = self.topBar.frame.origin.y - 20
        self.searchView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.width * 3/16)
        self.searchView.setUI()
        self.view.addSubview(searchView)
        self.searchView.hidden = true
    }
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.searchView.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        mShareButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside )
    }
    
    func initControllerCoponent(){
        mReportController = ReportController(mcb:self, mv:mMapView)
        mReportController?.onMapLoaded(mMapView)
    }
    
    func initMap() {
        let camera = GMSCameraPosition.cameraWithLatitude(16.1, longitude: 107.1, zoom: 7.0)
        mMapView.camera = camera
        mMapView.myLocationEnabled = true
        mMapView.delegate = self
    }
    
    func initUIComponent(){
        shareFragment.hidden = true
        locationInfo.hidden = true
    }
    
    func initComponent(){
        
        //Init left menu
        self.revealViewController().rearViewRevealWidth=250
        if revealViewController() != nil {
            btnLeftMenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            self.guestureRegion.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        // Set listener for button image
        
        mLocateMeButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: UIControlEvents.TouchUpInside)
        mShareButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func buttonTapped(sender: UIButton) {
        if sender === mLocateMeButton {
            if CLLocationManager.locationServicesEnabled() {
                switch(CLLocationManager.authorizationStatus()) {
                case .NotDetermined, .Restricted, .Denied:
                    requestLocationIOs()
                case .AuthorizedAlways, .AuthorizedWhenInUse:
                    print("Access")
                    let camera = GMSCameraPosition.cameraWithLatitude((mMapView.myLocation?.coordinate.latitude)!, longitude: (mMapView.myLocation?.coordinate.longitude)!, zoom: 15.0)
                    mMapView.camera = camera
                }
            } else {
                SystemUtils.showMessage(self, str: "Không thể xác định vị trí của bạn")
            }
            
            SystemUtils.log("Locate me")
            //            MapsUtils.gotoMyLocation(mMapView)
            // do something
        } else if sender == mShareButton {
            if(!isShowShare){
                shareFragment.hidden = false
                isShowShare = true
            }
        }
    }
    
    func reLogin(){
        let token = SystemUtils.getAccessToken()
        if(token != "")&&(!SystemUtils.getIsLogin()){
            SystemUtils.log("relogin")
            if SystemUtils.checkConnected(){
                //Set text annotation signin
                let data = APIManager.login("", password: "", token:token)
                //                Check error
                
                if data["error"].intValue == 0{
                    SystemUtils.setIsLogin(true)
                    NSUserDefaults.standardUserDefaults().setObject(data["data"]["access_token"].string, forKey: "token")
                    NSUserDefaults.standardUserDefaults().setObject(data["data"]["last_name"].string, forKey: "user_name")
                    NSUserDefaults.standardUserDefaults().synchronize()
                } else {
                    SystemUtils.setIsLogin(false)
                }
            }
            
        }
    }
    
    
    
    func requestLocationIOs() {
        dispatch_async(dispatch_get_main_queue(), {
            let alert = UIAlertController(title: "Error!", message: "GPS access is restricted", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Go to Settings", style: UIAlertActionStyle.Default, handler: { (alert: UIAlertAction!) in
                print("")
                UIApplication.sharedApplication().openURL(NSURL(string:UIApplicationOpenSettingsURLString)!)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
            //                self.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
        })
        
    }
    
    func printdemo() {
        print("OK")
    }
    @IBAction func pushGroupView(sender: AnyObject) {
        
        if SystemUtils.checkConnected(){
            let parameters = [
                "access_token":SystemUtils.getAccessToken(),
                "report_group_id": currentGroupId!]
            print(parameters)
            Alamofire.request(.POST, "http://etady.com/api/warning/getgroup", parameters: parameters as! [String : AnyObject], encoding: .URL)
                .responseJSON { response in
                    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ReportViewId") as! ReportViewController
                    controller.groupData = JSON(response.result.value!)
                    print(controller.groupData)
                    self.navigationController?.pushViewController(controller, animated: true)
            }
        }
        
    }
    
}

extension MapViewController: GMSMapViewDelegate{
    func mapViewDidFinishTileRendering(mapView: GMSMapView) {
        
    }
    
    func mapView(mapView: GMSMapView, willMove gesture: Bool) {
        // Keyboard
        // Share fragment
        // Marker info
        if gesture{
            SystemUtils.log("Hide share fragment")
            shareFragment.hidden = true
            isShowShare = false
            //Location Info
            locationInfo.hidden = true
            isShowLocationInfo = false
        }
    }
    
    func mapView(mapView: GMSMapView, didChangeCameraPosition position: GMSCameraPosition) {
        
    }
    // Marker
    func mapView(mapView: GMSMapView, didTapMarker marker: GMSMarker) -> Bool {
        let pin = marker as! ReportGroupPin
        print(pin.place.tags)
        locationTitle.text = SharingCategory.pinTitlesUppered[pin.place.tags[0].int! - 1]
        locationInfo.hidden = false
        isShowLocationInfo = true
        currentGroupId = pin.place.reportGroupId
        return true
    }
    
    func mapView(mapView: GMSMapView, didLongPressAtCoordinate coordinate: CLLocationCoordinate2D) {
        //Show info of place by google
        //add place in map
        //change camera
    }
    
    // Tap in Map
    func mapView(mapView: GMSMapView, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        self.view.endEditing(true)
        self.searchView.hidden = true
        self.moreSearchView.hidden = true
    }
    
    
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
            mMapView.myLocationEnabled = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            mMapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
    }
    
}

