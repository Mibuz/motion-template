class MasterScreen < UITableViewController
  include Helpers

  CELL_IDENTIFIER = 'resource_cell'

  def init
    super.tap do
      # self.tableView.separatorColor = UIColor.clearColor
      # self.tableView.separatorInset = UIEdgeInsetsZero
      # self.tableView.separatorStyle = UITableViewCellSelectionStyleNone
      self.navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithImage('menu-icon.png'.uiimage, style:UIBarButtonItemStylePlain, target:self, action: :toogle_menu)
      @data = [1, 2, 3, 4, 5, 6]
    end
  end

  def viewDidLoad
    refreshControl = UIRefreshControl.alloc.init
    refreshControl.addTarget(self, action: :refresh, forControlEvents:UIControlEventValueChanged)
    self.refreshControl = refreshControl
  end

  def viewDidAppear(animated)
    load_data unless @data.any?
  end

  def viewDidUnload
   self.pullToRefreshView = nil
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @data.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    obj = @data[indexPath.row]
    cell = tableView.dequeueReusableCellWithIdentifier(CELL_IDENTIFIER)
    cell ||= UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELL_IDENTIFIER)
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    view = DetailScreen.alloc.init
    self.navigationController.pushViewController(view, animated:true)
  end

  def refresh
    if App.delegate.network_reachable?
      start_activity
      load_data
    else
      notify('Oops..', 'No internet available', :info)
      stop_activity
    end
    self.refreshControl.endRefreshing
  end

  def load_data
    ApiService.new.fetch do |success|
      if success
        @data = Model::Base.all
        self.tableView.reloadData
        stop_activity
      else
        notify('Oops..', 'Server error', :error)
        stop_activity
      end
    end
  end

  def toogle_menu
    self.navigationController.slideMenuController.toggleMenuAnimated(true)
  end

end
