import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = NSRect(x: 0, y: 0, width: 400, height: 600)
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
    self.setContentSize(NSSize(width: 400, height: 600))
    self.styleMask.remove(.resizable)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
