//
//  ViewController.swift
//  ITVDNLessons2
//
//  Created by Anton Pavlov on 27.05.17.
//  Copyright © 2017 Anton Pavlov. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var notesTable: UITableView!
    @IBOutlet weak var labelNoNotes: UILabel!
    
    var notes = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
               // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let notesCount = notes.count
        
        labelNoNotes.isHidden=notesCount>0
        
        return notes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell")! as UITableViewCell
        cell.textLabel?.text = notes[indexPath.row]
        return cell
    }
   
    
    
    @IBAction func composeButtonTapped(_ sender: Any) {
        addNotes()
    }
    
    
    func deleteNotes(index:Int)  {
        notes.remove(at: index)
    }
    
    func addNotes() {
        let note = "Запись \(notes.count)"
        notes.append(note)
        
        notesTable.reloadData()
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteNotes(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

