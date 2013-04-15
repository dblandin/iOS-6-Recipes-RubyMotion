class BIDSingleComponentPickerViewController < UIViewController
  attr_accessor :singlePicker, :pickerData

  def buttonPressed
    row = singlePicker.selectedRowInComponent(0)
    selected = pickerData.objectAtIndex(row)
    title = "You selected #{selected}!"

    alert = UIAlertView.alloc.initWithTitle(title, message: 'Thank you for choosing',
                                                 delegate: nil,
                                                 cancelButtonTitle: "You're welcome",
                                                 otherButtonTitles: nil)
    alert.show
  end

  def viewDidLoad
    super

    self.pickerData = ['Luke', 'Leia', 'Han', 'Chewbacca', 'Artoo', 'Threepio', 'Lando']
  end

  def viewDidUnload
    [singlePicker, pickerData].each do |outlet|
      self.outlet = nil
    end

    super
  end

  def shouldAutorotateToInterfaceOrientation(interface_orientation)
    interface_orientation === UIInterfaceOrientationPortrait
  end

  def numberOfComponentsInPickerView(picker_view)
    1
  end

  def pickerView(picker_view, numberOfRowsInComponent: component)
    pickerData.count
  end

  def pickerView(picker_view, titleForRow: row, forComponent: component)
    pickerData.objectAtIndex(row)
  end
end
