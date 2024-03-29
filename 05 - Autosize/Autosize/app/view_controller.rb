class ViewController < UIViewController
  attr_accessor :buttonUL, :buttonUR, :buttonL, :buttonR, :buttonLL, :buttonLR

  def viewDidUnload
    [buttonUL, buttonUR, buttonL, buttonR, buttonLL, buttonLR].each do |outlet|
      outlet = nil
    end
  end

  def shouldAutorotateToInterfaceOrientation(interface_orientation)
    interface_orientation != UIInterfaceOrientationPortraitUpsideDown
  end

  def willAnimateRotationToInterfaceOrientation(interface_orientation, duration: duration)
    if interface_orientation === UIInterfaceOrientationPortrait
      buttonUL.frame = CGRectMake(20, 20, 125, 125)
      buttonUR.frame = CGRectMake(175, 20, 125, 125)
      buttonL.frame  = CGRectMake(20, 168, 125, 125)
      buttonR.frame  = CGRectMake(175, 168, 125, 125)
      buttonLL.frame = CGRectMake(20, 315, 125, 125)
      buttonLR.frame = CGRectMake(175, 315, 125, 125)
    else
      buttonUL.frame = CGRectMake(20, 20, 125, 125)
      buttonUR.frame = CGRectMake(328, 20, 125, 125)
      buttonL.frame  = CGRectMake(177, 20, 125, 125)
      buttonR.frame  = CGRectMake(177, 155, 125, 125)
      buttonLL.frame = CGRectMake(20, 155, 125, 125)
      buttonLR.frame = CGRectMake(328, 155, 125, 125)
    end
  end
end
