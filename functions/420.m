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
	if (![fm fileExistsAtPath:@"/var/mobile/tweaks"]) {
		runCode = [NSString stringWithFormat:@"echo \"mkdir /var/mobile/tweaks\" | gap"];
		[self RunCMD:runCode WaitUntilExit: YES] ;

		self.tweaksMade = [fm fileExistsAtPath:@"/var/mobile/tweaks"];
		self.folderFailed = !self.tweaksMade;
	}
}

-(BOOL)theosInstall {
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
	fm = NSFileManager.defaultManager;
	leaf = @"\n\n                     .                          \n                     M                          \n                    dM                          \n                    MMr                         \n                   4MMML                  .     \n                   MMMMM.                xf     \n   .              \"MMMMM               .MM-     \n    Mh..          +MMMMMM            .MMMM      \n    .MMM.         .MMMMML.          MMMMMh      \n     )MMMh.        MMMMMM         MMMMMMM       \n      3MMMMx.     \'MMMMMMf      xnMMMMMM\"       \n      \'*MMMMM      MMMMMM.     nMMMMMMP\"        \n        *MMMMMx    \"MMMMM\\    .MMMMMMM=         \n         *MMMMMh   \"MMMMM\"   JMMMMMMP           \n           MMMMMM   3MMMM.  dMMMMMM            .\n            MMMMMM  \"MMMM  .MMMMM(        .nnMP\"\n=..          *MMMMx  MMM\"  dMMMM\"    .nnMMMMM*  \n  \"MMn...     \'MMMMr \'MM   MMM\"   .nMMMMMMM*\"   \n   \"4MMMMnn..   *MMM  MM  MMP\"  .dMMMMMMM\"\"     \n     ^MMMMMMMMx.  *ML \"M .M*  .MMMMMM**\"        \n        *PMMMMMMhn. *x > M  .MMMM**\"\"           \n           \"\"**MMMMhx/.h/ .=*\"                  \n                    .3P\"%....";

	leaf = [NSString stringWithFormat:@"%s%@%s\n", c_green, leaf, c_reset];
	leaf = [NSString stringWithFormat:@"%@\t     %sT%sheos %sA%suto %sI%snstaller%s\n", leaf, c_red, c_cyan, c_red, c_cyan, c_red, c_cyan, c_reset];
	leaf = [NSString stringWithFormat:@"%@%s                     Randy420\n%s\n", leaf, c_red, c_reset];
	installHere = GetNSString(@"Location", @"/var/theos", @"com.randy420.tai");

	self.enhance = GetBool(@"enhance", NO, @"com.randy420.tai");
	self.all = GetBool(@"sdks-master", NO, @"com.randy420.tai");
	self.eightFour = GetBool(@"8.4", NO, @"com.randy420.tai");
	self.nineThree = GetBool(@"9.3", YES, @"com.randy420.tai");
	self.ten = GetBool(@"10.0", NO, @"com.randy420.tai");
	self.tenThree = GetBool(@"10.3", NO, @"com.randy420.tai");
	self.eleven = GetBool(@"11.0", NO, @"com.randy420.tai");
	self.elevenOne = GetBool(@"11.1", NO, @"com.randy420.tai");
	self.elevenTwo = GetBool(@"11.2", NO, @"com.randy420.tai");
	self.elevenThree = GetBool(@"11.3", NO, @"com.randy420.tai");
	self.elevenFour = GetBool(@"11.4", NO, @"com.randy420.tai");
	self.twelveOneTwo = GetBool(@"12.1.2", NO, @"com.randy420.tai");
	self.twelveTwo = GetBool(@"12.2", NO, @"com.randy420.tai");
	self.twelveFour = GetBool(@"12.4", YES, @"com.randy420.tai");
	self.thirteen = GetBool(@"13.0", NO, @"com.randy420.tai");
	self.thirteenTwo = GetBool(@"13.2", NO, @"com.randy420.tai");
	self.thirteenFour = GetBool(@"13.4", NO, @"com.randy420.tai");
	self.thirteenFive = GetBool(@"13.5", YES, @"com.randy420.tai");
	self.fourteen = GetBool(@"14.0", NO, @"com.randy420.tai");
	self.fourteenOne = GetBool(@"14.1", NO, @"com.randy420.tai");
	self.fourteenTwo = GetBool(@"14.2", NO, @"com.randy420.tai");
	self.fourteenThree = GetBool(@"14.3", NO, @"com.randy420.tai");
	self.fourteenFour = GetBool(@"14.4", NO, @"com.randy420.tai");
	self.fourteenFive = GetBool(@"14.5", NO, @"com.randy420.tai");

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
		printf("%s\n\n", [leaf UTF8String]);
		sleep(1);
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

	Link = [NSString stringWithFormat:@"https://www.dropbox.com/s/%@", Link];
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
		[self sdk:@"8.4" Link:@"pt9xa1cxf7tbiu5/8.4.zip"];
		[self sdk:@"9.3" Link:@"8qhz72yeumz5swy/9.3.zip"];
		[self sdk:@"10.0" Link:@"19vezfdtnp074kt/10.0.zip"];
		[self sdk:@"10.3" Link:@"fdze31wrnukk3t7/10.3.zip"];
		[self sdk:@"11.0" Link:@"hwg97eqgskbyyr1/11.0.zip"];
		[self sdk:@"11.1" Link:@"m7n5iflnt2b0a46/11.1.zip"];
		[self sdk:@"11.2" Link:@"ak3bjqi4nz0yo0w/11.2.zip"];
		[self sdk:@"11.3" Link:@"taxziihftkm1z4d/11.3.zip"];
		[self sdk:@"11.4" Link:@"l0r7yz0ggffb0zn/11.4.zip"];
		[self sdk:@"12.1.2" Link:@"2zxfr7qk3fcnm8f/12.1.2.zip"];
		[self sdk:@"12.2" Link:@"l85lp0lbrztbdun/12.2.zip"];
		[self sdk:@"12.4" Link:@"s3dmz4bqx3ayixm/12.4.zip"];
		[self sdk:@"13.0" Link:@"fujs52jmc6vdh37/13.0.zip"];
		[self sdk:@"13.2" Link:@"wq1ri0gtxk3ofww/13.2.zip"];
		[self sdk:@"13.4" Link:@"hxtkxy9c1fu71nq/13.4.zip"];
		[self sdk:@"13.5" Link:@"ztqcfo7okv6276p/13.5.zip"];
		[self sdk:@"14.0" Link:@"ly8627ncpaiv6ji/14.0.zip"];
		[self sdk:@"14.1" Link:@"jvonok3de24ibsz/14.1.zip"];
		[self sdk:@"14.2" Link:@"71n5fslaz5uiwc3/14.2.zip"];
		[self sdk:@"14.3" Link:@"ggydf4vh3kwafdi/14.3.zip"];
		[self sdk:@"14.4" Link:@"d47tnjb1cfizj61/14.4.zip"];
		[self sdk:@"14.5" Link:@"t10nazl6vo20ya7/14.5.zip"];
		return;
	}
	self.eightFour ? [self sdk:@"8.4" Link:@"pt9xa1cxf7tbiu5/8.4.zip"] : 0;
	self.nineThree ? [self sdk:@"9.3" Link:@"8qhz72yeumz5swy/9.3.zip"] : 0;
	self.ten ? [self sdk:@"10.0" Link:@"19vezfdtnp074kt/10.0.zip"] : 0;
	self.tenThree ? [self sdk:@"10.3" Link:@"fdze31wrnukk3t7/10.3.zip"] : 0;
	self.eleven ? [self sdk:@"11.0" Link:@"hwg97eqgskbyyr1/11.0.zip"] : 0;
	self.elevenOne ? [self sdk:@"11.1" Link:@"m7n5iflnt2b0a46/11.1.zip"] : 0;
	self.elevenTwo ? [self sdk:@"11.2" Link:@"ak3bjqi4nz0yo0w/11.2.zip"] : 0;
	self.elevenThree ? [self sdk:@"11.3" Link:@"taxziihftkm1z4d/11.3.zip"] : 0;
	self.elevenFour ? [self sdk:@"11.4" Link:@"l0r7yz0ggffb0zn/11.4.zip"] : 0;
	self.twelveOneTwo ? [self sdk:@"12.1.2" Link:@"2zxfr7qk3fcnm8f/12.1.2.zip"] : 0;
	self.twelveTwo ? [self sdk:@"12.2" Link:@"l85lp0lbrztbdun/12.2.zip"] : 0;
	self.twelveFour ? [self sdk:@"12.4" Link:@"s3dmz4bqx3ayixm/12.4.zip"] : 0;
	self.thirteen ? [self sdk:@"13.0" Link:@"fujs52jmc6vdh37/13.0.zip"] : 0;
	self.thirteenTwo ? [self sdk:@"13.2" Link:@"wq1ri0gtxk3ofww/13.2.zip"] : 0;
	self.thirteenFour ? [self sdk:@"13.4" Link:@"hxtkxy9c1fu71nq/13.4.zip"] : 0;
	self.thirteenFive ? [self sdk:@"13.5" Link:@"ztqcfo7okv6276p/13.5.zip"] : 0;
	self.fourteen ? [self sdk:@"14.0" Link:@"ly8627ncpaiv6ji/14.0.zip"] : 0;
	self.fourteenOne ? [self sdk:@"14.1" Link:@"jvonok3de24ibsz/14.1.zip"] : 0;
	self.fourteenTwo ? [self sdk:@"14.2" Link:@"71n5fslaz5uiwc3/14.2.zip"] : 0;
	self.fourteenThree ? [self sdk:@"14.3" Link:@"ggydf4vh3kwafdi/14.3.zip"] : 0;
	self.fourteenFour ? [self sdk:@"14.4" Link:@"d47tnjb1cfizj61/14.4.zip"] : 0;
	self.fourteenFive ? [self sdk:@"14.5" Link:@"t10nazl6vo20ya7/14.5.zip"] : 0;
}

