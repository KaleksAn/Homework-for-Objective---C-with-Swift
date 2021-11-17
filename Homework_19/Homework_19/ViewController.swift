//
//  ViewController.swift
//  Homework_19
//
//  Created by Aleksandr Kan on 17.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var boardView = UIView()
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        var center: CGFloat {
            return CGFloat((self.view.bounds.height / 2) - self.view.bounds.width / 2)
        }
        
        let rectForBoard = CGRect(x: 0, y: center, width: self.view.bounds.width, height: self.view.bounds.width)
        boardView = createView(from: rectForBoard,
                                   autoresizingMask: [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin],
                                   color: .gray,
                                   alphaComponent: 0.5,
                                   superView: self.view, radius: nil)
        
        let rectForCellFromBoard = rect(from: boardView, smaller: 8.0)
        
        
        
        //last change
        createBoard(view: boardView, rectForCell: rectForCellFromBoard)
       
        let whiteChess = createRectForChess(from: boardView.subviews)
        let blackChess = createRectForChess(from: boardView.subviews.reversed())
        create(chessFrom: whiteChess, with: .white, for: boardView)
        create(chessFrom: blackChess, with: .red, for: boardView)
        print("Size \(self.view.bounds.size)")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        changeColorCell()
        print("Bounds \(view.bounds)")
        
    }
    
    override func viewWillLayoutSubviews() {
        
    }
    
    //MARK: My Methods
    private func createView(from rect: CGRect, autoresizingMask: UIView.AutoresizingMask, color: UIColor, alphaComponent: CGFloat?, superView: UIView, radius: CGFloat?) -> UIView {
        var innerAlphaComponent: CGFloat {
            return alphaComponent != nil ? alphaComponent! : 1.0
        }
        
        let view = UIView(frame: rect)
        view.backgroundColor = color.withAlphaComponent(innerAlphaComponent)
        view.autoresizingMask = autoresizingMask
        //superView.insertSubview(view, at: 0)
        view.layer.cornerRadius = radius ?? 0.0
        superView.addSubview(view)
        return view
    }

    
    private func rect(from view: UIView, smaller size: CGFloat) -> CGRect {
        var rect = CGRect()
        rect.size.width = view.bounds.width / size
        rect.size.height = view.bounds.height / size
        rect.origin.x = 0.0
        rect.origin.y = 0.0
        
        return rect
    }
    
   private func createBoard(view: UIView, rectForCell: CGRect) {
        var rawCell = rectForCell
        
        for horizontal in 1...8 {
            for vertical in 1...8 {
                if horizontal % 2 != vertical % 2 {
                   let _ = createView(from: rawCell,
                                       autoresizingMask: [ .flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin],
                                       color: .black, alphaComponent: 1.0,
                                       superView: view, radius: nil)
                }
                rawCell.origin.x = CGFloat(rawCell.size.width * CGFloat(vertical))
            }
            
            if horizontal % 2 == 0 {
                rawCell.origin.x = CGFloat(rectForCell.size.width)
            } else {
                rawCell.origin.x = 0
            }
            
            rawCell.origin.y = CGFloat(rawCell.origin.y + rectForCell.size.width)
            
        }
    }
    
    
    //Change orientation and color Functions
   private func changeColorCell() {
       
       for view in boardView.subviews {
           switch view {
               case _ where view.backgroundColor == .black:
                   view.backgroundColor = .green
               case _ where view.backgroundColor == .green:
                   view.backgroundColor = .black
               default:
                   continue
           }
       }
    }

    
    func createRectForChess(from subviews: [UIView]) -> [CGRect] {
        var newArray = [CGRect]()
        for forward in subviews.startIndex...11 {
            
            let size = CGSize(width: subviews[forward].bounds.width / 2, height: subviews[forward].bounds.height / 2)
            let point = CGPoint(x: subviews[forward].frame.origin.x + (size.width / 2), y: subviews[forward].frame.origin.y + (size.height / 2))
            let viewRect = CGRect(x: point.x, y: point.y, width: size.width, height: size.height)
            newArray.append(viewRect)
            
        }
        
        return newArray
    }

    func create(chessFrom array: [CGRect], with color: UIColor, for superView: UIView ) {
        for view in array {
            let _ = createView(from: view,
                               autoresizingMask: [.flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin],
                               color: color,
                               alphaComponent: 1.0,
                               superView: superView, radius: 25.0)
        }
    }
    
    
    func changecoordinate() {
        for view in boardView.subviews {
            let timeCapsule = view
            view.frame.origin.x = timeCapsule.frame.origin.y
            view.frame.origin.y = timeCapsule.frame.origin.x
        }
    }
    
    
}


