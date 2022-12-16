//
//  ViewController.swift
//  socialMedia
//
//  Created by Sam Schrager on 11/30/22.
//

import UIKit

struct pet {
    //this is where the variables that go into our struct
    var name: String
    var age: Int
    var location: String
    var followers: Int
    var following: Int
    var totalLikes: Int
    var breed: String
    var weight: Double
    var pic: UIImage
    var hasOwner: Bool
}

class ViewController: UIViewController {


    @IBOutlet weak var ownerInfo: UIButton!
    //these are all of the outlets that are on the screen
    @IBOutlet weak var importantDates: UIButton!
    @IBOutlet weak var petPlaces: UIButton!
    @IBOutlet weak var dogTitle: UILabel!
    @IBOutlet weak var petLikes: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var Likes: UILabel!
    @IBOutlet weak var followingText: UILabel!
    @IBOutlet weak var blueCheck: UIImageView!
    @IBOutlet weak var add: UIImageView!
    //instantiating pet1 to have the name klappa, an age of four, her location being central park, 2000000 followers, following three people, has a total number of likes of 40000000, have breed of bernalabradoodle, have a weight of 60 and an image called dog that if failed to load will display a filler image.
    var pet1 = pet(name: "klappa", age: 4, location: "Central Park", followers: 2000000, following: 3, totalLikes: 40000000, breed: "bernalabadoodle", weight: 60, pic: (UIImage(named: "dog") ?? UIImage(systemName: "square.and.arrow.up.circle"))!, hasOwner: true)
    func setUpBorders() {
        //sets up the image borders and sets them to blue.
        profileImage.layer.borderWidth = 5.0
        profileImage.layer.cornerRadius = 10.0
        profileImage.layer.borderColor = CGColor(red: 101.0/255.0, green: 172.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        //the next group is for each different button found on the bottom of the screen, it sets a blue border colour and a corner radius of 10. it is done four times for each button.
        ownerInfo.layer.borderWidth = 5.0
        ownerInfo.layer.cornerRadius = 10.0
        ownerInfo.layer.borderColor = CGColor(red: 101.0/255.0, green: 172.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        petPlaces.layer.borderWidth = 5.0
        petPlaces.layer.cornerRadius = 10.0
        petPlaces.layer.borderColor = CGColor(red: 101.0/255.0, green: 172.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        petLikes.layer.borderWidth = 5.0
        petLikes.layer.cornerRadius = 10.0
        petLikes.layer.borderColor = CGColor(red: 101.0/255.0, green: 172.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        importantDates.layer.borderWidth = 5.0
        importantDates.layer.cornerRadius = 10.0
        importantDates.layer.borderColor = CGColor(red: 101.0/255.0, green: 172.0/255.0, blue: 230.0/255.0, alpha: 1.0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //calls all code functions
        setUpBorders()
        addAllNames()
        profileImage.image = pet1.pic
        verify()
        //create the image for the add that is called duolingo
        add.image = UIImage(named: "duolingo")
        // Do any additional setup after loading the view.
    }
    func addAllNames() {
        //adds to each button a new title that includes the pet name.
        importantDates.setTitle("Important Dates for \(pet1.name)", for: .normal)
        petPlaces.setTitle("Where \(pet1.name) likes to hang out", for: .normal)
        petLikes.setTitle("What does \(pet1.name) like?", for: .normal)
        //ads the pet name to the label
        dogTitle.text = pet1.name
        //adds the follower count, num of likes, and following to the coresponding labels
        followers.text = "\(pet1.followers) followers"
        Likes.text = "\(pet1.totalLikes) likes"
        followingText.text = "\(pet1.following) following"
        //this is where we add the pet name to all of the text boxes
    }
    func isVerified()-> Bool{
        //checks to see if the account has enough likes and followers to be verified, returns yes if true, returns false if no.
        if(pet1.followers >= 10000 && pet1.totalLikes >= 100000){
            return true
        }
        return false
    }
    func verify(){
        //checks if the person is verified and if yes displays the verified blue check.
        if(isVerified()){
            blueCheck.image = UIImage(named: "check")
        }
    }

}

