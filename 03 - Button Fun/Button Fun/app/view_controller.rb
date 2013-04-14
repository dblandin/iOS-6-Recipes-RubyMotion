class ViewController < UIViewController
  attr_accessor :statusText

  def viewDidUnload
    super

    statusText = nil
  end

  def buttonPressed(sender)
    title = sender.titleForState(UIControlStateNormal)
    statusText.text = "#{title} button pressed."
  end
end
