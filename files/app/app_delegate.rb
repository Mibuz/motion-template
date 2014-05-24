class AppDelegate < PM::Delegate
  def on_load(app, options)
    start_reachability

    content = UINavigationController.alloc.initWithRootViewController(MasterScreen.alloc.init)

    menu = UINavigationController.alloc.initWithRootViewController(MenuScreen.alloc.init).tap do |n|
      n.navigationBar.translucent = false
    end

    open NVSlideMenuController.alloc.initWithMenuViewController(menu, andContentViewController: content)
  end

  def start_reachability
    reach = Reachability.reachabilityWithHostname("www.google.com")

    reach.reachableBlock = lambda { |info|
      @network_reachable = true
    }

    reach.unreachableBlock = lambda { |info|
      @network_reachable = false
    }

    reach.startNotifier
  end

  def network_reachable?
    @network_reachable
  end
end
