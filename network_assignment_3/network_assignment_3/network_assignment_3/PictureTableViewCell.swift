//
//  PictureTableViewCell.swift
//  network_assignment_3
//
//  Created by Consultant on 5/3/22.
//

import UIKit

class PictureTableViewCell: UITableViewCell {

    let profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        SetupCell()
     }
    
    func SetupCell(){
        
        self.contentView.addSubview(profileImageView)
        self.contentView.addSubview(nameLabel)
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        profileImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:100).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:100).isActive = true
        nameLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 50).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant: 150).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: 50).isActive = true
        
        picture_grab(){
            data, id in
            guard let data = data, let id = id else { return }
            
            DispatchQueue.main.async {
                self.profileImageView.image = UIImage(data: data)
                self.nameLabel.text = id
            }
        }
    }
    
    func picture_grab(completion: @escaping (Data?, String?) -> Void){
        guard let url = URL(string: "https://picsum.photos/100") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let _ = error {
                completion(nil, nil)
                return
            }
            
            var id: String?
            if let httpResponse = response as? HTTPURLResponse {
                id = httpResponse.value(forHTTPHeaderField: "picsum-id")
            }
            
            completion(data, id)
            
        }
        task.resume()
    }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
