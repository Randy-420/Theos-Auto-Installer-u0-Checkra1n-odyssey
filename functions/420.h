#import <Foundation/Foundation.h>
#include <spawn.h>
#include "includes.h"

@interface UIDevice ()
- (id)_deviceInfoForKey:(NSString *)key;  
@end

@interface tai : NSObject{
		/* VARIABLES */
	NSString *runCode;
	NSString *tFolderSuc;
	NSString *tFolderFail;
	NSString *tFolderIgnore;
	NSString *previousInstallMsg;
	NSString *theosSuccessMessage;
	NSString *theosFailureMessage;
	NSString *successfulSdk;
	NSString *failedSdk;
	NSString *ignored;
	NSString *enhanceMsg;
	NSString *updated;
	NSString *Loc;
	NSString *Loc1;
	NSString *msg;
	NSString *dlLinK;
	NSString *installHere;
	NSString *checkInstall;
	NSString *leaf;
	NSMutableDictionary *preferences;
	NSFileManager *fm;
}

/* ENHANCEMENTS */
@property (nonatomic, assign) BOOL enhance;
/* SDKS */
@property (nonatomic, assign) BOOL all;
@property (nonatomic, assign) BOOL nineThree;
@property (nonatomic, assign) BOOL tenThree;
@property (nonatomic, assign) BOOL elevenTwo;
@property (nonatomic, assign) BOOL twelveOneTwo;
@property (nonatomic, assign) BOOL twelveFour;
@property (nonatomic, assign) BOOL thirteen;
@property (nonatomic, assign) BOOL thirteenFour;
@property (nonatomic, assign) BOOL thirteenFive;
@property (nonatomic, assign) BOOL fourteen;
/* CHECKS */
@property (nonatomic, assign) BOOL failure;
@property (nonatomic, assign) BOOL alreadyHas;
@property (nonatomic, assign) BOOL enhanced;
@property (nonatomic, assign) BOOL installSuccess;
@property (nonatomic, assign) BOOL previousInstall;
@property (nonatomic, assign) BOOL tweaksMade;
@property (nonatomic, assign) BOOL tweaksExists;
@property (nonatomic, assign) BOOL folderFailed;
@property (nonatomic, assign) BOOL theosUpdate;
@property (nonatomic, assign) BOOL attempted;
@property (nonatomic, assign) BOOL failed;
@property (nonatomic, assign) BOOL PoPuP;
@property (nonatomic, assign) BOOL useColor;
@property (nonatomic, assign) BOOL installedTheos;
@property (nonatomic, assign) BOOL installedVarTheos;
/* COUNTER */
@property (nonatomic, assign) int totalDownloaded;

-(void) RunCMD:(NSString *)RunCMD WaitUntilExit:(BOOL)WaitUntilExit;
-(void) makeTweaksFolder;
-(BOOL) theosInstall;
-(void) loader;
-(bool) sdk:(NSString*)sdk Link:(NSString*)Link;
-(void) DoWnLoAd;
//-(void) upDateTheos;
-(void) enhancer;
-(void) addMsg:(NSString *)mSg;
-(void) popup;
@end

// NSTask.h
#import <Foundation/NSObject.h>

@class NSString, NSArray, NSDictionary;

@interface NSTask : NSObject

// Create an NSTask which can be run at a later time
// An NSTask can only be run once. Subsequent attempts to
// run an NSTask will raise.
// Upon task death a notification will be sent
//   { Name = NSTaskDidTerminateNotification; object = task; }
//

- (instancetype)init;

// set parameters
// these methods can only be done before a launch
- (void)setLaunchPath:(NSString *)path;
- (void)setArguments:(NSArray *)arguments;
- (void)setEnvironment:(NSDictionary *)dict;
// if not set, use current
- (void)setCurrentDirectoryPath:(NSString *)path;
// if not set, use current

// set standard I/O channels; may be either an NSFileHandle or an NSPipe
- (void)setStandardInput:(id)input;
- (void)setStandardOutput:(id)output;
- (void)setStandardError:(id)error;

// get parameters
- (NSString *)launchPath;
- (NSArray *)arguments;
- (NSDictionary *)environment;
- (NSString *)currentDirectoryPath;

// get standard I/O channels; could be either an NSFileHandle or an NSPipe
- (id)standardInput;
- (id)standardOutput;
- (id)standardError;

// actions
- (void)launch;

- (void)interrupt; // Not always possible. Sends SIGINT.
- (void)terminate; // Not always possible. Sends SIGTERM.

- (BOOL)suspend;
- (BOOL)resume;

// status
- (int)processIdentifier;
- (BOOL)isRunning;

- (int)terminationStatus;

@end

@interface NSTask (NSTaskConveniences)

+ (NSTask *)launchedTaskWithLaunchPath:(NSString *)path arguments:(NSArray *)arguments;
// convenience; create and launch

- (void)waitUntilExit;
// poll the runLoop in defaultMode until task completes

@end

FOUNDATION_EXPORT NSString * const NSTaskDidTerminateNotification;