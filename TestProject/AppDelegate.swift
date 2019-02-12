//
//  AppDelegate.swift
//  TestProject
//
//  Created by Archimedes Angeles on 26/1/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
      //  UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
       //     print("granted: \(granted)")
        //}
        
        self.setupPushNitification(application: application)
        
        return true
    }
    
    func setupPushNitification(application: UIApplication) -> () {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
        {(granted, error) in
            
            if granted
            {
                DispatchQueue.main.async {
                    application.registerForRemoteNotifications()
                }
            }
            else
            {
                print("User notification permission denied: \(String(describing: error?.localizedDescription))")
            }
            
        }
    }
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("Successfull registration. token is:")
        print(tokenString(deviceToken))
    }
    
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Did fail to register for remote notification: \(error.localizedDescription)")
    }
    
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("Remote notification received with user info: \(userInfo)")
        
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        
       
        
       
        if let aps = userInfo["aps"] as? NSDictionary
        {
            
            
            if let alert = aps["alert"] as? NSDictionary
            {
                if (alert["message"] as? NSString) != nil
                {
                    //Do stuff
                    
                    print(alert)
                }
            } else if (aps["alert"] as? NSString) != nil {
                //Do stuff
                
               // print(aps["alert"] as? NSDictionary)
            }
            
            if let notifyType = aps["notificationtype"] as? NSString
            {
                //print(x)
                
                if notifyType == "TYPE1"
                {
                    if let notiId = aps["notificationid"] as? NSString
                    {
                        print("Notification ID \(notiId)")
                        
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "KeyGenNotification"), object: nil, userInfo: userInfo)
                    }
                    else
                    {
                        print("noti id is null")
                    }
                    
                }
                
                
            }
            else{
                
            }
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewNotification"), object: nil, userInfo: userInfo)
    }
    
    func tokenString(_ deviceToken: Data) -> String
    {
        let bytes = [UInt8](deviceToken)
        var token = ""
        for byte in bytes {
            token += String(format: "%02x", byte)
        }
        
        return token
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    //@available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        UIApplication.shared.applicationIconBadgeNumber = 0
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewNotification") , object: nil, userInfo: response.notification.request.content.userInfo)
    }
    
    //@available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }

}

