//
//  MoveableViewViewController.swift
//  GestureRecognizers
//
//  Created by Liam Elmore on 06/02/2019.
//  Copyright © 2019 Step Into Swift. All rights reserved.
//

import Foundation
import UIKit

class MovabableItemViewController: UIViewController {
    static func fromStoryBoard(at point: CGPoint) -> MovabableItemViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "moveableItem") as! MovabableItemViewController

        viewController.view.frame = CGRect(origin: point, size: CGSize(width: 200, height: 200))

        return viewController
    }

//    private func addBackgroundGestureRecognizer() {
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MovabableItemViewController.handleTap(sender:)))
//        tapGestureRecognizer.delegate = self
//        view.addGestureRecognizer(tapGestureRecognizer)
//    }

    override func viewWillAppear(_ animated: Bool) {
        addGestureRecognizers()
    }



    public func addGestureRecognizers() {
        print("addGestureRecognizers")
        addTapGestureRecognizer()
//        addPanGestureRecongizerToView()
//        addLongPressGestureRecognizerToView()
//        addRotateGestureRecongizerToView()
//        addPinchGestureRecongizerToView()
    }

    private func addTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MovabableItemViewController.handleTap(sender:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func handleTap(sender: UITapGestureRecognizer) {
        print("handleTap inside MovableItemViewController")
    }

    private func addPanGestureRecongizerToView() {
        print("addPanGestureRecongizerToView")
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(MovabableItemViewController.handlePan(sender:)))
        panGestureRecognizer.delegate = self
        view.addGestureRecognizer(panGestureRecognizer)
    }

    private func addLongPressGestureRecognizerToView() {
        print("addLongPressGestureRecognizerToView")
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(MovabableItemViewController.handleLongPress(sender:)))
        longPressGestureRecognizer.delegate = self
        view.addGestureRecognizer(longPressGestureRecognizer)
    }

    private func addPinchGestureRecongizerToView() {
        print("addPinchGestureRecongizerToView")
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(MovabableItemViewController.handlePinch(sender:)))
        pinchGestureRecognizer.delegate = self
        view.addGestureRecognizer(pinchGestureRecognizer)
    }

    private func addRotateGestureRecongizerToView() {
        print("addRotateGestureRecongizerToView")
        let rotateGestureRecongizer = UIRotationGestureRecognizer(target: self, action: #selector(MovabableItemViewController.handleRotation(sender:)))
        rotateGestureRecongizer.delegate = self
        view.addGestureRecognizer(rotateGestureRecongizer)
    }

    @objc private func handlePan(sender: UIPanGestureRecognizer) {
        print("handlePan")

        let currentView = sender.view!
        let translation = sender.translation(in: view)

        switch sender.state {
        case .began, .changed:
            currentView.center = CGPoint(x: currentView.center.x + translation.x, y: currentView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        default:
            break
        }
    }

    @objc private func handlePinch(sender: UIPinchGestureRecognizer) {
        print("handlePinch")

        switch sender.state {
        case .began, .changed:
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1.0
        default:
            break
        }
    }

    @objc private func handleRotation(sender: UIRotationGestureRecognizer) {
        print("handleRotation")

        switch sender.state {
        case .began, .changed:
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        default:
            break
        }
    }

    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        print("handleLongPress")

        view.removeFromSuperview()
    }
}

extension MovabableItemViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith _: UIGestureRecognizer) -> Bool {
        return true
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("Touch MovabableItemViewController")
        return true
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive press: UIPress) -> Bool {
        print("Press MovabableItemViewController")
        return true
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        print("shouldBegin MovabableItemViewController")
        return true
    }
}
