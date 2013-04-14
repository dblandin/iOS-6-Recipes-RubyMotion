class ViewController < UIViewController
  attr_accessor :portrait, :landscape, :foos, :bars

  def willAnimateRotationToInterfaceOrientation(interface_orientation, duration: duration)
    if (interface_orientation === UIInterfaceOrientationPortrait)
      self.view = portrait

      view.transform = CGAffineTransformIdentity
      view.transform = CGAffineTransformMakeRotation(degrees_to_radians(0))
      view.bounds    = CGRectMake(0.0, 0.0, 320.0, 460.0)
    elsif (interface_orientation === UIInterfaceOrientationLandscapeLeft)
      self.view = landscape

      view.transform = CGAffineTransformIdentity
      view.transform = CGAffineTransformMakeRotation(degrees_to_radians(-90))
      view.bounds    = CGRectMake(0.0, 0.0, 480.0, 300.0)
    elsif (interface_orientation == UIInterfaceOrientationLandscapeRight)
      self.view = landscape

      view.transform = CGAffineTransformIdentity
      view.transform = CGAffineTransformMakeRotation(degrees_to_radians(90))
      view.bounds    = CGRectMake(0.0, 0.0, 480.0, 300.0)
    end
  end

  def degrees_to_radians(degrees)
    Math::PI * degrees / 180.0
  end

  def viewDidUnload
    [portrait, landscape, foos, bars].each do |outlet|
      self.outlet = nil
    end
  end

  def buttonTapped(sender)
    if foos.include?(sender)
      message = 'Foo button pressed'
    else
      message = 'Bar button pressed'
    end

    alert = UIAlertView.alloc.initWithTitle(message, message: nil,
                                                    delegate: nil,
                                           cancelButtonTitle: 'Ok',
                                           otherButtonTitles: nil)
    alert.show

    if foos.include?(sender)
      foos.each { |button| button.hidden = true }
    else
      bars.each { |button| button.hidden = true }
    end
  end
end
