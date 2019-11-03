// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
    let key = "FrameKey"
    
    override func awakeFromNib() {
        let flutterViewController = FlutterViewController.init()
        
        let data = UserDefaults.standard.data(forKey: key)
        let frame: NSRect
        if data == nil {
            frame = self.frame
        } else {
            frame = NSKeyedUnarchiver.unarchiveObject(with: data!) as! NSRect
        }
        
        self.contentViewController = flutterViewController
        setFrame(frame, display: true)
        
        RegisterGeneratedPlugins(registry: flutterViewController)
        
        NotificationCenter.default.addObserver(self, selector: #selector(windowWillClose(_:)), name: NSWindow.willCloseNotification, object: nil)
        super.awakeFromNib()
    }
    
    @objc func windowWillClose(_ notification: Notification) {
        let data = NSKeyedArchiver.archivedData(withRootObject: frame)
        UserDefaults.standard.set(data, forKey: key)
    }
}

