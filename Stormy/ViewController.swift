//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 4/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let forecastAPIKey = "2bd675f3096bb54a1f18c26df85b7bff"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let icon = WeatherIcon.PartlyCloudyDay.image
        let currentWeather = CurrentWeather(temperature: 56.0, humidity: 1.0, precipitationProbability: 1.0,
                                            summary: "Wet and rainy", icon: icon)
        display(currentWeather)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func display(weather: CurrentWeather) {
        currentTemperatureLabel.text = weather.temperatureString
        currentHumidityLabel.text = weather.humidityString
        currentPrecipitationLabel.text = weather.precipitationProbabilityString
        currentSummaryLabel.text = weather.summary
        currentWeatherIcon.image = weather.icon
    }
}

extension CurrentWeather {
    var temperatureString: String {
        return "\(Int(temperature))º"
    }
    
    var humidityString: String {
        return "\(Int(humidity * 100))%"
    }
    
    var precipitationProbabilityString: String {
        return "\(Int(precipitationProbability * 100))%"
    }
}
