//
//  ViewModel.swift
//  it-korepetycje
//
//  Created by Jakub Chudzik on 31/12/2021.
//

import Foundation
import Firebase
import FirebaseStorage

class ViewModel:ObservableObject{
    @Published var list = [User]()

    func getData(){
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments { snapshot, error in
            //Check for errors
            if error == nil
            {
                //no errors
                if let snapshot = snapshot{
                    
                    //update the list property in the main thread
                    DispatchQueue.main.async {
                        //get all documents and create Users
                        self.list = snapshot.documents.map{ d in
                            
                            //create a User item for each document returned
                            return User(id: d.documentID,
                                        email: d["email"] as? String ?? "",
                                        password: d["password"] as? String ?? "")
                        }
                    }
                }
            }
            else{
                
            }
        }
    }
}
