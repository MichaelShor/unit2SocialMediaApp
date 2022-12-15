//
//  MichaelViewController.swift
//  unit2App
//
//  Created by Michael on 12/2/22.
//

import UIKit


// This creates the struct that will store the base information for the specifics of a person's account on this social media app
struct person {
    var name: String
    var birthday: String
    var age: Int
    var location: String
    var following: Int
    var followers: Int
    var numOfLikes: Int
    var pic: UIImage
    var hasPet: Bool
}



class MichaelViewController: UIViewController {
    
    // This is the instance of the struct that is defined above. This means that this is a specific case of the struct in which all of the variables defined in the struct are given specific values which are unique to the username "Bobby".
    var Person1 = person(name: "Bobby", birthday: "Jan 7 2005", age: 25, location: "New York", following: 1002, followers: 5000, numOfLikes: 5000000, pic: (UIImage(named: "chad") ?? UIImage(systemName: "square.and.arrow.up.circle"))!, hasPet: true)
    
    
    // The outlets for all the UILabels, UIImageViews, and UIButtons in this page
    @IBOutlet weak var PersonNameLabel: UILabel!
    
 
    @IBOutlet weak var ProfileImage: UIImageView!
    
    @IBOutlet weak var Followers: UILabel!
    @IBOutlet weak var Following: UILabel!
    @IBOutlet weak var NumberOfLikes: UILabel!
    
    
    @IBOutlet weak var VerifiedCheck: UIImageView!
    
    @IBOutlet weak var PetInfo: UIButton!
    
    @IBOutlet weak var BirthdayAgeGeneral: UIButton!
    @IBOutlet weak var CurrentEmployment: UIButton!
    @IBOutlet weak var LikesAndInterests: UIButton!
    
    //This function takes the values defined in the instance of the struct (the information on the user) and adds them to the outlets we created for the imageViews and for the labels which add the information onto the screen
    func loadDataOntoView() {
        ProfileImage.image = Person1.pic
        PersonNameLabel.text = Person1.name
        Followers.text = "\(Person1.followers) followers"
        Following.text = "\(Person1.following) following"
        NumberOfLikes.text = "\(Person1.numOfLikes) likes"
    }
    
    // This function creates the border settings and border color of the profile image of the person's account
    func setUpBorders() {
        ProfileImage.layer.borderWidth = 5.0
        ProfileImage.layer.cornerRadius = 10.0
        ProfileImage.layer.borderColor = CGColor(red: 101.0/255.0, green: 172.0/255.0, blue: 230.0/255.0, alpha: 1.0)
    }

    // In the viewDidLoad we are adding all of our functions which gave the buttons, labels, and images values from the instance. By calling these functions in the viewDidLoad we are adding them to our view controller as soon as the app is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBorders()
        loadDataOntoView()
        addAllNames()
        VerifiedCheckMark()
        // Do any additional setup after loading the view.
    }
    
    // In this function we are changing the text of each of the UIButtons based on the values of the instances in the struct
    func addAllNames() {
        BirthdayAgeGeneral.setTitle("\(Person1.name)'s birthday, age, and general info", for: .normal)
        CurrentEmployment.setTitle("\(Person1.name)'s current employment", for: .normal)
        LikesAndInterests.setTitle("\(Person1.name)'s likes and interests", for: .normal)
    }
    
    // In this part of the code we create the logic for adding an image of a verified check next to the profile based on certain conditions. In this case, if the number of followers and the number of likes which are two variables defined in the instance of the struct are greater than or equal to 5000 and 1000000 respectively. Based on if these two conditions are met then the function either returns true or false.
    func isVerified() -> Bool {
        if(Person1.followers >= 5000 && Person1.numOfLikes >= 1000000){
            return true
        } else {
            return false
        }
    }
    //Based on the first part of the function we either have a true value returned or a false value, we then make a conditional which states that if the function above is true meaning that the followers and num of likes is greater than a certain value then we set a UIImage to the verifiedcheck mark
    func VerifiedCheckMark() {
        if (isVerified()) {
            VerifiedCheck.image = UIImage(named: "VerifiedCheck") ?? UIImage(systemName: "square.and.arrow.up.circle")!
        }
    }
}
