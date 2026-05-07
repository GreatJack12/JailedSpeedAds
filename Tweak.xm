#include <iostream>
#include <string>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
#import <objc/runtime.h>
#import <substrate.h>

// ─── Return helpers ───────────────────────────────────────────────
static BOOL returnNo(id self, SEL _cmd) {
    return NO;
}

static BOOL returnYes(id self, SEL _cmd) {
    return YES;
}

// Returns 0 — used to make timers/durations fire immediately
static double returnZero(id self, SEL _cmd) {
    return 0.0;
}

// ─── Main hook list ───────────────────────────────────────────────
void hookMethods() {
    MSHookMessageEx(objc_getClass("GADAdSource"), @selector(invalidated), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALMediationServiceAdDelegateProxy"), @selector(didLoadAd:withExtraInfo:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("AdsHandler"), @selector(pauseAll:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("AdsHandler"), @selector(clear), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("AdsHandler"), @selector(setPossibleAdsPerHour:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("AdsHandler"), @selector(init), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("AdsHandler"), @selector(clearTimeSinceLiveStarted), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("AdsHandler"), @selector(updateTimeSinceLiveStarted), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("BasePlayerView"), @selector(OnPlayer_AdStarted:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("FullScreenViewTVAIS"), @selector(getLastPlayedChannel), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("FullScreenViewTVAIS"), @selector(startPlayChannel:forceStart:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RFQVideoPlayer"), @selector(checkIsPreviewEnded), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RFQVideoPlayerAd"), @selector(onAdStartedPlay), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RFQVideoPlayerAd"), @selector(adShouldStartPlay), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RFQVideoPlayerAd"), @selector(setAdShouldStartPlay:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RSVodHead"), @selector(isPreview), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RSVodHead"), @selector(isPreviewEnded), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RSVodHead"), @selector(setIsPreview:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RSVodHead"), @selector(setIsPreviewEnded:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("TAGPreviewManager"), @selector(isPreviewingContainer:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("TabBarBaseVC"), @selector(OnHeadLoadSuccess), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("UMPConsentInformation"), @selector(canRequestAds), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("XmppVCardInfo"), @selector(hasAnyAds), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("XmppVCardInfo"), @selector(hasNativeAds), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("XmppVCardInfo"), @selector(hasRegularAds), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("SCSnapAdsAdResponsePersistentCache"), @selector(_getAdResponse:removeAdResponseOnHit:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("SCSnapAdsAdSourceConfig"), @selector(shouldDisableServeRequest), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("SCSnapAdsAdSourceConfig"), @selector(protoServeEndpoint), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("SCSnapAdsAdSourceConfig"), @selector(protoInitEndpoint), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("SCSnapAdsDynamicAdMediaManagerImpl"), @selector(removeMediaDataSource:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("SCSnapAdsOnDeviceInfoRecordCoordinator"), @selector(_handleRemoveOnDeviceInfoRecordsWithSuccess:completionBlock:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("SCSnapAdsOnDeviceInfoRecordCoordinator"), @selector(removeAllOnDeviceInfoRecordsForSaid:completionQueue:completionBlock:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("SCSnapAdsServeResponseDataStore"), @selector(_removeAdResponseForIdentifier:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("SCSnapAdsServeResponseDataStore"), @selector(removeAdResponseForIdentifier:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSNetService"), @selector(publish), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSNetService"), @selector(stop), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSNetService"), @selector(addresses), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSNetService"), @selector(initWithCFNetService:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSNetServiceBrowser"), @selector(stop), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSURLConnectionInternalConnection"), @selector(cancelAuthenticationChallenge:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSURLConnectionInternalConnection"), @selector(_timingData), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSURLSessionTaskHTTPAuthenticator"), @selector(sessionTaskHTTPAuthenticatorWithContext:statusCodes:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSURLSessionTaskHTTPAuthenticator"), @selector(setStatusCodes:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSURLSessionTaskLocalHTTPAuthenticator"), @selector(externalAuthenticator), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("__NSCFURLSessionTaskGroup"), @selector(dataTaskWithRequest:completionHandler:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("__NSCFURLSessionTaskGroup"), @selector(forwardingTargetForSelector:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("__NSCFURLSessionTaskGroup"), @selector(dataTaskWithRequest:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("__NSCFURLSessionTaskGroup"), @selector(uploadTaskWithStreamedRequest:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("__NSCFURLSessionTaskGroup"), @selector(_groupConfiguration), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("__NSCFURLSessionTaskGroup"), @selector(_groupSession), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSURLConnectionInternal"), @selector(useCredential:forAuthenticationChallenge:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSURLConnectionInternal"), @selector(_timingData), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("__NSCFURLSessionXPC"), @selector(initialize), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("FPUserCredentials"), @selector(adremoval_enabled), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALIncentivizedInterstitialAd"), @selector(isReadyForDisplay), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALMediatedAd"), @selector(isReady), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALStoreKitProductViewController"), @selector(isReady), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALStoreProductViewControllerWrapper"), @selector(isReady), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("FBAdDSLBridgeViewController"), @selector(isReadyToPresent), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("IMAAd"), @selector(isUiDisabled), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ISAdMobBannerAdapter"), @selector(isLargeScreen), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ISBaseAdUnitInteractionSmash"), @selector(isReadyToShow), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ISBaseAdUnitManager"), @selector(isReadyToShow), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ISBaseAdUnitSmash"), @selector(isReadyToShow), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ISDemandOnlyIsSmash"), @selector(isReadyToShow), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ISDemandOnlyRvSmash"), @selector(isReadyToShow), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ISLWSProgRvSmash"), @selector(isReadyToShow), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ISProgIsSmash"), @selector(isReadyToShow), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("MAAd"), @selector(isReady), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("MAAppOpenAd"), @selector(isReady), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("MAFullscreenAdController"), @selector(isReady), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("MAInterstitialAd"), @selector(isReady), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("MARewardedAd"), @selector(isReady), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("MARewardedInterstitialAd"), @selector(isReady), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADView"), @selector(initWithFrame:context:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALDCreativeDebuggerTableViewDataSource"), @selector(initializeWithDisplayedAds:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALMediationAdLoadCoordinator"), @selector(didLoadAd:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALMediationSetting"), @selector(fullscreenAdShouldReturnReadyWhenAdLoadIsInProgress), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADBannerAd"), @selector(adView), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADBannerAd"), @selector(videoController), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADCustomEventBannerAdRenderer"), @selector(renderWithServerTransaction:adConfiguration:completionHandler:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADFullScreenAdViewController"), @selector(viewWillAppear:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADFullScreenAdViewController"), @selector(presented), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADFullScreenAdViewController"), @selector(canPresentFromViewController:error:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADInlineInterstitialAdRenderer"), @selector(renderWithServerTransaction:adConfiguration:completionHandler:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADInlineMultipleNativeAdsRenderer"), @selector(renderWithServerTransaction:adConfiguration:completionHandler:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADInlineMultipleNativeAdsRenderer"), @selector(init), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADMediationBannerAdRenderer"), @selector(renderWithServerTransaction:adConfiguration:completionHandler:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADMediationBannerAdRenderer"), @selector(adapter:didReceiveAdView:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADRTBMediationBannerAdRenderer"), @selector(renderWithServerTransaction:adConfiguration:completionHandler:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADUnifiedMediationBannerAdRenderer"), @selector(renderWithServerTransaction:adConfiguration:completionHandler:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("MANativeAdSource"), @selector(isAdLoading), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADInlineBannerAdRenderer"), @selector(renderWithServerTransaction:adConfiguration:completionHandler:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerComponent"), @selector(didSetProps:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerComponent"), @selector(banner), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerComponent"), @selector(requested), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerComponent"), @selector(setBanner:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerComponent"), @selector(request), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerComponent"), @selector(propsChanged), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerComponent"), @selector(onNativeEvent), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerComponent"), @selector(setPropsChanged:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerViewManager"), @selector(view), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerViewManager"), @selector(methodQueue), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerViewManager"), @selector(propConfig_unitId), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerViewManager"), @selector(propConfig_sizes), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerViewManager"), @selector(propConfig_onNativeEvent), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerViewManager"), @selector(propConfig_manualImpressionsEnabled), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerViewManager"), @selector(recordManualImpression:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerViewManager"), @selector(bridge), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("RNGoogleMobileAdsBannerViewManager"), @selector(propConfig_request), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("VungleURLConfiguration"), @selector(setAdsURL:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADAdRenderResult"), @selector(rendererClassString), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADAdRenderResult"), @selector(setRendererClassString:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADInlineSingleNativeAdRenderer"), @selector(init), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADInternalBannerView"), @selector(callBackAdViewDidReceiveAd), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADMediatedAdRenderer"), @selector(adapter:didReceiveAdView:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADBannerView"), @selector(bannerViewDidReceiveAd:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADBannerView"), @selector(bannerView:didFailToReceiveAdWithError:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADBannerView"), @selector(bannerViewDidRecordImpression:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADBannerView"), @selector(bannerViewWillPresentScreen:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADBannerView"), @selector(adViewIntrinsicContentSizeDidChange:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADBannerView"), @selector(setAutoloadEnabled:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADBannerView"), @selector(setAdUnitID:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADBannerView"), @selector(loadRequest:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("_TtC9BusTaiwan20YBGoogleBannerAdView"), @selector(loadAd), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALAdLoadState"), @selector(isWaitingForAd), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALAdLoadState"), @selector(setIsWaitingForAd:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALAdService"), @selector(hasPreloadedAdOfSize:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALAdService"), @selector(hasPreloadedAdForZoneIdentifier:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALFullScreenAdTracker"), @selector(isFullScreenAdShowing), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALMediationAdLoadState"), @selector(isWaitingForAd), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALMediationAdLoadState"), @selector(setIsWaitingForAd:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALMediationAdapterRouter"), @selector(isAdShowingForAdapter:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ALNativeAdService"), @selector(loadNextAdAndNotify:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("APMPersistedConfig"), @selector(allowPersonalizedAds), (IMP)returnNo, NULL);

    // FIX: isSkippable should return YES so the skip button appears immediately
    MSHookMessageEx(objc_getClass("IMAAd"), @selector(isSkippable), (IMP)returnYes, NULL);

    // NEW: Make ad duration/remaining time report 0 so skip unlocks instantly
    MSHookMessageEx(objc_getClass("IMAAd"), @selector(duration), (IMP)returnZero, NULL);
    MSHookMessageEx(objc_getClass("IMAAd"), @selector(skipTimeOffset), (IMP)returnZero, NULL);

    // NEW: AppLovin rewarded ad — report duration as 0 to unlock reward immediately
    MSHookMessageEx(objc_getClass("MARewardedAd"), @selector(duration), (IMP)returnZero, NULL);
    MSHookMessageEx(objc_getClass("ALIncentivizedInterstitialAd"), @selector(duration), (IMP)returnZero, NULL);

    // NEW: IronSource rewarded — treat as instantly complete
    MSHookMessageEx(objc_getClass("ISDemandOnlyRvSmash"), @selector(isAdValid), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("ISLWSProgRvSmash"), @selector(isAdValid), (IMP)returnNo, NULL);

    // Dealloc hooks (kept from original)
    MSHookMessageEx(objc_getClass("NSNetService"), sel_getUid("dealloc"), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSNetServiceBrowser"), sel_getUid("dealloc"), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NWStreamPair"), sel_getUid("dealloc"), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("__NSCFURLLocalStreamTaskFromDataTaskDataBlobby"), sel_getUid("dealloc"), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSURLSessionTaskBackgroundHTTPAuthenticator"), sel_getUid("dealloc"), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("NSURLSessionTaskDependency"), sel_getUid("dealloc"), (IMP)returnNo, NULL);

    // Jailbreak detection bypass
    MSHookMessageEx(objc_getClass("BUDeviceHelper"), @selector(bu_isJailBroken), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("EBAppLogDeviceHelper"), @selector(isJailBroken), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADMinimumVersionSupport"), @selector(OSIsSupported), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADOMIDAdSessionRegistry"), @selector(isActive), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADOMIDAdSessionRegistry"), @selector(removeAdSession:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADOMIDAdSessionRegistry"), @selector(adSessions), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADOMIDAdSessionRegistry"), @selector(activeAdSessions), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("GADOMIDAdSessionRegistry"), @selector(addAdSession:), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("HMDBUInfo"), @selector(isJailBroken), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("MobClick"), @selector(isJailbroken), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("MobClick"), @selector(isPirated), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("SSEDeviceStatus"), @selector(jailBroken), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("UMUtils"), @selector(isDeviceJailBreak), (IMP)returnNo, NULL);
    MSHookMessageEx(objc_getClass("UMUtils"), @selector(isAppPirate), (IMP)returnNo, NULL);
}

