//
//  MediaStatusExtensions.swift
//  google_cast
//
//  Created by LUIZ FELIPE ALVES LIMA on 28/06/22.
//

import Foundation
import GoogleCast

extension GCKMediaStatus {
    
    func toMap() -> Dictionary<String, Any> {
        NSLog("[flutter_chrome_cast/DEBUG] GCKMediaStatus.toMap() called")

        var dict = Dictionary<String, Any>()
        dict["mediaSessionID"] = self.mediaSessionID
        dict["playerState"] = self.playerState.rawValue
        dict["playingAd"] = self.playingAd
        dict["idleReason"] = self.idleReason.rawValue
        dict["playbackRate"] = self.playbackRate
        dict["mediaInformation"] = self.mediaInformation?.toMap()
        dict["repeatMode"] = self.queueRepeatMode.rawValue
        dict["activeTrackIds"] = self.activeTrackIDs
        dict["queueHasNextItem"] = self.queueHasNextItem
        dict["queueHasPreviousItem"] =  self.queueHasPreviousItem
        dict["currentItemId"] = self.currentItemID

        // Live seekable range
        NSLog("[flutter_chrome_cast/DEBUG] streamType: \(self.mediaInformation?.streamType.rawValue ?? 0)")
        NSLog("[flutter_chrome_cast/DEBUG] liveSeekableRange: \(self.liveSeekableRange != nil ? "NOT nil" : "nil")")

        if let liveSeekableRange = self.liveSeekableRange {
            NSLog("[flutter_chrome_cast/DEBUG] liveSeekableRange.startTime: \(liveSeekableRange.startTime)s")
            NSLog("[flutter_chrome_cast/DEBUG] liveSeekableRange.endTime: \(liveSeekableRange.endTime)s")
            NSLog("[flutter_chrome_cast/DEBUG] liveSeekableRange.isMovingWindow: \(liveSeekableRange.isMovingWindow)")
            NSLog("[flutter_chrome_cast/DEBUG] liveSeekableRange.isLiveDone: \(liveSeekableRange.isLiveDone)")

            dict["liveSeekableRange"] = [
                "start": Int(liveSeekableRange.startTime),
                "end": Int(liveSeekableRange.endTime),
                "isMovingWindow": liveSeekableRange.isMovingWindow,
                "isLiveDone": liveSeekableRange.isLiveDone
            ]
        } else {
            NSLog("[flutter_chrome_cast/DEBUG] liveSeekableRange is nil - will not be added to dictionary")
        }

        // Add stream position if available, though it's usually retrieved separately
        // dict["streamPosition"] = self.streamPosition

        return dict
    }
    
    
    
}
