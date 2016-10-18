//
//  Wingman.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/13/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import Foundation
import UIKit

class Wingman {
    // Base variables
    fileprivate var _image: UIImage = #imageLiteral(resourceName: "profile1")
    fileprivate var _firstName: String = "John"
    fileprivate var _lastName: String = "Doe"
    fileprivate var _job: String = "Photographer"
    fileprivate var _location: String = "Azusa, CA"
    fileprivate var _rating: Double = 9.9
    fileprivate var _isOnline: Bool = true
    
    // Getters
    var image: UIImage {
        get {
            return _image
        }
        set(value) {
            _image = value
        }
    }
    var firstName: String {
        get {
            return _firstName
        }
        set(value) {
            _firstName = value
        }
    }
    var lastName: String {
        get {
            return _lastName
        }
        set(value) {
            _lastName = value
        }
    }
    var job: String {
        get {
            return _job
        }
        set(value) {
            _job = value
        }
    }
    var location: String {
        get {
            return _location
        }
        set(value) {
            _location = value
        }
    }
    var rating: Double {
        get {
            return _rating
        }
        set(value) {
            _rating = value
        }
    }
    var isOnline: Bool {
        get {
            return _isOnline
        }
        set(value) {
            _isOnline = value
        }
    }
    
    // Initializer
    init(image: UIImage, firstName: String, lastName: String, job: String, location: String, rating: Double, isOnline: Bool) {
        self._image = image
        self._firstName = firstName
        self._lastName = lastName
        self._job = job
        self._location = location
        self._rating = rating
        self._isOnline = isOnline
    }
}
