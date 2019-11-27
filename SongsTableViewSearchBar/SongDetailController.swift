//
//  SongDetailController.swift
//  SongsTableViewSearchBar
//
//  Created by Kelby Mittan on 11/27/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongDetailController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    var song: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    
    func updateUI() {
        guard let validSong = song else {
            fatalError("could not load song")
        }
        
        titleLabel.text = validSong.name
        artistLabel.text = validSong.artist
    }

}
