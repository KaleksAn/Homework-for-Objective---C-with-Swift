//
//  ViewController.swift
//  Homework_19
//
//  Created by Aleksandr Kan on 17.11.2021.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    
    var generalColor = UIColor()
    var boardView = UIView()
    var randomColor = UIColor()
    
    var coordinatesCollection = [CGRect]()
    var checkersCollection = [UIView]()
    
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
        
        self.generalColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.randomColor = color()
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
        createBoard(view: boardView, rectForCell: rectForCellFromBoard)
        
        print("\(coordinatesCollection.count)")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        changeColorCell()
        print("Bounds \(view.bounds)")
        changePosition()
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
                                       color: generalColor, alphaComponent: 1.0,
                                       superView: view, radius: nil)
                    if horizontal != 4 && horizontal != 5 {
                        addCheckersInBoard(on: horizontal, from: rawCell)
                        
                    }
                }
                randomCoordinateForChecker(from: rawCell)
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
    
    
    private func createRectForChecker(from subviews: CGRect) -> CGRect {
        let size = CGSize(width: subviews.width / 2, height: subviews.height / 2)
        let point = CGPoint(x: subviews.origin.x + (size.width / 2), y: subviews.origin.y + (size.height / 2))
        let checkRect = CGRect(x: point.x, y: point.y, width: size.width, height: size.height)
        return checkRect
    }

    private func addCheckersInBoard(on line: Int, from rect: CGRect) {
        
        let rectCkecker = createRectForChecker(from: rect)
        switch line {
            case 1, 2, 3:
                let checker = createView(from: rectCkecker,
                                         autoresizingMask: [ .flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin],
                                         color: .red, alphaComponent: DefaultViewProperty.alphaComponent,
                                         superView: self.boardView, radius: DefaultViewProperty.circleRadius)
                self.checkersCollection.append(checker)
            case 6, 7, 8:
                let checker = createView(from: rectCkecker,
                                         autoresizingMask: [ .flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin],
                                         color: .white, alphaComponent: DefaultViewProperty.alphaComponent,
                                         superView: self.boardView, radius: DefaultViewProperty.circleRadius)
                self.checkersCollection.append(checker)
            default:
                break
        }
    }
    
    private func randomCoordinateForChecker(from rect: CGRect) {
        let checkerCell = createRectForChecker(from: rect)
        coordinatesCollection.append(checkerCell)
    }
    
    
    //Change orientation and color
   private func changeColorCell() {
      
       for view in boardView.subviews {
           switch view {
               case _ where view.backgroundColor == generalColor:
                   view.backgroundColor = randomColor
               case _ where view.backgroundColor == randomColor:
                   view.backgroundColor = generalColor
               default:
                   continue
           }
       }
    }


    func color() -> UIColor {
        let colorsCollection = [#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1), #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1), #colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1), #colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1)]
        var index: Int {
            let number = arc4random_uniform(UInt32(colorsCollection.count))
            return Int(number)
        }
        return colorsCollection[index]
    }
    
    
    func changePosition() {
        
        for checker in self.boardView.subviews {
            for view in self.checkersCollection {
                let index = Int(arc4random_uniform(UInt32(coordinatesCollection.count)))
                let randomRect = coordinatesCollection[index]
                
                if checker.frame.origin == view.frame.origin {
                    checker.frame.origin.x = randomRect.origin.y
                    checker.frame.origin.y = randomRect.origin.x
                }
            
            }
        }
    }
    
    
}


struct DefaultViewProperty {
    static let alphaComponent = 1.0
    static let defaultCornerRadius = 0.0
    static let circleRadius = 25.0
}


