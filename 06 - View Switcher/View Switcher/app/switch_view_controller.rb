class SwitchViewController < UIViewController
  attr_accessor :yellow_view_controller, :blue_view_controller

  def didReceiveMemoryWarning
    if blue_view_controller.view.superview.nil?
      self.blue_view_controller = nil
    else
      self.yellow_view_controller = nil
    end
  end

  def viewDidLoad
    super

    self.blue_view_controller = BlueViewController.alloc.initWithNibName('blue_view', bundle: nil)
    view.insertSubview(blue_view_controller.view, atIndex: 0)
  end

  def shouldAutorotateToInterfaceOrientation(interface_orientation)
    interface_orientation === UIInterfaceOrientationPortrait
  end

  def switchViews(sender)
    UIView.beginAnimations('View Flip', context: nil)
    UIView.setAnimationDuration(1.25)
    UIView.setAnimationCurve(UIViewAnimationCurveEaseInOut)

    if yellow_view_controller.nil?
      self.yellow_view_controller = YellowViewController.alloc.initWithNibName('yellow_view', bundle: nil)

      UIView.setAnimationTransition(UIViewAnimationTransitionFlipFromRight, forView: view, cache: true)

      blue_view_controller.view.removeFromSuperview
      self.blue_view_controller = nil

      view.insertSubview(yellow_view_controller.view, atIndex: 0)
    else
      if blue_view_controller.nil?
        self.blue_view_controller = BlueViewController.alloc.initWithNibName('blue_view', bundle: nil)
      end

      UIView.setAnimationTransition(UIViewAnimationTransitionFlipFromLeft, forView: view, cache: true)

      yellow_view_controller.view.removeFromSuperview
      self.yellow_view_controller = nil

      view.insertSubview(blue_view_controller.view, atIndex: 0)
    end

    UIView.commitAnimations
  end
end
