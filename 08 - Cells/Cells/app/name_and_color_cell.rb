class BIDNameAndColorCell < UITableViewCell
  attr_accessor :name, :color, :nameLabel, :colorLabel

  def name=(other)
    unless other === name
      instance_variable_set(:@name, other)
      nameLabel.text = other
    end
  end

  def color=(other)
    unless other === color
      instance_variable_set(:@color, other)
      colorLabel.text = other
    end
  end
end