/*-(void)upDateTheos {
	[self RunCMD: @"echo \"$THEOS/bin/update-theos\" | gap" WaitUntilExit: YES];
	self.theosUpdate = YES;
}*/

-(void)enhancer{
	if (self.enhance) {
		if ([fm fileExistsAtPath:installHere]) {
			runCode = [NSString stringWithFormat:@"echo \"curl -LO https://dropbox.com/s/ya3i2fft4dqvccm/includes.zip\" | gap;TMP=$(mktemp -d);echo \"unzip includes.zip -d $TMP\" | gap;echo \"mv $TMP/include/* %@/include\" | gap;echo \"mv $TMP/lib/* %@/lib\" | gap;echo \"mv $TMP/templates/* %@/templates\" | gap;echo \"mv $TMP/vendor/* %@/vendor\" | gap;echo;echo \"rm -r includes.zip $TMP\" | gap;", installHere, installHere, installHere, installHere];
			[self RunCMD:runCode WaitUntilExit: YES];
		}
		if ([fm fileExistsAtPath:@"/theos/vendor/templates/test.sh"] || [fm fileExistsAtPath:@"/var/theos/vendor/templates/test.sh"]) {
			self.enhanced = YES;
		}
	}
}

-(void)addMsg: (NSString *)addMsg{
	msg = [NSString stringWithFormat:@"%@%@\n", msg, addMsg];
}

-(void)popup{
	[self addMsg:leaf];
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