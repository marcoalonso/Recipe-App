//
//  ImageUploader.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 05/02/24.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
    /*
     static func uploadImageRecipe(_ image: UIImage) async throws {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            print("Debug: Failed to convert image to data")
            return
        }
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let imageName = UUID().uuidString
        let imageRef = storageRef.child("recipe_images/\(imageName).jpg")
        
        _ = imageRef.putData(imageData, metadata: nil) { metadata, error in
            guard let _ = metadata else {
                print("Error uploading image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            print("Debug: Image uploaded successfully")
        }
    }
     */
    
    static func uploadImageAndGetUrl(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/recipe_images/\(filename)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            print("Debug: absoluteString \(url.absoluteString)")

            return url.absoluteString
        } catch {
            print("Debug: error \(error.localizedDescription)")
            return nil
        }
    }
        
    
        

           

}
