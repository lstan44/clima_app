

import UIKit

class WeatherDataModel {
    
    //Declare your model variables here
    var temperature: Int = 0
    var conditionDes: String = " "
    var conditionId: Int = 0
    var city: String = ""
    var weatherIconName: String = ""
    
    //This method turns a condition code into the name of the weather condition image
    
    func updateWeatherIcon(condition: Int) -> String {
        
    switch (conditionId) {
    
        case 0...300 :
            return getStorm()
        
        case 301...500 :
            return getLightRain()
        
        case 501...600 :
            return getHeavyRain()
        
        case 601...700 :
            return getSnow()
        
        case 701...771 :
            return getFog()
        
        case 772...799 :
            return getStorm()
        
        case 800 :
            return getSunny()
        
        case 801...804 :
            return getCloudy()
        
        case 900...903, 905...1000  :
            return getStorm()
        
        case 903 :
            return getSnow()
        
        case 904 :
            return getSunny()
        
        default :
            return "dunno"
        }

    }
    
    func setTemp(temp:Int){
        self.temperature = temp
    }
    
    func setCity(c:String){
        self.city = c
    }
    
    func setConditionDes(desc:String){
        self.conditionDes = desc
    }
    
    func setConditionId(id:Int){
        self.conditionId = id
    }
    
    
    func getCloudy()->String{
        let number = Int.random(in: 1 ... 6)
        return "cloudy\(number)"
    }
    func getFog()->String{
        let number = Int.random(in: 1 ... 5)
        return "fog\(number)"
    }
    
    func getHeavyRain()->String{
        let number = Int.random(in: 1 ... 5)
        return "heavyrain\(number)"
    }
    
    func getLightRain()->String{
        let number = Int.random(in: 1 ... 8)
        return "lightrain\(number)"
    }
    func getOverCast()->String{
        let number = Int.random(in: 1 ... 3)
        return "overcast\(number)"
    }
    
    func getSnow()->String{
        let number = Int.random(in: 1 ... 3)
        return "snow\(number)"
    }
    
    func getStorm()->String{
        let number = Int.random(in: 1 ... 7)
        return "storm\(number)"
    }
    
    func getSunny()->String{
        let number = Int.random(in: 1 ... 4)
        return "sunny\(number)"
    }
}
