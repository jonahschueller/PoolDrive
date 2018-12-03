//
//  PoolFile.swift
//  PoolDrive
//
//  Created by Jonah Schueller on 14.11.18.
//  Copyright © 2018 Jonah Schueller. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

class PoolFile: PoolNode {
    
    public static let FILENAME = "fileName"
    public static let STORAGEURL = "storageUrl"
    
    override var firestoreCollectionName: String{
        return "files"
    }
    
    var storageUrl: String?{
        didSet{ hasChanged = true }
    }
    
    var fileName: String?{
        didSet{ hasChanged = true }
    }
    
    // File data
    var data: Data?{
        didSet{ hasChanged = true }
    }
    
    var meta: StorageMetadata?
    
    func downloadDataFromStorage(){
        fatalError("PoolFile.downloadDataFromStorage is not implemented")
        if data == nil {
            
        }
    }

    override func writeToSource() {
        super.writeToSource()
        firestoreData[PoolFile.FILENAME] = fileName
        firestoreData[PoolFile.STORAGEURL] = storageUrl
        
    }
    
    override func loadFromSource() {
        super.loadFromSource()
        fileName = getString(key: PoolFile.FILENAME)
        storageUrl = getString(key: PoolFile.STORAGEURL)
        hasChanged = false
    }
}



class NoFirestorePathError: Error { }