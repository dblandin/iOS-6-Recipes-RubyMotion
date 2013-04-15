class BIDDatePickerViewController < UIViewController
  attr_accessor :datePicker

  def buttonPressed
    selected = datePicker.date
    message = "The date and time you selected is: #{selected}"

    alert = UIAlertView.alloc.initWithTitle('Data and Time Selected',
                                            message: message,
                                            delegate: nil,
                                            cancelButtonTitle: 'Yes, I did.',
                                            otherButtonTitles: nil)
    alert.show
  end

  def viewDidLoad
    super

    now = NSDate.date
    datePicker.setDate(now, animated: false)
  end

  def viewDidUnload
    self.datePicker = nil
  end

  def shouldAutorotateToInterfaceOrientation(interface_orientation)
    interfaceOrientation === UIInterfaceOrientationPortrait
  end
end
