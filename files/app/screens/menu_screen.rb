class MenuScreen < UIViewController
  def init
    super.tap do
      self.title = 'Menu'
      @layout = MenuScreenLayout.new
    end
  end

  def loadView
    self.view = @layout.view
    @layout.add_constraints
  end

end
