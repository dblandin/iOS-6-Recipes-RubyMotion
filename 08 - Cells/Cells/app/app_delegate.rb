class AppDelegate
  attr_accessor :window, :view_controller

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    self.window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view_controller = ViewController.alloc.initWithNibName('view_controller', bundle: nil)

    window.rootViewController = view_controller
    window.makeKeyAndVisible

    true
  end
end
