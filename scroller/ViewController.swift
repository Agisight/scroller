//
//  ViewController.swift
//  scroller
//
//  Created by Smart Block Lab on 28/03/2019.
//  Copyright © 2019 Smart Block Laboratory. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet var btns: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.delegate = self
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        methodAnimation()
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        methodAnimation()
    }
    
    func methodAnimation() {
        if btns.count == 0 {return}
        
        var i = 0
        // i – calculate it, it is your visible/desirable view.
        // here is variant of code
        let dragOffset = view.frame.width * 0.5 // callibrate it for you
        let offX = scroll.contentOffset.x
        i = Int(offX + dragOffset) / Int(view.frame.width)
        
        i = max(0, min(i, btns.count - 1))
        let yourX = btns[i].frame.width * CGFloat(i) // ()
        let p = CGPoint(x: yourX, y: 0);
        scroll.setContentOffset(p, animated: true)
    }
}

