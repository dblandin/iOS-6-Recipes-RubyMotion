class BIDCustomPickerViewController < UIViewController
  attr_accessor :picker, :winLabel, :column0, :column1, :column2, :column3, :column4, :column5, :button

  def showButton
    button.hidden = false
  end

  def playWinSound
    path = NSBundle.mainBundle.pathForResource('win', ofType: 'wav')

    soundID = Pointer.new('I')
    AudioServicesCreateSystemSoundID(NSURL.fileURLWithPath(path), soundID)

    winLabel.text = 'WIN!'
    performSelector('showButton', withObject: nil, afterDelay: 1.5)
  end

  def spin
    win = false;
    num_in_row = 1
    last_val = -1

    for index in 1...5 do
      new_value = Random.new.rand % column1.count

      if new_value === last_val
        num_in_row += 1
      else
        num_in_row = 1
      end

      last_val = new_value
      picker.selectRow(new_value, inComponent: index, animated: true)
      picker.reloadComponent(index)

      win = true if num_in_row >= 3
    end

    button.hidden = true
    path = NSBundle.mainBundle.pathForResource('crunch', ofType: 'wav')

    soundID = Pointer.new('I')
    AudioServicesCreateSystemSoundID(NSURL.fileURLWithPath(path), soundID)
    AudioServicesPlaySystemSound(soundID.cast!('I'))

    if win
      performSelector('playWinSound', withObject: nil, afterDelay: 0.5)
    else
      performSelector('showButton', withObject: nil, afterDelay: 0.5)
    end

    winLabel.text = ''

    Random.srand
  end

  def viewDidLoad
    super

    for index in 0..5 do
      image_names = ['seven', 'bar', 'crown', 'cherry', 'lemon', 'apple']
      images = image_names.map { |name| UIImage.imageNamed(name) }
      image_views = images.map { |image| UIImageView.alloc.initWithImage(image) }

      setValue(image_views, forKey: "column#{index}")
    end
  end

  def viewDidUnload
    super

    [picker, winLabel, column0, column1, column2, column3, column4, column5].each do |outlet|
      self.outlet = nil
    end
  end

  def shouldAutorotateToInterfaceOrientation(interface_orientation)
    interfaceOrientation === UIInterfaceOrientationPortrait
  end

  def numberOfComponentsInPickerView(picker_view)
    5
  end

  def pickerView(picker_view, numberOfRowsInComponent: component)
    column1.count
  end

  def pickerView(picker_view, viewForRow: row, forComponent: component, reusingView: view)
    array_name = "column#{component + 1}"
    array = valueForKey(array_name)

    array.objectAtIndex(row)
  end
end
