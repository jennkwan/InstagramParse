//
//  UserMedia.swift
//  instagramParse
//
//  Created by jenn on 3/6/16.
//  Copyright © 2016 Jennifer Kwan. All rights reserved.
//

import UIKit
import Parse

class UserMedia: NSObject {
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        // Create Parse object PFObject
        let media = PFObject(className: "UserMedia")
        
        // Add relevant fields to the object
        media["media"] = getPFFileFromImage(image)
        media["author"] = PFUser.currentUser()
        media["caption"] = caption
        media["likesCount"] = 0
        media["commentsCount"] = 0
        
                media.saveInBackgroundWithBlock(completion)
    }
    
       class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
}