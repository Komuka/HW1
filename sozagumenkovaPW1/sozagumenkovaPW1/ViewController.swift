//
//  ViewController.swift
//  sozagumenkovaPW1
//
//
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setRandomCornerRadius()
        getUniqueColors()
    }

    @IBAction func buttonWasPressed(_ sender: Any) {
        setRandomCornerRadius()
        getUniqueColors()
        text.font = UIFont.systemFont(ofSize: CGFloat.random(in: 5...120))
    }

    func getUniqueColors() {
        var colors = [UIColor]()
        colors.append(view1.backgroundColor ?? .clear)
        colors.append(view2.backgroundColor ?? .clear)
        colors.append(view3.backgroundColor ?? .clear)

        var uniqueColors = [UIColor]()

        while uniqueColors.count < 3 {
            let randomColor = UIColor.random()

            if !uniqueColors.contains(randomColor) && !colors.contains(randomColor) {
                uniqueColors.append(randomColor)
            }
        }

        UIView.animate(withDuration: 0.5) {
            self.view1.backgroundColor = uniqueColors[0]
            self.view2.backgroundColor = uniqueColors[1]
            self.view3.backgroundColor = uniqueColors[2]

        }
    }

    func setRandomCornerRadius() {
        var uniqueCornerRadius = [CGFloat]()

        while uniqueCornerRadius.count < 3 {
            let randomCornerRadius = CGFloat.random(in: 0...100)

            if !uniqueCornerRadius.contains(randomCornerRadius) {
                uniqueCornerRadius.append(randomCornerRadius)
            }
        }

        UIView.animate(withDuration: 0.5, animations: {
            self.button.isEnabled = false
            self.view1.layer.cornerRadius = uniqueCornerRadius[0]
            self.view2.layer.cornerRadius = uniqueCornerRadius[1]
            self.view3.layer.cornerRadius = uniqueCornerRadius[2]
        }, completion: {_ in self.button.isEnabled = true})
    }

}
