//
//  ViewController.swift
//  CowsAndBulls
//
//  Created by Dan Lindsay on 2017-02-09.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import Cocoa
import GameplayKit

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    
    @IBOutlet var tableView: NSTableView!
    @IBOutlet var textFieldGuess: NSTextField!
    
    var answer = ""
    var guesses = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        startNewGame()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func submitGuess(_ sender: Any) {
        
    }
    
    func result(for guess: String) -> String {
        
        return "Result"
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        
        return guesses.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        guard let vw = tableView.make(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        
        if tableColumn?.title == "Guess" {
            vw.textField?.stringValue = result(for: guesses[row])
        }
        
        return vw
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return false
    }
    
    func startNewGame() {
        
        textFieldGuess.stringValue = ""
        guesses.removeAll()
        answer = ""
        
        var numbers = Array(0...9)
        numbers = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: numbers) as! [Int]
        
        for _ in 0..<4 {
            answer.append(String(numbers.removeLast()))
        }
        
        tableView.reloadData()
    }

}



















