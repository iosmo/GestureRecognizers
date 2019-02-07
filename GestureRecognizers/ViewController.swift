import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!

    private var colours: [UIColor] = [.red, .green, .blue, .orange, .black, .gray]

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundGestureRecognizer()

        addViewAtPoint(point: CGPoint(x: 100, y: 100))
    }

    private func addBackgroundGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(sender:)))
        tapGestureRecognizer.delegate = self
        backgroundView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func handleTap(sender: UITapGestureRecognizer) {
        let tapPoint = sender.location(in: backgroundView)
        let _ = addViewAtPoint(point: tapPoint)

        //addGestureRecognizersToView(newView)
    }

    private func addGestureRecognizersToView(_ newView: UIView) {
//        addPanGestureRecongizerToView(view: newView)
//        addLongPressGestureRecognizerToView(view: newView)
//        addRotateGestureRecongizerToView(view: newView)
//        addPinchGestureRecongizerToView(view: newView)
    }

//    private func addPanGestureRecongizerToView(view: UIView) {
//        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
//        panGestureRecognizer.delegate = self
//        view.addGestureRecognizer(panGestureRecognizer)
//    }
//
//    private func addLongPressGestureRecognizerToView(view: UIView) {
//        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.handleLongPress(sender:)))
//        view.addGestureRecognizer(longPressGestureRecognizer)
//    }
//
//    private func addPinchGestureRecongizerToView(view: UIView) {
//        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.handlePinch(sender:)))
//        pinchGestureRecognizer.delegate = self
//        view.addGestureRecognizer(pinchGestureRecognizer)
//    }
//
//    private func addRotateGestureRecongizerToView(view: UIView) {
//        let rotateGestureRecongizer = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.handleRotation(sender:)))
//        rotateGestureRecongizer.delegate = self
//        view.addGestureRecognizer(rotateGestureRecongizer)
//    }
//
//    @objc private func handlePan(sender: UIPanGestureRecognizer) {
//        let currentView = sender.view!
//        let translation = sender.translation(in: view)
//
//        switch sender.state {
//        case .began, .changed:
//            currentView.center = CGPoint(x: currentView.center.x + translation.x, y: currentView.center.y + translation.y)
//            sender.setTranslation(CGPoint.zero, in: view)
//        default:
//            break
//        }
//    }
//
//    @objc private func handlePinch(sender: UIPinchGestureRecognizer) {
//        switch sender.state {
//        case .began, .changed:
//            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
//            sender.scale = 1.0
//        default:
//            break
//        }
//    }
//
//    @objc private func handleRotation(sender: UIRotationGestureRecognizer) {
//        switch sender.state {
//        case .began, .changed:
//            sender.view?.transform = sender.view!.transform.rotated(by: sender.rotation)
//            sender.rotation = 0
//        default:
//            break
//        }
//    }
//
//    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
//        sender.view!.removeFromSuperview()
//    }

    private func addViewAtPoint(point: CGPoint) -> UIView {
        let movableItemViewController = MovabableItemViewController.fromStoryBoard(at: point)
        backgroundView.addSubview(movableItemViewController.view)
        return movableItemViewController.view
    }
}

extension ViewController: UIGestureRecognizerDelegate {
//    func gestureRecognizer(_: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith _: UIGestureRecognizer) -> Bool {
//        return true
//    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("Touch ViewController")

        return false
    }
}
