//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 伊藤 奨真 on 2022/05/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    // 配列に指定するindex番号を宣言
        var nowIndex:Int = 0
    
    // スライドショーに使用するタイマーを宣言
        var timer: Timer!
    
    // スライドショーさせる画像の配列を宣言
       var imageArray:[UIImage] = [
           UIImage(named: "swift")!,
           UIImage(named: "kotlin")!,
           UIImage(named: "flutter")!
       ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imageBox = imageArray[0]
               
        imageView.image = imageBox
    }
    
    
    @IBAction func tapAction(_ sender: Any) {
    
       
    }
    
    
    @IBAction func slideShowButton(_ sender: Any) {
        //再生中か停止しているかを判定
        if (timer == nil){
            //再生時の処理を実装
            progressButton.isEnabled = false
            backButton.isEnabled = false
            //タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            //ボタンの名前を停止に変える時の処理
            startButton.setTitle("停止", for: .normal)
        }
        else{
            //停止時の処理を実装
            progressButton.isEnabled = true
            backButton.isEnabled = true
            //タイマーを停止する
            timer.invalidate()
            
            //タイマーを削除
            timer = nil
            
            //ボタンの名前を再生に直す
            startButton.setTitle("再生", for: .normal)
        }
    }
        
        @objc func changeImage() {
            //indexを増やして表示する画像を切り替える
            nowIndex += 1
            
            // indexが表示予定の画像の数と同じ場合
            if (nowIndex == imageArray.count){
                //indexを一番最初に戻す
                nowIndex = 0
            }
            // indexの画像をstoryboardの画像にセットする
            imageView.image = imageArray[nowIndex]
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        
            //indexを増やして表示する画像を切り替える
            nowIndex += 1
            
            // indexが表示予定の画像の数と同じ場合
            if (nowIndex == imageArray.count){
                //indexを一番最初に戻す
                nowIndex = 0
            }
            // indexの画像をstoryboardの画像にセットする
            imageView.image = imageArray[nowIndex]
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        
            //indexを増やして表示する画像を切り替える
            nowIndex -= 1
            
            // 最初の画像から戻るを押した場合
            if (nowIndex == -1){
                //indexを最後に戻す
                nowIndex = 2
            }
            // indexの画像をstoryboardの画像にセットする
            imageView.image = imageArray[nowIndex]
        
    }
    
    
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
       let resultViewController:ResultViewController = segue.destination as! ResultViewController
           
        if (timer == nil){
            resultViewController.image = imageArray[nowIndex]
        }
        else{
            progressButton.isEnabled = true
            backButton.isEnabled = true
            
            //タイマーを停止する
            timer.invalidate()
    
            //タイマーを削除
            timer = nil
            
            //ボタンの名前を再生に直す
            startButton.setTitle("再生", for: .normal)
            
            resultViewController.image = imageArray[nowIndex]
            
        }
            
           
      
   }
    
}

