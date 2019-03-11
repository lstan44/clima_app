

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON


class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "b92a7d4fdf8f483edaa2f3d68fb2a60b"
    /***App ID at https://openweathermap.org/appid ****/
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    let weatherDataModelObject = WeatherDataModel()
    

    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO:Set up the location manager here.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
    
        let id = weatherDataModelObject.conditionId
        print(id)
        cityLabel.text = weatherDataModelObject.city
        weatherIcon.image = UIImage(named: weatherDataModelObject.updateWeatherIcon(condition: id))
    }
    
    
    //MARK: - Networking
    /***************************************************************/
    //Write the getWeatherData method here:
    
    func getWeatherData(url:String, parameters:[String:String]){
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON{
            response in
            if response.result.isSuccess{
            //  print(response.result.value)
                
                let weatherJSON: JSON = JSON(response.result.value!)
                self.updateWeatherData(json: weatherJSON)
                
            }
            else{
                //print("Error: \(response.result.error)")
                self.cityLabel.text = "Connection issues."
            }
        }
    }
    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    
    func updateWeatherData(json : JSON){
        let tempResult = json["main"]["temp"].double
        let cityResult = json["name"].stringValue
        let conditionResult = json["weather"]["description"].stringValue
        
        //let cId = json["weather"][]["id"].int
        //print(cId)
        weatherDataModelObject.setTemp(temp: Int(tempResult! - 273.15))
        weatherDataModelObject.setCity(c: cityResult)
        weatherDataModelObject.setConditionDes(desc: conditionResult)
        weatherDataModelObject.setConditionId(id: 500)
    
    }
    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count-1]
        if location.horizontalAccuracy > 0{
            self.locationManager.stopUpdatingLocation()
            self.locationManager.delegate = nil
        }
         let latitude = String(location.coordinate.latitude)
        let longitude = String(location.coordinate.longitude)
        
        let params : [String : String] = ["lat": latitude, "lon" : longitude , "appid" : APP_ID]
        
        getWeatherData(url: WEATHER_URL, parameters: params)
    }
    
    
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Not Avalaible"
    }
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    
}



