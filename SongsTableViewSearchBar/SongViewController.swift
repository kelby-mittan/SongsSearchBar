//
//  SongViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Kelby Mittan on 11/27/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

enum SearchScope {
    case name
    case artist
}

class SongViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var songs = [Song]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var currentScope = SearchScope.name
    
    var searchQuery = "" {
        didSet {
            switch currentScope {
            case .name:
                songs = Song.loveSongs.filter { $0.name.lowercased().contains(searchQuery.lowercased()) }
            case .artist:
                songs = Song.loveSongs.filter { $0.artist.lowercased().contains(searchQuery.lowercased()) }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        loadData()
    }
    
    func loadData() {
        songs = Song.loveSongs
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let songVC = segue.destination as? SongDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("....")
        }
        
        songVC.song = songs[indexPath.row]
    }
    
    
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

extension SongViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        searchBar.resignFirstResponder()
        
        guard let searchText = searchBar.text else {
            return
        }
        
        guard !searchText.isEmpty else {
            loadData()
            return
        }
        
        searchQuery = searchText

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            loadData()
            return
        }
        
        searchQuery = searchText

    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        switch selectedScope {
        case 0:
            currentScope = .name
        case 1:
            currentScope = .artist
        default:
            print("not a valid search scope")
        }
    }
    
    
}
