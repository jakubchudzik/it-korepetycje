//
//  MyFirebaseService.swift
//  it-korepetycje
//
//  Created by Jakub Chudzik on 01/01/2022.
//

import Foundation
import Firebase

class MyFirebaseService {
    
    private init() {}
    static let shared = MyFirebaseService()
    
    lazy var tutorCollection = Firestore.firestore().collection("Tutors")
    
    var tutos: [Tutor] = []
    var selectedTutor: Tutor?
    
    func createUser(email: String, password: String, completion: @escaping (() -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password) { auth, error in
            UserService.shared.uid = auth?.user.uid
            
            UserService.shared.user?.email = email
            UserService.shared.user?.password = password
            UserService.shared.saveData()
            completion()
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping ((Error?) -> Void)) {
        let credentials = EmailAuthProvider.credential(withEmail: email, password: password)
        Auth.auth().signIn(with: credentials) { (user, error) in
            guard let user = user else { completion(error); return }
            
            UserService.shared.uid = user.user.uid
            print("UID" + user.user.uid)
            UserService.shared.getUser { error in
                completion(error)
            }
        }
    }
    
    func getTutors(completion: @escaping () -> Void) {
        print("!!111")
        tutorCollection.getDocuments { snapshot, error in
            print("!!22")
            
            do {
                let tutors: [Tutor]? = try snapshot?.decoded()
                MyFirebaseService.shared.tutos = tutors ?? []
                completion()
            } catch {
                
                print("!! 33\(error.localizedDescription)")
                print(error.localizedDescription)
                completion()
            }
        }
    }
}

class UserService {
    
    private init() {
        let database = Firestore.firestore()
        let userPath = "/Users/"
        
        userRef = database.collection(userPath)
    }
    static let shared = UserService()

    var user: User? = User()
    var email, password, uid: String?
    
    private var userRef: CollectionReference?
    
    func getUser(completion: @escaping ((Error?) -> Void)) {
        guard let uid = uid else { return }

        userRef?.document(uid).getDocument(completion: { (document, error) in
            guard let document = document else {
                completion(error)
                return
            }
            do {
                let user: User = try document.decoded()
                self.user = user
                completion(nil)
            } catch {
                completion(error)
            }
        })
    }
    
    func logout() {
        try? Auth.auth().signOut()
        email = nil
        password = nil
        uid = nil
    }
    
    func saveData() {
        do {
            let userDictionaryOptional = try user?.asDictionary()
            guard let userDictionary = userDictionaryOptional else { return }
            guard let uid = uid else { return }
            
            
            userRef?.document(uid).setData(userDictionary, merge: true)
        } catch {
            print(error)
        }
    }
}



extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}



extension DocumentSnapshot {
    func decoded<Type: Decodable>() throws -> Type {
        let jsonData = try JSONSerialization.data(withJSONObject: data() ?? [:], options: [])
        let object = try JSONDecoder().decode(Type.self, from: jsonData)
        return object
    }
}

extension QuerySnapshot {
    
    func decoded<Type: Decodable>() throws -> [Type] {
        
        var objects: [Type] = []
        for doc in documents {
            do {
                let object: Type = try doc.decoded()
                objects.append(object)
            } catch {
                print(error)
            }
        }
//        let objects: [Type] = try documents.map({ try $0.decoded() })
        return objects
    }
}
