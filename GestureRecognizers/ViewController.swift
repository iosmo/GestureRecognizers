import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addViewAtPoint(point: CGPoint(x: 100, y: 100))
    }

    private func addViewAtPoint(point: CGPoint) {
        let movableItemViewController = MovabableItemViewController.fromStoryBoard(at: point)

        // Try and remove as many top level views as you can in our real project
        addChild(movableItemViewController)
        view.addSubview(movableItemViewController.view)
        movableItemViewController.didMove(toParent: self)
    }
}
