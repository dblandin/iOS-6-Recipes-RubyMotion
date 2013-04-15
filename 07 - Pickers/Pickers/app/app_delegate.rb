class AppDelegate
  attr_accessor :window, :rootController

  def application(application, didFinishLaunchingWithOptions: launch_options)
    self.window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    NSBundle.mainBundle.loadNibNamed('tab_bar_controller', owner: self, options: nil)

    window.addSubview(rootController.view)
    window.BackgroundColor = UIColor.whiteColor
    window.makeKeyAndVisible

    true
  end
end
