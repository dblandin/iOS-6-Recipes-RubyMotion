class BIDDoubleComponentPickerViewController < UIViewController
  attr_accessor :doublePicker, :fillingTypes, :breadTypes
  FILLING_COMPONENT =  0
  BREAD_COMPONENT = 1

  def buttonPressed
    filling_row = doublePicker.selectedRowInComponent(FILLING_COMPONENT)
    bread_row = doublePicker.selectedRowInComponent(BREAD_COMPONENT)

    bread = breadTypes.objectAtIndex(bread_row)
    filling = fillingTypes.objectAtIndex(filling_row)

    message = "Your #{filling} on #{bread} bread will be right up."

    alert = UIAlertView.alloc.initWithTitle('Thank you for your order', message: message,
                                                                       delegate: nil,
                                                              cancelButtonTitle: 'Great!',
                                                              otherButtonTitles: nil)
    alert.show
  end

  def viewDidLoad
    super

    self.fillingTypes = ['Ham', 'Turkey', 'Peanut Butter', 'Tuna Salad', 'Chicken Salad', 'Roast Beef', 'Vegemite']
    self.breadTypes = bread_array = ['White', 'Whole Wheat', 'Rye', 'Sourdough', 'Seven Grain']
  end

  def viewDidUnload
    [doublePicker, breadTypes, fillingTypes].each do |outlet|
      self.outlet = nil
    end

    super
  end

  def numberOfComponentsInPickerView(picker_view)
    2
  end

  def pickerView(picker_view, numberOfRowsInComponent: component)
    if component === BREAD_COMPONENT
      breadTypes.count
    else
      fillingTypes.count
    end
  end

  def pickerView(picker_view, titleForRow: row, forComponent: component)
    if component === BREAD_COMPONENT
      breadTypes.objectAtIndex(row)
    else
      fillingTypes.objectAtIndex(row)
    end
  end
end
