//
//  Reachability.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 07/10/2024.
//

import SystemConfiguration

public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        // Create zeroAddress for network reachability check
        var zeroAddress = sockaddr_in(sin_len: UInt8(MemoryLayout<sockaddr_in>.size),
                                      sin_family: sa_family_t(AF_INET),
                                      sin_port: 0,
                                      sin_addr: in_addr(s_addr: 0),
                                      sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags = SCNetworkReachabilityFlags()
        // Check if SCNetworkReachabilityGetFlags is successful
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        // Check for network connectivity
        return flags.contains(.reachable) && !flags.contains(.connectionRequired)
    }
}
