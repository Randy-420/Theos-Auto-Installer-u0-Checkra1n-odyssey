#include <spawn.h>
#include "420.h"
#define _POSIX_SPAWN_DISABLE_ASLR 0x0100
#define _POSIX_SPAWN_ALLOW_DATA_EXEC 0x2000
extern char **environ;

static NSString *GetNSString(NSString *pkey, NSString *defaultValue, NSString *plst){
NSDictionary *Dict = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/%@.plist",plst]];

	return [Dict objectForKey:pkey] ? [Dict objectForKey:pkey] : defaultValue;
}

static BOOL GetBool(NSString *pkey, BOOL defaultValue, NSString *plst) {
	NSDictionary *Dict = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/%@.plist",plst]];

	return [Dict objectForKey:pkey] ? [[Dict objectForKey:pkey] boolValue] : defaultValue;
}

@implementation tai
-(void) RunCMD:(NSString *)RunCMD WaitUntilExit:(BOOL)WaitUntilExit { 
	NSString *SSHGetFlex = [NSString stringWithFormat:@"%@",RunCMD];

	NSTask *task = [[NSTask alloc] init];
	NSMutableArray *args = [NSMutableArray array];

	[args addObject:@"-c"];
	[args addObject:SSHGetFlex];

	[task setLaunchPath:@"/bin/sh"];
	[task setArguments:args];
	[task launch];
	if (WaitUntilExit)
		[task waitUntilExit];
}

-(void)makeTweaksFolder {
	NSFileManager *fm = [[NSFileManager alloc] init];

	if (![fm fileExistsAtPath:@"/var/mobile/tweaks"]) {
		runCode = [NSString stringWithFormat:@"echo \"mkdir /var/mobile/tweaks\" | gap"];
		[self RunCMD:runCode WaitUntilExit: YES] ;

		self.tweaksMade = [fm fileExistsAtPath:@"/var/mobile/tweaks"];
		self.folderFailed = !self.tweaksMade;
	}
}

-(BOOL)theosInstall {
	NSFileManager *fm = [[NSFileManager alloc] init];
	self.attempted = YES;
	self.previousInstall = (self.installedTheos || self.installedVarTheos);

	if (!self.previousInstall) {
		runCode = [NSString stringWithFormat:@"echo \"git clone --recursive https://github.com/theos/theos.git %@\" | gap", installHere];
		[self RunCMD:runCode WaitUntilExit: YES] ;
		self.installSuccess = [fm fileExistsAtPath:installHere];

		if (self.installSuccess)
			return YES;

		self.failed = YES;
	}
	return NO;
}

