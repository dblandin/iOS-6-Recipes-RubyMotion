class ViewController < UIViewController
  attr_accessor :names, :keys

  def viewDidLoad
    super

    path = NSBundle.mainBundle.pathForResource('sortednames', ofType: 'plist')
    dict = NSDictionary.alloc.initWithContentsOfFile(path)

    self.names = dict

    array = names.keys.sort!
    self.keys = array
  end

  def viewDidUnload
    self.names = nil
    self.keys = nil

    super
  end

  def shouldAutorotateToInterfaceOrientation(interface_orientation)
    interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown
  end

  def numberOfSectionsInTableView(table_view)
    keys.count
  end

  def tableView(table_view, numberOfRowsInSection: section)
    key = keys[section]
    name_section = names[key]

    name_section.count
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    section = index_path.section
    row = index_path.row

    key = keys[section]
    name_section = names[key]

    @@sections_table_identifier = 'SectionsTableIdentifier'
    cell = table_view.dequeueReusableCellWithIdentifier(@@sections_table_identifier)

    unless cell
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @@sections_table_identifier)
    end
    cell.textLabel.text = name_section[row]

    cell
  end

  def tableView(table_view, titleForHeaderInSection: section)
    key = keys[section]

    key
  end

  def sectionIndexTitlesForTableView(table_view)
    keys
  end
end
