class ViewController < UIViewController
  attr_accessor :nameField,:numberField, :sliderLabel, :leftSwitch, :rightSwitch, :doSomethingButton

  def viewDidLoad
    super

    button_image_normal = UIImage.imageNamed('whiteButton')
    stretchable_button_image_normal = button_image_normal.stretchableImageWithLeftCapWidth(12, topCapHeight: 0)
    doSomethingButton.setBackgroundImage(stretchable_button_image_normal, forState: UIControlStateNormal)

    button_image_pressed = UIImage.imageNamed('blueButton')
    stretchable_button_image_pressed = button_image_pressed.stretchableImageWithLeftCapWidth(12, topCapHeight: 0)
    doSomethingButton.setBackgroundImage(stretchable_button_image_pressed, forState: UIControlStateHighlighted)
  end

  def viewDidUnload
    [nameField, numberField, sliderLabel, leftSwitch, rightSwitch, doSomethingButton].each do |outlet|
      outlet = nil
    end

    super
  end

  def shouldAutorotateToInterfaceOrientation(interface_orientation)
    interface_orientation != UIInterfaceOrientationPortraitUpsideDown
  end

  def textFieldDoneEditing(sender)
    sender.resignFirstResponder
  end

  def backgroundTap(sender)
    nameField.resignFirstResponder
    numberField.resignFirstResponder
  end

  def sliderChanged(sender)
    slider = sender

    progress = slider.value.to_i

    sliderLabel.text = progress.to_s
  end

  def switchChanged(sender)
    whichSwitch = sender

    setting = whichSwitch.isOn

    leftSwitch.setOn(setting, animated: true)
    rightSwitch.setOn(setting, animated: true)
  end

  def toggleControls(sender)
    if sender.selectedSegmentIndex === 0
      leftSwitch.hidden = false
      rightSwitch.hidden = false
      doSomethingButton.hidden = true
    else
      leftSwitch.hidden = true
      rightSwitch.hidden = true
      doSomethingButton.hidden = false
    end
  end

  def buttonPressed(sender)
    action_sheet = UIActionSheet.alloc.initWithTitle('Are you sure?', delegate: self,
                                                             cancelButtonTitle: 'No Way!',
                                                        destructiveButtonTitle: "Yes, I'm sure!",
                                                             otherButtonTitles: nil)
    action_sheet.showInView(view)
  end

  def actionSheet(action_sheet, didDismissWithButtonIndex: button_index)
    if button_index != action_sheet.cancelButtonIndex
      if nameField.text.length > 0
        msg = "You can breathe easy, #{nameField.text}, everything went OK."
      else
        msg = 'You can breathe easy, everything went OK.'
      end

      alert = UIAlertView.alloc.initWithTitle('Something was done', message: msg,
                                                                    delegate: self,
                                                           cancelButtonTitle: 'Phew!',
                                                           otherButtonTitles: nil)
      alert.show
    end
  end
end
