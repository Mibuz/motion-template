module Helpers

  def notify(title, message, style)
    styles = {
      error: NZAlertStyleError,
      success: NZAlertStyleSuccess,
      info: NZAlertStyleInfo
    }

    alert = NZAlertView.alloc.initWithStyle(styles[style], title: title, message: message, delegate: nil)
    alert.setTextAlignment(NSTextAlignmentCenter)
    alert.show
  end

  def alert(title, message)
    alert = SIAlertView.alloc.initWithTitle(title, andMessage: message)
    alert.addButtonWithTitle('Ok', type:SIAlertViewButtonTypeDefault, handler: -> (alert) { p "Button1 Clicked" } )
    alert.show
  end

  def start_activity
    SVProgressHUD.setBackgroundColor(UIColor.clearColor)
    SVProgressHUD.setForegroundColor('#ffffff'.uicolor)
    SVProgressHUD.showWithMaskType(SVProgressHUDMaskTypeBlack)
    App.shared.setNetworkActivityIndicatorVisible(true)
  end

  def stop_activity
    SVProgressHUD.dismiss
    UIApplication.sharedApplication.setNetworkActivityIndicatorVisible(false)
  end
end
