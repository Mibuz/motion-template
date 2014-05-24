class DetailScreenLayout < MotionKit::Layout

  def layout
    background_color '#ffffff'.uicolor

    add UILabel, :example do
      text 'Example'
      text_color '#353535'.uicolor
      target.numberOfLines = 0
      font UIFont.fontWithName('Verdana', size: 16)
    end
  end

  def add_constraints
    constraints(:example) do
      top 10
      left 10
      width.equals(view).minus(20)
      height 50
    end
  end
end
