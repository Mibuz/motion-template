class DetailScreen < UIViewController

  def init
    super.tap do
      @layout = DetailScreenLayout.new
      self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAction, target:self, action: :share)
    end
  end

  def loadView
    self.view = @layout.view
    @layout.add_constraints
  end

  def share
    items = []
    safari_activity = TUSafariActivity.alloc.init
    whatsapp_activity = SSCWhatsAppActivity.alloc.init
    activity_controller = UIActivityViewController.alloc.initWithActivityItems(items, applicationActivities:[safari_activity, whatsapp_activity])
    activity_controller.excludedActivityTypes = [UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, UIActivityTypeAddToReadingList, UIActivityTypeAirDrop, UIActivityTypeMessage]
    self.presentViewController(activity_controller, animated: true, completion: nil)
  end
end