// ─── Initialise ───────────────────────────────────────────────────
__attribute__((constructor))
static void initialize() {
    hookMethods();
}

// ─── AVPlayer: blast through video ads at max speed ──────────────
// The rate setter multiplies whatever the app sets by 600x,
// making any video ad finish near-instantly.
// The rate getter reports back a believable value (half the real rate)
// so the app's internal progress checks don't panic.
%hook AVPlayer

- (void)setRate:(float)rate {
    // Only turbo-charge rates > 0 (i.e. actual playback, not pause/stop)
    if (rate > 0.0f) {
        %orig(rate * 600.0f);
    } else {
        %orig(rate);
    }
}

- (float)rate {
    return %orig() * 0.5f;
}

%end

// ─── AVPlayerItem: skip to end as soon as playback starts ────────
// When currentTime updates (playback is live), immediately seek to
// the very end of the item. This fires the "did play to end" callback
// which most ad SDKs use to unlock the reward / close button.
%hook AVPlayerItem

- (void)setStatus:(NSInteger)status {
    %orig(status);
    // Status 1 = AVPlayerItemStatusReadyToPlay
    if (status == 1) {
        CMTime end = self.duration;
        // Only seek if we have a valid finite duration
        if (CMTIME_IS_VALID(end) && !CMTIME_IS_INDEFINITE(end)) {
            [self seekToTime:end
             toleranceBefore:kCMTimeZero
              toleranceAfter:kCMTimeZero];
        }
    }
}