-(void)loader{
	NSFileManager *fm = NSFileManager.defaultManager;

	installHere = GetNSString(@"Location", @"/var/theos", @"com.randy420.tai");

	self.enhance = GetBool(@"enhance", NO, @"com.randy420.tai");
	self.all = GetBool(@"sdks-master", NO, @"com.randy420.tai");
	self.nineThree = GetBool(@"9.3", YES, @"com.randy420.tai");
	self.tenThree = GetBool(@"10.3", NO, @"com.randy420.tai");
	self.elevenTwo = GetBool(@"11.2", NO, @"com.randy420.tai");
	self.twelveOneTwo = GetBool(@"12.1.2", NO, @"com.randy420.tai");
	self.twelveFour = GetBool(@"12.4", YES, @"com.randy420.tai");
	self.thirteen = GetBool(@"13.0", NO, @"com.randy420.tai");
	self.thirteenFour = GetBool(@"13.4", NO, @"com.randy420.tai");
	self.thirteenFive = GetBool(@"13.5", YES, @"com.randy420.tai");
	self.fourteen = GetBool(@"14.0", NO, @"com.randy420.tai");

	self.installedTheos = [fm fileExistsAtPath:@"/theos"];
	self.installedVarTheos = [fm fileExistsAtPath:@"/var/theos"];
	self.tweaksExists = [fm fileExistsAtPath:@"/var/mobile/tweaks"];
	
	self.tweaksMade = NO;
	self.folderFailed = NO;
	self.enhanced = NO;
	self.alreadyHas = NO;
	self.failure = NO;
	self.theosUpdate = NO;
	self.installSuccess = NO;
	self.attempted = NO;
	self.failed = NO;
	self.PoPuP = YES;
	self.previousInstall = (self.installedTheos || self.installedVarTheos);
	self.totalDownloaded = 0;

	if (self.useColor) {
		successfulSdk = [NSString stringWithFormat:@"[%sSuccessfully downloaded SDKS%s]\n", c_green, c_reset];
		failedSdk = [NSString stringWithFormat:@"[%sFailed Installing SDKS%s]\n", c_red, c_reset];
		enhanceMsg = [NSString stringWithFormat:@"[%sDev Tools Installed%s]\n", c_green, c_reset];
		ignored = [NSString stringWithFormat:@"[%sPreviously installed SDKS%s]\n", c_yellow, c_reset];
		tFolderSuc = [NSString stringWithFormat:@"[%sTweaks folder created successfully%s]\n", c_green, c_reset];
		tFolderFail = [NSString stringWithFormat:@"[%sFailed to make /var/mobile/tweaks%s]\n", c_red, c_reset];
		tFolderIgnore = [NSString stringWithFormat:@"[%stweaks folder already exists%s]\n", c_yellow, c_reset];
		updated = [NSString stringWithFormat:@"[%sTheos is now Up-To-Date%s]\n", c_green, c_reset];
		theosFailureMessage = [NSString stringWithFormat:@"[%sTheos install FAILED!%s]\n", c_red, c_reset];
		theosSuccessMessage = [NSString stringWithFormat:@"[%sTheos installed To '%@'%s]\n", c_green, installHere, c_reset];
		checkInstall = [NSString stringWithFormat:@"[%s!!%sMAKE SURE THE INSTALL LOCATION IS RIGHT IN SETTINGS%s!!%s]\n", c_cyan, c_red, c_cyan, c_reset];
		if (self.installedTheos && self.installedVarTheos) {
			previousInstallMsg = [NSString stringWithFormat:@"[%sTheos previously installed to '%s/theos%s' & '%s/var/theos%s'%s]\n", c_yellow, c_red, c_yellow, c_red, c_yellow, c_reset];
		} else if (self.installedVarTheos) {
			previousInstallMsg = [NSString stringWithFormat:@"[%sTheos previously installed to '%s/var/theos%s'%s]\n", c_yellow, c_red, c_yellow, c_reset];
		} else {
			previousInstallMsg = [NSString stringWithFormat:@"[%sTheos previously installed to '%s/theos%s'%s]\n", c_yellow, c_red, c_yellow, c_reset];
		}
	} else {
		successfulSdk = @"[Successfully downloaded SDKS]\n";
		failedSdk = @"[Failed Installing SDKS]\n";
		enhanceMsg = @"[Dev Tools Installed]\n";
		checkInstall = @"[!!MAKE SURE THE INSTALL LOCATION IS RIGHT IN SETTINGS!!]\n";
		ignored = @"[Ignored Previously Installed SDKS]\n";
		tFolderSuc = @"[Tweaks folder created successfully]\n";
		tFolderFail = @"[Failed to make /var/mobile/tweaks]\n";
		tFolderIgnore = @"[tweaks folder already exists]\n";
		updated = @"[Theos is now Up-To-Date]\n";
		theosFailureMessage = @"[Theos install FAILED!]\n";
		theosSuccessMessage = [NSString stringWithFormat:@"[Theos installed To '%@']\n", installHere];
		if (self.installedTheos && self.installedVarTheos) {
			previousInstallMsg = [NSString stringWithFormat:@"[Theos previously installed to '/theos' & '/var/theos']\n"];
		} else if (self.installedVarTheos) {
			previousInstallMsg = [NSString stringWithFormat:@"[Theos previously installed to '/var/theos']\n"];
		} else {
			previousInstallMsg = [NSString stringWithFormat:@"[Theos previously installed to '/theos']\n"];
		}
	}
	msg = @"";
}

