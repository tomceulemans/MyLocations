//
//  Location.swift
//  MyLocations
//
//  Created by Tom Ceulemans on 05/03/16.
//  Copyright © 2016 Tom Ceulemans. All rights reserved.
//

import Foundation
import CoreData
import MapKit

class Location: NSManagedObject, MKAnnotation {

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    var title: String? {
        if locationDescription.isEmpty {
            return "(No Description)"
        } else {
            return locationDescription
        }
    }
    
    var subtitle: String? {
        return category
    }

    var hasPhoto: Bool {
        return photoId != nil
    }
    
    var photoPath: String {
        assert(photoId != nil, "No photo id set")
        let filename = "Photo-\(photoId!.integerValue).jpg"
        return (applicationDocumentsDirectory as NSString).stringByAppendingPathComponent(filename)
    }
    
    var photoImage: UIImage? {
        return UIImage(contentsOfFile: photoPath)
    }
    
    func removePhotoFile() {
        if hasPhoto {
            let path = photoPath
            let fileManager = NSFileManager.defaultManager()
            if fileManager.fileExistsAtPath(path) {
                do {
                    try fileManager.removeItemAtPath(path)
                } catch {
                    print("Error removing file: \(error)");
                }
            }
        }
    }
    
    class func nextPhotoId() -> Int {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let currentId = userDefaults.integerForKey("PhotoId")
        userDefaults.setInteger(currentId + 1, forKey: "PhotoId")
        userDefaults.synchronize()
        return currentId
    }
}
