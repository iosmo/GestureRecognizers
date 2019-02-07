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

    override func viewWillAppear(_ animated: Bool) {
        addGestureRecognizers()
    }

    public func addGestureRecognizers() {
        addPanGestureRecongizerToView()
        addLongPressGestureRecognizerToView()
        addRotateGestureRecongizerToView()
        addPinchGestureRecongizerToView()
    }

    private func addPanGestureRecongizerToView() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(MovabableItemViewController.handlePan(sender:)))
        panGestureRecognizer.delegate = self
        view.addGestureRecognizer(panGestureRecognizer)
    }

    private func addLongPressGestureRecognizerToView() {
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(MovabableItemViewController.handleLongPress(sender:)))
        longPressGestureRecognizer.delegate = self
        view.addGestureRecognizer(longPressGestureRecognizer)
    }

    private func addPinchGestureRecongizerToView() {
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(MovabableItemViewController.handlePinch(sender:)))
        pinchGestureRecognizer.delegate = self
        view.addGestureRecognizer(pinchGestureRecognizer)
    }

    private func addRotateGestureRecongizerToView() {
        let rotateGestureRecongizer = UIRotationGestureRecognizer(target: self, action: #selector(MovabableItemViewController.handleRotation(sender:)))
        rotateGestureRecongizer.delegate = self
        view.addGestureRecognizer(rotateGestureRecongizer)
    }

    @objc private func handlePan(sender: UIPanGestureRecognizer) {
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
        switch sender.state {
        case .began, .changed:
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1.0
        default:
            break
        }
    }

    @objc private func handleRotation(sender: UIRotationGestureRecognizer) {
        switch sender.state {
        case .began, .changed:
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        default:
            break
        }
    }

    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {t
        view.removeFromSuperview()
    }
}

extension MovabableItemViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith _: UIGestureRecognizer) -> Bool {
        return true
    }
}