-(bool)sdk:(NSString *)sdk Link:(NSString *)Link {
	NSFileManager *fm = [[NSFileManager alloc] init];
	Loc = [NSString stringWithFormat:@"/theos/sdks/iPhoneOS%s.sdk", [sdk UTF8String]];
	Loc1 = [NSString stringWithFormat:@"/var/theos/sdks/iPhoneOS%s.sdk", [sdk UTF8String]];
	if (!self.previousInstall) {
		runCode = [NSString stringWithFormat:@"echo \"curl -LO %@\" | gap;TMP=$(mktemp -d);echo \"unzip %@.zip -d $TMP\" | gap;echo \"mv $TMP/*.sdk %@/sdks;echo\" | gap;echo \"rm -r %@.zip $TMP\" | gap", Link, sdk, installHere, sdk];
		[self RunCMD:runCode WaitUntilExit: YES];
		self.totalDownloaded += 1;
		Loc = [NSString stringWithFormat:@"%@/sdks/iPhoneOS%@.sdk", installHere, sdk];
		if ([fm fileExistsAtPath: Loc]) {
			if (self.useColor) {
				successfulSdk = [NSString stringWithFormat:@"%@%s ~iPhoneOS %@ SDK%s\n", successfulSdk, c_green, sdk, c_reset];
			} else {
				successfulSdk = [NSString stringWithFormat:@"%@ ~iPhoneOS %@ SDK\n", successfulSdk, sdk];
			}
			return (YES);
		} else {
			if (self.useColor) {
				failedSdk = [NSString stringWithFormat:@"%@ ~%siPhoneOS %@ SDK%s\n", failedSdk, c_red, sdk, c_reset];
			} else {
				failedSdk = [NSString stringWithFormat:@"%@ ~iPhoneOS %@ SDK\n", failedSdk, sdk];
			}
			self.failure = YES;
			return (NO);
		}
	} else {
		self.alreadyHas = YES;
		if (self.useColor) {
			ignored = [NSString stringWithFormat:@"%@%s ~iPhoneOS %@ SDK%s\n", ignored, c_yellow, sdk, c_reset];
		} else {
			ignored = [NSString stringWithFormat:@"%@ ~iPhoneOS %@ SDK\n", ignored, sdk];
		}
	}
	return (YES);
}

-(void)DoWnLoAd {
	if (self.all) {
		[self sdk:@"9.3" Link:@"https://www.dropbox.com/s/8qhz72yeumz5swy/9.3.zip"];
		[self sdk:@"10.3" Link:@"https://www.dropbox.com/s/fdze31wrnukk3t7/10.3.zip"];
		[self sdk:@"11.2" Link:@"https://www.dropbox.com/s/ak3bjqi4nz0yo0w/11.2.zip"];
		[self sdk:@"12.1.2" Link:@"https://www.dropbox.com/s/2zxfr7qk3fcnm8f/12.1.2.zip"];
		[self sdk:@"12.4" Link:@"https://www.dropbox.com/s/s3dmz4bqx3ayixm/12.4.zip"];
		[self sdk:@"13.0" Link:@"https://www.dropbox.com/s/fujs52jmc6vdh37/13.0.zip"];
		[self sdk:@"13.4" Link:@"https://www.dropbox.com/s/hxtkxy9c1fu71nq/13.4.zip"];
		[self sdk:@"13.5" Link:@"https://www.dropbox.com/s/ztqcfo7okv6276p/13.5.zip"];
		[self sdk:@"14.0" Link:@"https://www.dropbox.com/s/ly8627ncpaiv6ji/14.0.zip"];
		return;
	}
	self.nineThree ? [self sdk:@"9.3" Link:@"https://www.dropbox.com/s/8qhz72yeumz5swy/9.3.zip"] : 0;
	self.tenThree ? [self sdk:@"10.3" Link:@"https://www.dropbox.com/s/fdze31wrnukk3t7/10.3.zip"] : 0;
	self.elevenTwo ? [self sdk:@"11.2" Link:@"https://www.dropbox.com/s/ak3bjqi4nz0yo0w/11.2.zip"] : 0;
	self.twelveOneTwo ? [self sdk:@"12.1.2" Link:@"https://www.dropbox.com/s/2zxfr7qk3fcnm8f/12.1.2.zip"] : 0;
	self.twelveFour ? [self sdk:@"12.4" Link:@"https://www.dropbox.com/s/s3dmz4bqx3ayixm/12.4.zip"] : 0;
	self.thirteen ? [self sdk:@"13.0" Link:@"https://www.dropbox.com/s/fujs52jmc6vdh37/13.0.zip"] : 0;
	self.thirteenFour ? [self sdk:@"13.4" Link:@"https://www.dropbox.com/s/hxtkxy9c1fu71nq/13.4.zip"] : 0;
	self.thirteenFive ? [self sdk:@"13.5" Link:@"https://www.dropbox.com/s/ztqcfo7okv6276p/13.5.zip"] : 0;
	self.fourteen ? [self sdk:@"14.0" Link:@"https://www.dropbox.com/s/ly8627ncpaiv6ji/14.0.zip"] : 0;
}

