//
//  SongViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Kelby Mittan on 11/27/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var songs = [Song]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        songs = Song.loveSongs
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //            guard let weatherVC = segue.destination as? WeatherDetailController, let indexPath = tableView.indexPathForSelectedRow else {
    //                return
    //            }
    //
    //            weatherVC.cityWeather = citiesArr[indexPath.row]
    //        }
    //
    //
}

extension SongViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        
        
        return cell
    }
    
    
}
