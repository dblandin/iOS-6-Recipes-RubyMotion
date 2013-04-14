class BlueViewController < UIViewController
  def blueButtonPressed
    alert = UIAlertView.alloc.initWithTitle('Blue View Button Pressed',
                                            message: 'You pressed the button on the blue view',
                                           delegate: nil,
                                  cancelButtonTitle: 'Yep, I did',
                                  otherButtonTitles: nil)
    alert.show
  end

  def shouldAutorotateToInterfaceOrientation(interface_orientation)
    interfaceOrientation === UIInterfaceOrientationPortrait
  end
end