%end

// ─── NSTimer: collapse post-ad waiting countdowns ─────────────────
// Many games show a "Reward earned!" screen with a short countdown
// before the close button appears. This is almost always an NSTimer.
// We shrink any timer interval >= 1 s down to 0.01 s so it fires
// almost immediately, killing the waiting screen fast.
%hook NSTimer

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                     target:(id)target
                                   selector:(SEL)selector
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats {
    NSTimeInterval fast = (interval >= 1.0) ? 0.01 : interval;
    return %orig(fast, target, selector, userInfo, repeats);
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                 invocation:(NSInvocation *)invocation
                                    repeats:(BOOL)repeats {
    NSTimeInterval fast = (interval >= 1.0) ? 0.01 : interval;
    return %orig(fast, invocation, repeats);
}

%end

// ─── dispatch_after: collapse GCD-based post-ad delays ───────────
// Some newer ad SDKs use dispatch_after instead of NSTimer for the
// post-ad countdown. This replaces any delay >= 1 s with 0.01 s.
static void (*orig_dispatch_after)(dispatch_time_t when,
                                   dispatch_queue_t queue,
                                   dispatch_block_t block);

static void hooked_dispatch_after(dispatch_time_t when,
                                  dispatch_queue_t queue,
                                  dispatch_block_t block) {
    // Convert the absolute time back to an interval from now
    // dispatch_time_t is nanoseconds from the mach absolute time epoch;
    // comparing against DISPATCH_TIME_NOW + 1s is a safe proxy.
    dispatch_time_t oneSecondFromNow = dispatch_time(DISPATCH_TIME_NOW,
                                                      (int64_t)(1.0 * NSEC_PER_SEC));
    if (when > oneSecondFromNow) {
        // Collapse to 10 ms from now
        when = dispatch_time(DISPATCH_TIME_NOW,
                             (int64_t)(0.01 * NSEC_PER_SEC));
    }
    orig_dispatch_after(when, queue, block);
}
