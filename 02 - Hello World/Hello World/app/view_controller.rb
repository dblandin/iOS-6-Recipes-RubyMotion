class ViewController < UIViewController
  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown
  end
end
