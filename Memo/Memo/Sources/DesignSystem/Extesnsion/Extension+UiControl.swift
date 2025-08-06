//
//  Extension+UiControl.swift
//  Memo
//
//  Created by Wonji Suh  on 8/6/25.
//

import Foundation
import Combine
import UIKit

extension UIControl {
  func publisher(for event: UIControl.Event) -> UIControl.EventPublisher {
    return UIControl.EventPublisher(control: self, event: event)
  }

  struct EventPublisher: Publisher {
    typealias Output = Void
    typealias Failure = Never

    let control: UIControl
    let event: UIControl.Event

    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
      let subscription = EventSubscription(subscriber: subscriber, control: control, event: event)
      subscriber.receive(subscription: subscription)
    }

    private final class EventSubscription<S: Subscriber>: Subscription where S.Input == Void {
      private var subscriber: S?
      weak private var control: UIControl?

      init(subscriber: S, control: UIControl, event: UIControl.Event) {
        self.subscriber = subscriber
        self.control = control
        control.addTarget(self, action: #selector(eventHandler), for: event)
      }

      func request(_ demand: Subscribers.Demand) {}

      func cancel() {
        subscriber = nil
      }

      @objc private func eventHandler() {
        _ = subscriber?.receive(())
      }
    }
  }
}
