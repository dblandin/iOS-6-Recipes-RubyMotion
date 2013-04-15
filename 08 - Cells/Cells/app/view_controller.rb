class ViewController < UIViewController
  attr_accessor :computers

  def viewDidLoad
    super

    row1 = { 'Name' => 'MacBook Air', 'Color' => 'Silver' }
    row2 = { 'Name' => 'MacBook Pro', 'Color' => 'Silver' }
    row3 = { 'Name' => 'iMac', 'Color' => 'Silver' }
    row4 = { 'Name' => 'Mac Mini', 'Color' => 'Silver' }
    row5 = { 'Name' => 'Mac Pro', 'Color' => 'Silver' }

    self.computers = [row1, row2, row3, row4, row5]
  end

  def viewDidUnload
    self.computers = nil

    super
  end

  def shouldAutorotateToInterfaceOrientation(interface_orientation)
    interface_orientation != UIInterfaceOrientationPortraitUpsideDown
  end

  def tableView(table_view, numberOfRowsInSection: section)
    computers.count
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    cell_identifier = 'CellTableIdentifier'
    @@nibs_registered = false

    unless @@nibs_registered
     nib = UINib.nibWithNibName('name_and_color_cell', bundle: nil)
     table_view.registerNib(nib, forCellReuseIdentifier: cell_identifier)
     @@nibs_registered = true
    end

    cell = table_view.dequeueReusableCellWithIdentifier(cell_identifier)
    row = index_path.row
    row_data = computers[row]

    cell.name = row_data['Name']
    cell.color = row_data['Color']

    cell
  end

   def tableView(table_view, heightForRowAtIndexPath: index_path)
     65.0
   end
end
