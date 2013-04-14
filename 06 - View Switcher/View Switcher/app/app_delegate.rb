class AppDelegate
  attr_accessor :window, :switch_view_controller

  def application(application, didFinishLaunchingWithOptions: launch_options)
    self.window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.switch_view_controller = SwitchViewController.alloc.initWithNibName('switch_view', bundle: nil)

    switch_view = switch_view_controller.view

    switch_view_frame = switch_view.frame
    switch_view_frame.origin.y += UIApplication.sharedApplication.statusBarFrame.size.height

    switch_view.frame = switch_view_frame

    window.addSubview(switch_view)
    window.backgroundColor = UIColor.whiteColor

    window.rootViewController = switch_view_controller
    window.makeKeyAndVisible

    true
  end
end
