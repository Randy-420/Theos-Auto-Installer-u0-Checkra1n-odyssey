#pragma GCC diagnostic ignored "-Wunused-function"
#import <Foundation/Foundation.h>
#include <spawn.h>
#include "includes.h"
#import <MobileCoreServices/UTCoreTypes.h>

static NSString *local(NSString *local, NSString *def){
	NSString *path = @"/Library/Application Support/Theos Auto Installer";
	NSString *tPath;
	NSArray *languages = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
	NSArray *preferredLanguages = [NSLocale preferredLanguages];

	for (NSString *preferredLanguage in preferredLanguages){
		for (NSString *language in languages){
			if ([preferredLanguage hasPrefix:[language stringByReplacingOccurrencesOfString:@".lproj" withString:@""]]){
				tPath = [path stringByAppendingPathComponent:language];
				if ([[NSFileManager defaultManager] fileExistsAtPath:tPath]){
					path = tPath;
					return [[NSBundle bundleWithPath:path] localizedStringForKey:local value:def table:@"tai"];
				}
			}
		}
	}

	return def;//[[NSBundle bundleWithPath:path] localizedStringForKey:local value:def table:@"tai"];
}

static NSString *GetNSString(NSString *pkey, NSString *defaultValue, NSString *plst){
NSDictionary *Dict = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/%@.plist",plst]];

	return [Dict objectForKey:pkey] ? [Dict objectForKey:pkey] : defaultValue;
}

static BOOL GetBool(NSString *pkey, BOOL defaultValue, NSString *plst) {
	NSDictionary *Dict = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/%@.plist",plst]];

	return [Dict objectForKey:pkey] ? [[Dict objectForKey:pkey] boolValue] : defaultValue;
}

@interface UIDevice ()
- (id)_deviceInfoForKey:(NSString *)key;  
@end

@interface tai : NSObject{
		/* VARIABLES */
	NSString *runCode;
	NSString *tFolderSuc;
	NSString *tFolderFail;
	NSString *previousInstallMsg;
	NSString *theosSuccessMessage;
	NSString *theosFailureMessage;
	NSString *successfulSdk;
	NSString *failedSdk;
	NSString *ignored;
	NSString *enhanceMsg;
	NSString *updated;
	NSString *updateFail;
	NSString *Loc;
	NSString *msg;
	NSString *dlLinK;
	NSString *installHere;
	NSString *checkInstall;
	NSString *fixApplied;
	NSString *failedRm;
	NSString *successfulRm;
	NSString *leaf;
	NSMutableDictionary *preferences;
	NSFileManager *fm;
}
 
/* ENHANCEMENTS */
@property (nonatomic, assign) BOOL enhance;
/* SDKS */
@property (nonatomic, copy) NSArray *profiles;
@property (nonatomic, assign) BOOL all;
@property (nonatomic, assign) BOOL eightFour;
@property (nonatomic, assign) BOOL nineThree;
@property (nonatomic, assign) BOOL ten;
@property (nonatomic, assign) BOOL tenThree;
@property (nonatomic, assign) BOOL eleven;
@property (nonatomic, assign) BOOL elevenOne;
@property (nonatomic, assign) BOOL elevenTwo;
@property (nonatomic, assign) BOOL elevenThree;
@property (nonatomic, assign) BOOL elevenFour;
@property (nonatomic, assign) BOOL twelveOneTwo;
@property (nonatomic, assign) BOOL twelveTwo;
@property (nonatomic, assign) BOOL twelveFour;
@property (nonatomic, assign) BOOL thirteen;
@property (nonatomic, assign) BOOL thirteenTwo;
@property (nonatomic, assign) BOOL thirteenFour;
@property (nonatomic, assign) BOOL thirteenFive;
@property (nonatomic, assign) BOOL fourteen;
@property (nonatomic, assign) BOOL fourteenOne;
@property (nonatomic, assign) BOOL fourteenTwo;
@property (nonatomic, assign) BOOL fourteenThree;
@property (nonatomic, assign) BOOL fourteenFour;
@property (nonatomic, assign) BOOL fourteenFive;
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
@property (nonatomic, assign) BOOL theosUpdateFail;
@property (nonatomic, assign) BOOL attempted;
@property (nonatomic, assign) BOOL failed;
@property (nonatomic, assign) BOOL PoPuP;
@property (nonatomic, assign) BOOL useColor;
@property (nonatomic, assign) BOOL installedTheos;
@property (nonatomic, assign) BOOL installedVarTheos;
@property (nonatomic, assign) BOOL installedOptTheos;
@property (nonatomic, assign) BOOL installFirst;
@property (nonatomic, assign) BOOL abyss;
@property (nonatomic, assign) BOOL rmFailure;
@property (nonatomic, assign) BOOL autoRm;
/* COUNTER */
@property (nonatomic, assign) int totalDownloaded;
@property (nonatomic, assign) int totalRemoved;

-(void) RunCMD:(NSString *)RunCMD WaitUntilExit:(BOOL)WaitUntilExit;
-(void) fixTheos;
-(void) makeTweaksFolder;
-(BOOL) theosInstall;
-(void) loader;
-(void)remove:(NSString *)sdk;
-(bool) sdk:(NSString*)sdk Link:(NSString*)Link;
-(void) DoWnLoAd;
-(void) upDateTheos;
-(void) enhancer;
-(void) addMsg:(NSString *)mSg;
-(void) popup;
-(void) updateInstall;
-(void)checkTerm;
-(BOOL)dTheos:(BOOL)dTheos;
-(void)header;
-(void)startup;
-(void)depends;
-(void)Print:(NSString *)Print;
-(void) addToProfile:(BOOL)addToProfile profile:(NSString *)profile;
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