class MenuScreenLayout < MotionKit::Layout

  def layout
    background_color '#eeeeee'.uicolor

    add UIView, :example do
      background_color '#dddddd'.uicolor
    end
  end

  def add_constraints
    constraints(:example) do
      top 10
      left 10
      width.equals(view)
      height 50
    end
  end
end
