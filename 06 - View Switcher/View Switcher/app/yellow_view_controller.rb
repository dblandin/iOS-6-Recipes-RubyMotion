class YellowViewController < UIViewController
  def yellowButtonPressed
    alert = UIAlertView.alloc.initWithTitle('Yellow View Button Pressed',
                                            message: 'You pressed the button on the yellow view',
                                           delegate: nil,
                                  cancelButtonTitle: 'Yep, I did',
                                  otherButtonTitles: nil)
    alert.show
  end

  def shouldAutorotateToInterfaceOrientation(interface_orientation)
    interfaceOrientation === UIInterfaceOrientationPortrait
  end
end