-(void)upDateTheos {
	[self RunCMD: @"echo \"$THEOS/bin/update-theos\" | gap" WaitUntilExit: YES];
	self.theosUpdate = YES;
}

-(void)enhancer{
	NSFileManager *fm = [[NSFileManager alloc] init];
	if (self.enhance) {
		if ([fm fileExistsAtPath:installHere]) {
			runCode = [NSString stringWithFormat:@"echo \"curl -LO https://www.dropbox.com/s/ya3i2fft4dqvccm/includes.zip\" | gap;TMP=$(mktemp -d);echo \"unzip includes.zip -d $TMP\" | gap;echo \"mv $TMP/include/* /theos/include\" | gap;echo \"mv $TMP/lib/* %@/lib\" | gap;echo \"mv $TMP/templates/* %@/templates\" | gap;echo \"mv $TMP/vendor/* %@/vendor\" | gap;echo;echo \"rm -r includes.zip $TMP\" | gap;", installHere, installHere, installHere];
			[self RunCMD:runCode WaitUntilExit: YES];
		}
		if ([fm fileExistsAtPath:@"/theos/vendor/templates/test.sh"] || [fm fileExistsAtPath:@"/var/theos/vendor/templates/test.sh"]) {
			self.enhanced = YES;
		}
	}
}

-(void)addMsg: (NSString *)mSg{
	msg = [NSString stringWithFormat:@"%@%@\n", msg, mSg];
}

-(void)popup{
		self.theosUpdate ? [self addMsg:updated] : 0;
	self.installSuccess ? [self addMsg:theosSuccessMessage] : 0;
	if (self.tweaksExists){
		[self addMsg:tFolderIgnore];
	}else{
		if (!self.theosUpdate) {
			self.tweaksMade ? [self addMsg:tFolderSuc] : (self.folderFailed ? [self addMsg:tFolderFail] : 0);
		}
	}
	(self.attempted && self.failed && (!(self.previousInstall && self.installSuccess))) ? [self addMsg:theosFailureMessage] : 0;
	
	(self.attempted && self.previousInstall) ? [self addMsg:previousInstallMsg] : 0;

	self.enhanced ? [self addMsg:enhanceMsg] : 0;

	(self.totalDownloaded >= 1) ? [self addMsg:successfulSdk] : 0;

	self.alreadyHas ? [self addMsg:ignored] : 0;

	if (self.failure) {
		[self addMsg:failedSdk];
		[self addMsg:checkInstall];
	}

	if (self.PoPuP) {
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Installation Results" message: msg preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		
		}];
		[alert addAction:action];
		[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
	} else {
		printf("\n\n%s\n", [msg UTF8String]);
	}
}
@end