#include "420.h"
#define _POSIX_SPAWN_DISABLE_ASLR 0x0100
#define _POSIX_SPAWN_ALLOW_DATA_EXEC 0x2000
extern char **environ;

@implementation tai
-(void) RunCMD:(NSString *)RunCMD WaitUntilExit:(BOOL)WaitUntilExit {
	if (self.abyss)
		RunCMD = [RunCMD stringByReplacingOccurrencesOfString: @"\" | gap" withString:@">/dev/null 2>&1\" | gap"];

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

-(void)fixTheos{
	if (!self.previousInstall){
		[self Print:checkInstall];
		return;
	}
	runCode = @"echo \"fixTheos\" | gap";
	[self RunCMD:runCode WaitUntilExit:YES];
}

-(void)makeTweaksFolder {
	if (!self.tweaksExists) {
		runCode = [NSString stringWithFormat:@"echo \"mkdir /var/mobile/tweaks\" | gap"];
		[self RunCMD:runCode WaitUntilExit: YES] ;

		self.tweaksMade = [fm fileExistsAtPath:@"/var/mobile/tweaks"];
		self.folderFailed = !self.tweaksMade;
	}
}

-(BOOL)theosInstall {
	self.attempted = YES;

	if (!(self.installedTheos || self.installedVarTheos)) {
		runCode = [NSString stringWithFormat:@"echo \"git clone --recursive https://github.com/theos/theos.git %@\" | gap", installHere];
		[self RunCMD:runCode WaitUntilExit: YES];
		[self updateInstall];
		self.installSuccess = [fm fileExistsAtPath:installHere];

		if (self.installSuccess)
			return YES;

		self.failed = YES;
	}
	return NO;
}

-(void)updateInstall{
	self.installedTheos = [fm fileExistsAtPath:@"/theos"];
	self.installedVarTheos = [fm fileExistsAtPath:@"/var/theos"];
}

-(void)loader{
	fm = NSFileManager.defaultManager;
	leaf = @"\n                     .                          \n                     M                          \n                    dM                          \n                    MMr                         \n                   4MMML                  .     \n                   MMMMM.                xf     \n   .              \"MMMMM               .MM-     \n    Mh..          +MMMMMM            .MMMM      \n    .MMM.         .MMMMML.          MMMMMh      \n     )MMMh.        MMMMMM         MMMMMMM       \n      3MMMMx.     \'MMMMMMf      xnMMMMMM\"       \n      \'*MMMMM      MMMMMM.     nMMMMMMP\"        \n        *MMMMMx    \"MMMMM\\    .MMMMMMM=         \n         *MMMMMh   \"MMMMM\"   JMMMMMMP           \n           MMMMMM   3MMMM.  dMMMMMM            .\n            MMMMMM  \"MMMM  .MMMMM(        .nnMP\"\n=..          *MMMMx  MMM\"  dMMMM\"    .nnMMMMM*  \n  \"MMn...     \'MMMMr \'MM   MMM\"   .nMMMMMMM*\"   \n   \"4MMMMnn..   *MMM  MM  MMP\"  .dMMMMMMM\"\"     \n     ^MMMMMMMMx.  *ML \"M .M*  .MMMMMM**\"        \n        *PMMMMMMhn. *x > M  .MMMM**\"\"           \n           \"\"**MMMMhx/.h/ .=*\"                  \n                    .3P\"%....";

	leaf = [NSString stringWithFormat:@"%s%@%s\n", c_green, leaf, c_reset];
	leaf = [NSString stringWithFormat:@"%@\t     %sT%sheos %sA%suto %sI%snstaller%s\n", leaf, c_red, c_cyan, c_red, c_cyan, c_red, c_cyan, c_reset];
	leaf = [NSString stringWithFormat:@"%@%s                     Randy420%s\n\n", leaf, c_red, c_reset];
	installHere = GetNSString(@"Location", @"/var/theos", @"com.randy420.tai");

	self.autoRm = GetBool(@"autoRm", YES, @"com.randy420.tai");
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
	//self.fourteenFive = GetBool(@"14.5", NO, @"com.randy420.tai");

	[self updateInstall];
	self.previousInstall = (self.installedTheos || self.installedVarTheos);
	self.installFirst = NO;

	self.tweaksExists = [fm fileExistsAtPath:@"/var/mobile/tweaks"];

	self.tweaksMade = NO;
	self.folderFailed = NO;
	self.enhanced = NO;
	self.alreadyHas = NO;
	self.failure = NO;
	self.theosUpdate = NO;
	self.theosUpdateFail = NO;
	self.installSuccess = NO;
	self.attempted = NO;
	self.failed = NO;
	self.PoPuP = YES;
	self.totalDownloaded = 0;

	successfulSdk = [NSString stringWithFormat:@"[%s%@ SDKS%s]\n", c_green, local(@"DOWNLOAD_SUCCESS", @"Successfully downloaded"), c_reset];
	failedSdk = [NSString stringWithFormat:@"[%s%@ SDKS%s]\n", c_red, local(@"FAILED_INSTALLING", @"Failed Installing"), c_reset];
	enhanceMsg = [NSString stringWithFormat:@"[%s%@%s]\n", c_green, local(@"DEV_INSTALLED", @"Dev Tools Installed"), c_reset];
	ignored = [NSString stringWithFormat:@"[%s%@ SDKS%s]\n", c_yellow, local(@"PREVIOUS", @"Previously installed"), c_reset];
	tFolderSuc = [NSString stringWithFormat:@"[%s/var/mobile/tweaks/ %@%s]\n", c_green, local(@"FOLDER_SUCCESS", @"folder created successfully"), c_reset];
	tFolderFail = [NSString stringWithFormat:@"[%s%@ /var/mobile/tweaks%s]\n", c_red, local(@"FOLDER_FAIL", @"Failed to create"), c_reset];
	updated = [NSString stringWithFormat:@"[%s%@%s]\n", c_green, local(@"UPDATED", @"Theos is now Up-To-Date"), c_reset];
	updateFail = [NSString stringWithFormat:@"[%s%@%s]\n", c_red, local(@"NOT_INSTALLED_FAIL", @"Theos is not installed. Unable to update Theos"), c_reset];
	theosFailureMessage = [NSString stringWithFormat:@"[%s%@!%s]\n", c_red, local(@"INSTALL_FAIL", @"Theos install FAILED"), c_reset];
	theosSuccessMessage = [NSString stringWithFormat:@"[%s%@ '%@'%s]\n", c_green, local(@"INSTALED_TO", @"Theos installed To"), installHere, c_reset];
	checkInstall = [NSString stringWithFormat:@"[%s!!%@\n%@ '%stai%s'!!%s]\n", c_cyan, local(@"NOT_INSTALLED", @"Theos isn't installed yet."), local(@"PLEASE_INSTALL", @"Please install Theos using"), c_red, c_cyan, c_reset];
	failedRm = [NSString stringWithFormat:@"[%s%@: '%@/SDKS/'%s]\n", c_red, local(@"REMOVE_FAIL", @"Failed To Remove SDKS From"), installHere, c_reset];
	successfulRm = [NSString stringWithFormat:@"[%s%@: '%@/SDKS/'%s]\n", c_green, local(@"REMOVED", @"SDKS Removed From"), installHere, c_reset];
	if (self.installedTheos && self.installedVarTheos) {
		previousInstallMsg = [NSString stringWithFormat:@"[%s%@ '%s/theos%s' & '%s/var/theos%s'%s]\n", c_yellow, local(@"PREVIOUSLY_INSTALLED", @"Theos previously installed to"), c_red, c_yellow, c_red, c_yellow, c_reset];
	} else if (self.installedVarTheos) {
		previousInstallMsg = [NSString stringWithFormat:@"[%s%@ '%s/var/theos%s'%s]\n", c_yellow, local(@"PREVIOUSLY_INSTALLED", @"Theos previously installed to"), c_red, c_yellow, c_reset];
	} else {
		previousInstallMsg = [NSString stringWithFormat:@"[%s%@ '%s/theos%s'%s]\n", c_yellow, local(@"PREVIOUSLY_INSTALLED", @"Theos previously installed to"), c_red, c_yellow, c_reset];
	}
	msg = @"";
}

-(bool)sdk:(NSString *)sdk Link:(NSString *)Link {
	Link = [NSString stringWithFormat:@"https://dropbox.com/s/%@/%@.zip", Link, sdk];
	Loc = [NSString stringWithFormat:@"%@/sdks/iPhoneOS%@.sdk", installHere, sdk];
	if (![fm fileExistsAtPath:Loc]) {
		runCode = [NSString stringWithFormat:@"echo \"curl -LO %@\" | gap;TMP=$(mktemp -d);echo \"unzip %@.zip -d $TMP\" | gap;echo \"mv $TMP/*.sdk %@/sdks;echo\" | gap;echo \"rm -r %@.zip $TMP\" | gap", Link, sdk, installHere, sdk];
		[self RunCMD:runCode WaitUntilExit: YES];
		self.totalDownloaded += 1;
		if ([fm fileExistsAtPath: Loc]) {
			successfulSdk = [NSString stringWithFormat:@"%@%s ~iPhoneOS %@ SDK%s\n", successfulSdk, c_green, sdk, c_reset];
			return (YES);
		} else {
			failedSdk = [NSString stringWithFormat:@"%@ ~%siPhoneOS %@ SDK%s\n", failedSdk, c_red, sdk, c_reset];
			self.failure = YES;
			return (NO);
		}
	} else {
		self.alreadyHas = YES;
		ignored = [NSString stringWithFormat:@"%@%s ~iPhoneOS %@ SDK%s\n", ignored, c_yellow, sdk, c_reset];
	}
	return (YES);
}

-(void)remove:(NSString *)sdk {
	Loc = [NSString stringWithFormat:@"%@/sdks/iPhoneOS%@.sdk", installHere, sdk];
	if ([fm fileExistsAtPath:Loc]) {
		runCode = [NSString stringWithFormat:@"echo \"rm -r %@\" | gap", Loc];
		[self RunCMD:runCode WaitUntilExit: YES];
		self.totalRemoved += 1;
		if (![fm fileExistsAtPath:Loc]) {
			successfulRm = [NSString stringWithFormat:@"%@%s ~iPhoneOS %@ SDK%s\n", successfulRm, c_green, sdk, c_reset];
		} else {
			failedRm = [NSString stringWithFormat:@"%@ ~%siPhoneOS %@ SDK%s\n", failedRm, c_red, sdk, c_reset];
			self.rmFailure = YES;
		}
	}
}

-(void)DoWnLoAd {
	if (!(self.installedTheos || self.installedVarTheos)){
		self.installFirst = YES;
		return;
	}
	if (self.all) {
		[self sdk:@"8.4" Link:@"pt9xa1cxf7tbiu5"];
		[self sdk:@"9.3" Link:@"8qhz72yeumz5swy"];
		[self sdk:@"10.0" Link:@"19vezfdtnp074kt"];
		[self sdk:@"10.3" Link:@"fdze31wrnukk3t7"];
		[self sdk:@"11.0" Link:@"hwg97eqgskbyyr1"];
		[self sdk:@"11.1" Link:@"m7n5iflnt2b0a46"];
		[self sdk:@"11.2" Link:@"ak3bjqi4nz0yo0w"];
		[self sdk:@"11.3" Link:@"taxziihftkm1z4d"];
		[self sdk:@"11.4" Link:@"l0r7yz0ggffb0zn"];
		[self sdk:@"12.1.2" Link:@"2zxfr7qk3fcnm8f"];
		[self sdk:@"12.2" Link:@"l85lp0lbrztbdun"];
		[self sdk:@"12.4" Link:@"s3dmz4bqx3ayixm"];
		[self sdk:@"13.0" Link:@"fujs52jmc6vdh37"];
		[self sdk:@"13.2" Link:@"wq1ri0gtxk3ofww"];
		[self sdk:@"13.4" Link:@"hxtkxy9c1fu71nq"];
		[self sdk:@"13.5" Link:@"ztqcfo7okv6276p"];
		[self sdk:@"14.0" Link:@"ly8627ncpaiv6ji"];
		[self sdk:@"14.1" Link:@"jvonok3de24ibsz"];
		[self sdk:@"14.2" Link:@"71n5fslaz5uiwc3"];
		[self sdk:@"14.3" Link:@"ggydf4vh3kwafdi"];
		[self sdk:@"14.4" Link:@"d47tnjb1cfizj61"];
//		[self sdk:@"14.5" Link:@"t10nazl6vo20ya7"];
		[self remove:@"14.5"];
		return;
	}
	self.eightFour ? [self sdk:@"8.4" Link:@"pt9xa1cxf7tbiu5"] :self.autoRm ? [self remove:@"8.4"] :  0;
	self.nineThree ? [self sdk:@"9.3" Link:@"8qhz72yeumz5swy"] : self.autoRm ? [self remove:@"9.3"] : 0;
	self.ten ? [self sdk:@"10.0" Link:@"19vezfdtnp074kt"] : self.autoRm ? [self remove:@"10.0"] : 0;
	self.tenThree ? [self sdk:@"10.3" Link:@"fdze31wrnukk3t7"] : self.autoRm ? [self remove:@""] : 0;
	self.eleven ? [self sdk:@"11.0" Link:@"hwg97eqgskbyyr1"] : self.autoRm ? [self remove:@"11.0"] : 0;
	self.elevenOne ? [self sdk:@"11.1" Link:@"m7n5iflnt2b0a46"] : self.autoRm ? [self remove:@"11.1"] : 0;
	self.elevenTwo ? [self sdk:@"11.2" Link:@"ak3bjqi4nz0yo0w"] : self.autoRm ? [self remove:@"11.2"] : 0;
	self.elevenThree ? [self sdk:@"11.3" Link:@"taxziihftkm1z4d"] : self.autoRm ? [self remove:@"11.3"] : 0;
	self.elevenFour ? [self sdk:@"11.4" Link:@"l0r7yz0ggffb0zn"] : self.autoRm ? [self remove:@"11.4"] : 0;
	self.twelveOneTwo ? [self sdk:@"12.1.2" Link:@"2zxfr7qk3fcnm8f"] : self.autoRm ? [self remove:@"12.1.2"] : 0;
	self.twelveTwo ? [self sdk:@"12.2" Link:@"l85lp0lbrztbdun"] : self.autoRm ? [self remove:@"12.2"] : 0;
	self.twelveFour ? [self sdk:@"12.4" Link:@"s3dmz4bqx3ayixm"] : self.autoRm ? [self remove:@"12.4"] : 0;
	self.thirteen ? [self sdk:@"13.0" Link:@"fujs52jmc6vdh37"] : self.autoRm ? [self remove:@"13.0"] : 0;
	self.thirteenTwo ? [self sdk:@"13.2" Link:@"wq1ri0gtxk3ofww"] : self.autoRm ? [self remove:@"13.2"] : 0;
	self.thirteenFour ? [self sdk:@"13.4" Link:@"hxtkxy9c1fu71nq"] : self.autoRm ? [self remove:@"13.4"] : 0;
	self.thirteenFive ? [self sdk:@"13.5" Link:@"ztqcfo7okv6276p"] : self.autoRm ? [self remove:@"13.5"] : 0;
	self.fourteen ? [self sdk:@"14.0" Link:@"ly8627ncpaiv6ji"] : self.autoRm ? [self remove:@"14.0"] : 0;
	self.fourteenOne ? [self sdk:@"14.1" Link:@"jvonok3de24ibsz"] : self.autoRm ? [self remove:@"14.1"] : 0;
	self.fourteenTwo ? [self sdk:@"14.2" Link:@"71n5fslaz5uiwc3"] : self.autoRm ? [self remove:@"14.2"] : 0;
	self.fourteenThree ? [self sdk:@"14.3" Link:@"ggydf4vh3kwafdi"] : self.autoRm ? [self remove:@"14.3"] : 0;
	self.fourteenFour ? [self sdk:@"14.4" Link:@"d47tnjb1cfizj61"] : self.autoRm ? [self remove:@"14.4"] : 0;
	[self remove:@"14.5"];
	//self.fourteenFive ? [self sdk:@"14.5" Link:@"t10nazl6vo20ya7"] : 0;
}

-(void)upDateTheos {
	self.theosUpdate = YES;
	if (self.previousInstall){
		[self RunCMD: @"echo \"$THEOS/bin/update-theos\" | gap" WaitUntilExit: YES];
	} else {
		self.theosUpdateFail = YES;
	}
}

-(void)checkTerm {
	char *cterm = getenv("TERM") ?: "";
	if (!strcmp(cterm, "xterm-color")) {
		[self Print:[NSString stringWithFormat:@"%@\n", local(@"TERM", @"PLEASE RUN THEOS AUTO INSTALLER USING MTERMINAL\n-> NewTerm CRASHES")]];
		exit (0);
	}
}

-(BOOL)dTheos:(BOOL)dTheos {
	if (dTheos) {
		if (self.installedTheos && self.installedVarTheos){
			runCode = @"echo \"rm -rf /theos\" | gap;echo \"rm -rf /var/theos\" | gap";
		} else if (self.installedTheos){
			runCode = @"echo \"rm -rf /theos\" | gap";
		} else if (self.installedVarTheos){
			runCode = @"echo \"rm -rf /var/theos\" | gap";
		}

		[self RunCMD:runCode WaitUntilExit:YES];

		[self updateInstall];
		self.previousInstall = self.installedTheos && self.installedVarTheos;
		if (!self.previousInstall) {
			[self Print:[NSString stringWithFormat:@"[%sTheos %s%@ %s%@!%s]\n", c_cyan, c_red, local(@"UNINSTALLED", @"uninstaled"), c_cyan, local(@"SUCCESSFULLY", @"successfully"), c_reset]];
		} else {
			[self Print:[NSString stringWithFormat:@"[%s%@ %sTheos%s]\n", c_red, local(@"UNABLE", @"Unable to uninstall"), c_cyan, c_reset]];
			sleep(3);
			return(NO);
		}
	}
	return(YES);
}

-(void)startup{
///////////////////////////////////////
////       •Admin•Handling•        ////
///////////////////////////////////////
	self.useColor = YES;
	self.abyss = NO;
	[self loader];
	[self checkTerm];
}

-(void)enhancer{
	if (self.enhance) {
		if ([fm fileExistsAtPath:installHere]) {
			runCode = [NSString stringWithFormat:@"echo \"curl -LO https://dropbox.com/s/ya3i2fft4dqvccm/includes.zip\" | gap;TMP=$(mktemp -d);echo \"unzip includes.zip -d $TMP\" | gap;echo \"mv $TMP/include/* %@/include\" | gap;echo \"mv $TMP/lib/* %@/lib\" | gap;echo \"mv $TMP/templates/* %@/templates\" | gap;echo \"mv $TMP/vendor/* %@/vendor\" | gap;echo;echo \"rm -r includes.zip $TMP\" | gap", installHere, installHere, installHere, installHere];
			[self RunCMD:runCode WaitUntilExit: YES];
		}
		if ([fm fileExistsAtPath:@"/theos/vendor/templates/test.sh"] || [fm fileExistsAtPath:@"/var/theos/vendor/templates/test.sh"]) {
			self.enhanced = YES;
		}
	}
}

-(void)addMsg:(NSString *)addMsg{
	msg = [NSString stringWithFormat:@"%@%@\n", msg, addMsg];
}

-(void)popup{
	[self addMsg:leaf];

	self.theosUpdate ? self.theosUpdateFail ? [self addMsg:updateFail] : [self addMsg:updated] : 0;

	self.installSuccess ? [self addMsg:theosSuccessMessage] : 0;

	if (!self.theosUpdate)
		self.tweaksMade ? [self addMsg:tFolderSuc] : (self.folderFailed ? [self addMsg:tFolderFail] : 0);

	(self.attempted && self.failed && (!(self.previousInstall && self.installSuccess))) ? [self addMsg:theosFailureMessage] : 0;

	(self.attempted && self.previousInstall) ? [self addMsg:previousInstallMsg] : 0;

	self.enhanced ? [self addMsg:enhanceMsg] : 0;

	(self.totalDownloaded >= 1) ? [self addMsg:successfulSdk] : 0;

	self.alreadyHas ? [self addMsg:ignored] : 0;

	if (self.failure)
		[self addMsg:failedSdk];

	if (self.failure || self.installFirst)
		[self addMsg:checkInstall];

	self.rmFailure ? [self addMsg:failedRm] : 0;

	self.totalRemoved >= 1 ? [self addMsg:successfulRm] : 0;

	[self Print:msg];
}

-(void)header{
	[self Print:leaf];
}

-(void)Print:(NSString *)Print{
	if (!self.useColor){
		NSMutableArray *Remove = [NSMutableArray arrayWithObjects:@"\x1B[30m", @"\x1B[31m", @"\x1B[32m", @"\x1B[33m", @"\x1B[34m", @"\x1B[35m", @"\x1B[36m", @"\x1B[37m", @"\x1B[0m", @"\x1B[1m", @"\x1B[3m", @"\x1B[7m", nil];
		if (self.abyss)
			[Remove insertObject:leaf atIndex:0];

		for (unsigned int i = 0; i < [Remove count]; i++)
			Print = [Print stringByReplacingOccurrencesOfString:Remove[i] withString:@""];
	}

	printf("%s", Print.UTF8String);
}

-(void) addToProfile:(BOOL)addToProfile profile:(NSString *)profile {
	NSString *plist = @"com.randy420.tai";

	NSString *installedHere = [self installedVarTheos] ? @"/var/theos" : [self installedTheos] ? @"/theos" : @"";
	NSString *DIV = @"#######################################\n";
	NSString *DIV1 = @"#######ಠ_ಠ#####( ͠° ͟ʖ ͡°)####(•̀ᴗ•́)و######\n";
	NSString *DIV2 = @"####ADDED#BY#THEOS#AUTO#INSTALLER######\n";
	NSString *NIC = [NSString stringWithFormat:@"export nic=%@/bin/nic.pl\n", installHere];
	NSString *CD = @"export cd=\"cd /var/mobile/tweaks\"\n";
	NSString *T = @"export t=/var/mobile/tweaks\n";
	NSString *MAKEC = @"export make=\"make clean package\"\n";
	NSString *MAKE = @"export m=\"make package\"\n";
	NSString *PACKAGE = [NSString stringWithFormat:@"export THEOS_PACKAGE_DIR_NAME=\"%@\"\n", GetNSString(@"debFolder", @"DEBs", plist)];
	NSString *THEOS = ![installedHere isEqualToString:@""] ? [NSString stringWithFormat:@"export THEOS=%@\n", installedHere] : installedHere;
	NSString *DEBUG = [NSString stringWithFormat:@"export DEBUG=%@\n", GetNSString(@"debug", @"0", plist)];
	NSString *FINAL = [NSString stringWithFormat:@"export FINALPACKAGE=%@\n", GetNSString(@"finalPackage", @"1", plist)];

		NSString *Archs =@"";
		BOOL added = NO;
		static bool armv7, armv7s, arm64, arm64e;
		armv7 = GetBool(@"armv7", YES, plist);
		armv7s = GetBool(@"armv7s", YES, plist);
		arm64 = GetBool(@"arm64", YES, plist);
		arm64e = GetBool(@"arm64e", YES, plist);

		if(armv7) {
			Archs = @"armv7";
			added=YES;
		}
		if(armv7s) {
			if (added){
				Archs = [NSString stringWithFormat:@"%@ armv7s", Archs];
			} else {
				Archs = @"armv7s";
			}
			added=YES;
		}
		if(arm64) {
			if (added){
				Archs = [NSString stringWithFormat:@"%@ arm64", Archs];
			} else {
				Archs = @"arm64";
			}
			added=YES;
		}
		if(arm64e) {
			if (added){
				Archs = [NSString stringWithFormat:@"%@ arm64e", Archs];
			} else {
				Archs = @"arm64e";
			}
			added=YES;
		}
		if (!added)
			Archs = @"arm64 arm64e";
			
	NSString *ARCHS = [NSString stringWithFormat:@"export ARCHS=\"%@\"\n", Archs];

	NSString *addToFile = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@", DIV, DIV1, DIV2, DIV, THEOS, ARCHS, DEBUG, FINAL, MAKE, MAKEC, NIC, PACKAGE];

	if ([profile isEqualToString:@".profile"]){
		addToFile = [NSString stringWithFormat:@"%@%@", addToFile, CD];
	}else{
		addToFile = [NSString stringWithFormat:@"%@%@", addToFile, T];
	}

	addToFile = [NSString stringWithFormat:@"%@%@%@%@%@", addToFile, DIV, DIV2, DIV1, DIV];

	NSMutableArray *addMe = [[NSMutableArray alloc] init];

	NSString *contents = [NSString stringWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/%@", profile] encoding:NSUTF8StringEncoding error:NULL];

	NSArray *content = [contents componentsSeparatedByString:@"\n"];

	NSString *line;
	for (unsigned i = 1; i < content.count; i++){
		line = [content objectAtIndex:i-1];

		if ([line hasPrefix:@"\""])
			continue;

		if (!([line hasPrefix:@"##"] || [line hasPrefix:@"export nic="] || [line hasPrefix:@"export m="] || [line hasPrefix:@"export make="] || [line hasPrefix:@"export cd="] || [line hasPrefix:@"export t="] || [line hasPrefix:@"export THEOS="] || [line hasPrefix:@"export THEOS_PACKAGE_DIR_NAME="] || [line hasPrefix:@"export DEBUG="] || [line hasPrefix:@"export ARCHS="] || [line hasPrefix:@"export FINALPACKAGE="])){

			[addMe addObject:[NSString stringWithFormat:@"%@\n", line]];
		}
	}

	line = @"";
	for (NSString *string in addMe)
		line = [NSString stringWithFormat:@"%@%@", line, string];

	if (addToProfile)
		line = [NSString stringWithFormat:@"%@%@", line, addToFile];

	[line writeToFile:[NSString stringWithFormat:@"/var/mobile/%@", profile] atomically:YES encoding:NSUTF8StringEncoding error:NULL];

	runCode = [NSString stringWithFormat:@"echo \"chown 501:501 /var/mobile/%@;chmod +r /var/mobile/%@\" | gap", profile, profile];
	[self RunCMD:runCode WaitUntilExit:YES];
}
@end