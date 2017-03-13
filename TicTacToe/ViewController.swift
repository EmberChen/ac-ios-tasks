//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ember on 2017/2/27.
//  Copyright © 2017年 Ember. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var player = -1
    var canPlay = true
    var oxStatus = [2,3,4,5,6,7,8,9,10]
    var winStatus = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction func play(_ sender: UIButton) {
        if sender.currentImage == nil && canPlay == true{
            if player == 1{
                sender.setImage(UIImage(named: "x.png"), for: UIControlState())
                label.text = "O 's turn!"
                label.textColor = UIColor(red: 0, green: 0, blue: 128/255, alpha: 1.0)
                player *= -1
                whoWin(sender.tag, player)
                draw()
            }else if player == -1{
                sender.setImage(UIImage(named: "o.png"), for: UIControlState())
                label.text = "X 's turn!"
                label.textColor = UIColor(red: 128/255, green: 0, blue: 0, alpha: 1.0)
                player *= -1
                whoWin(sender.tag, player)
                draw()
            }
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        canPlay = true
        player = -1
        clearOX()
        label.text = nil
        oxStatus = [2,3,4,5,6,7,8,9,10]
        label.backgroundColor = UIColor.white
        label.textColor = UIColor(red: 0, green: 0, blue: 128/255, alpha: 1.0)
        label.text = "O 's turn!"
    }
    
    func whoWin(_ index:Int, _ value:Int){
        oxStatus[index - 1] = value
        for i in winStatus{
            if oxStatus[i[0]] == oxStatus[i[1]] && oxStatus[i[1]] == oxStatus[i[2]]{
                if player == -1{
                    label.backgroundColor = UIColor(red: 128/255, green: 0, blue: 0, alpha: 1.0)
                    label.textColor = UIColor.white
                    label.text = "X WIN!"
                    winColor(i)
                    canPlay = false
                }else if player == 1{
                    label.backgroundColor = UIColor(red: 0, green: 0, blue: 128/255, alpha: 1.0)
                    label.textColor = UIColor.white
                    label.text = "O WIN!"
                    winColor(i)
                    canPlay = false
                }
            }
        }
    }
    
    func draw(){
        let nowStatus = Set(oxStatus)
        if label.text == "O 's turn!" || label.text == "X 's turn!"{
            if nowStatus.count == 2{
                label.backgroundColor = UIColor.gray
                label.textColor = UIColor.white
                label.text = "Draw!"
            }
        }
    }
    
    func clearOX(){
        btn1.setImage(nil, for: UIControlState())
        btn2.setImage(nil, for: UIControlState())
        btn3.setImage(nil, for: UIControlState())
        btn4.setImage(nil, for: UIControlState())
        btn5.setImage(nil, for: UIControlState())
        btn6.setImage(nil, for: UIControlState())
        btn7.setImage(nil, for: UIControlState())
        btn8.setImage(nil, for: UIControlState())
        btn9.setImage(nil, for: UIControlState())
        btn1.backgroundColor = UIColor.white
        btn2.backgroundColor = UIColor.white
        btn3.backgroundColor = UIColor.white
        btn4.backgroundColor = UIColor.white
        btn5.backgroundColor = UIColor.white
        btn6.backgroundColor = UIColor.white
        btn7.backgroundColor = UIColor.white
        btn8.backgroundColor = UIColor.white
        btn9.backgroundColor = UIColor.white
    }
    
    func winColor(_ n:[Int]){
        for number in n{
            switch number{
            case 0:
                btn1.backgroundColor = UIColor.lightGray
            case 1:
                btn2.backgroundColor = UIColor.lightGray
            case 2:
                btn3.backgroundColor = UIColor.lightGray
            case 3:
                btn4.backgroundColor = UIColor.lightGray
            case 4:
                btn5.backgroundColor = UIColor.lightGray
            case 5:
                btn6.backgroundColor = UIColor.lightGray
            case 6:
                btn7.backgroundColor = UIColor.lightGray
            case 7:
                btn8.backgroundColor = UIColor.lightGray
            case 8:
                btn9.backgroundColor = UIColor.lightGray
            default:
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

