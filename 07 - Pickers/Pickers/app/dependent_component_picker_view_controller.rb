class BIDDependentComponentPickerViewController < UIViewController
  attr_accessor :picker, :stateZips, :states, :zips
  STATE_COMPONENT = 0
  ZIP_COMPONENT = 1

  def buttonPressed
    state_row = picker.selectedRowInComponent(STATE_COMPONENT)
    zip_row = picker.selectedRowInComponent(ZIP_COMPONENT)

    state = states[state_row]
    zip = zips[zip_row]

    title = "You selected zip code #{zip}"
    message = "#{zip} is in #{state}"

    alert = UIAlertView.alloc.initWithTitle(title, message: message,
                                                  delegate: nil,
                                         cancelButtonTitle: 'OK',
                                         otherButtonTitles: nil)
    alert.show
  end

  def viewDidLoad
    super

    bundle = NSBundle.mainBundle
    plistURL = bundle.URLForResource('statedictionary', withExtension: 'plist')
    dictionary = NSDictionary.dictionaryWithContentsOfURL(plistURL)
    self.stateZips = dictionary

    components = stateZips.keys
    sorted = components.sort!
    self.states = sorted

    selected_state = states.objectAtIndex(0)
    array = stateZips.objectForKey(selected_state)
    self.zips = array
  end

  def viewDidUnload
    [picker, stateZips, states, zips].each do |outlet|
      self.outlet = nil
    end

    super
  end

  def shouldAutorotateToInterfaceOrientation(interface_orientation)
    interfaceOrientation === UIInterfaceOrientationPortrait
  end

  def numberOfComponentsInPickerView(picker_view)
    2
  end

  def pickerView(picker_view, numberOfRowsInComponent: component)
    if component === STATE_COMPONENT
      states.count
    else
      zips.count
    end
  end

  def pickerView(picker_view, titleForRow: row, forComponent: component)
    if component === STATE_COMPONENT
      states.objectAtIndex(row)
    else
      zips.objectAtIndex(row)
    end
  end

  def pickerView(picker_view, didSelectRow: row, inComponent: component)
    if component === STATE_COMPONENT
      selected_state = states[row]
      array = stateZips.objectForKey(selected_state)

      self.zips = array

      picker.selectRow(0, inComponent: ZIP_COMPONENT, animated: true)
      picker.reloadComponent(ZIP_COMPONENT)
    end
  end

  def pickerView(picker_view, widthForComponent: component)
    if component === ZIP_COMPONENT
      90
    else
      200
    end
  end
end
