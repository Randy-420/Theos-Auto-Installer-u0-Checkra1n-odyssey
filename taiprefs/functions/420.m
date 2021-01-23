#include <spawn.h>
#include "420.h"
#define _POSIX_SPAWN_DISABLE_ASLR 0x0100
#define _POSIX_SPAWN_ALLOW_DATA_EXEC 0x2000
extern char **environ;

void Run_CMDDER(const char *cmd) {
	pid_t pid;
	const char *argv[] = {"sh", "-c", cmd, NULL};
    
	int status;
    
	status = posix_spawn(&pid, "/bin/sh", NULL, NULL, (char* const*)argv, environ);
    
	if (status == 0) {
		if (waitpid(pid, &status, 0) != -1) {
            
		} else {
			perror("waitpid");
		}
	} else {

	}   
}
@implementation tai
id CC(NSString *CMD) {

    return [NSString stringWithFormat:@"echo \"%@\" | GaPp",CMD];
}

-(void) RunRoot:(NSString *)RunRoot WaitUntilExit:(BOOL)WaitUntilExit {
          NSString *RunCC = [NSString stringWithFormat:@"%@",CC(RunRoot)];
    
          NSTask *task = [[NSTask alloc] init];
          NSMutableArray *args = [NSMutableArray array];
          [args addObject:@"-c"];
          [args addObject:RunCC];
          [task setLaunchPath:@"/bin/sh"];
          [task setArguments:args];
          [task launch];
         
          if (WaitUntilExit)
          [task waitUntilExit];
    
}

-(NSString *) RunRoot:(NSString *)RunRoot {
    
          NSString *RunCC = [NSString stringWithFormat:@"%@",CC(RunRoot)];
           
           
          NSTask *task = [[NSTask alloc] init];
          NSMutableArray *args = [NSMutableArray array];
          [args addObject:@"-c"];
          [args addObject:RunCC];
          [task setLaunchPath:@"/bin/sh"];
          [task setArguments:args];
          NSPipe *outputPipe = [NSPipe pipe];
          [task setStandardInput:[NSPipe pipe]];
          [task setStandardOutput:outputPipe];
          [task launch];
          [task waitUntilExit];


    NSData *outputData = [[outputPipe fileHandleForReading] readDataToEndOfFile];
    NSString *outputString = [[NSString alloc] initWithData:outputData encoding:NSUTF8StringEncoding];
       
       return outputString;
    
}
-(void) RunCMD:(NSString *)RunCMD WaitUntilExit:(BOOL)WaitUntilExit {
    
    
    if (WaitUntilExit) {
        
        NSString *SSHGetFlex = [NSString stringWithFormat:@"%@",RunCMD];

        NSTask *task = [[NSTask alloc] init];
        NSMutableArray *args = [NSMutableArray array];
        [args addObject:@"-c"];
        [args addObject:SSHGetFlex];
        [task setLaunchPath:@"/bin/sh"];
        [task setArguments:args];
        [task launch];
        [task waitUntilExit];
        
    } else {
    
    
    NSString *SSHGetFlex = [NSString stringWithFormat:@"%@",RunCMD];

    NSTask *task = [[NSTask alloc] init];
    NSMutableArray *args = [NSMutableArray array];
    [args addObject:@"-c"];
    [args addObject:SSHGetFlex];
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:args];
    [task launch];
        
    }
    
    
}

-(void) RunCMD:(NSString *)RunCMD {
    
    NSString *CMDFormater = [NSString stringWithFormat:@"%@",RunCMD];
    const char *Run = [CMDFormater UTF8String];
    Run_CMDDER(Run);
        
}
-(void)makeTweaksFolder {
	if (![fileManager fileExistsAtPath : @"/var/mobile/tweaks"]) {
		runCode = [NSString stringWithFormat:@"echo \"mkdir /var/mobile/tweaks\" | GaPp"];
		[self RunCMD:runCode  WaitUntilExit: YES] ;
		if ([fileManager fileExistsAtPath : @"/var/mobile/tweaks"]) {
			tweaksMade = YES;
			folderFailed = NO;
		}
		else {
			folderFailed = YES;
			tweaksMade = NO;
		}
	}
}

-(BOOL)theosInstall {
	attempted = YES;
	if (!installedTheos && !installedVarTheos) {
		previousInstall = NO;
		runCode = [NSString stringWithFormat:@"echo \"git clone --recursive https://github.com/theos/theos.git %@\" | GaPp", installHere];
		[self RunCMD:runCode WaitUntilExit: YES] ;
		if ([fileManager fileExistsAtPath : installHere]) {
			installSuccess = YES;
		}else {
			installSuccess = NO;
			failed = YES;
			return NO;
		}
	}
	else {
		previousInstall = YES;
	}
	return YES;
}

-(void)loader{
	progName = @"Theos Auto Installer";
	fileManager = NSFileManager.defaultManager;
	installedTheos = [fileManager fileExistsAtPath : @"/theos"];
	installedVarTheos = [fileManager fileExistsAtPath : @"/var/theos"];
	preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.randy420.tai.plist"];
	installHere = ([preferences objectForKey:@"Location"] ? [[preferences objectForKey:@"Location"] stringValue] : @"/var/theos");
	enhance = ([preferences objectForKey:@"enhance"] ? [[preferences objectForKey:@"enhance"] boolValue] : NO);
	all = ([preferences objectForKey:@"sdks-master"] ? [[preferences objectForKey:@"sdks-master"] boolValue] : NO);
	nineThree = ([preferences objectForKey:@"9.3"] ? [[preferences objectForKey:@"9.3"] boolValue] : YES);
	tenThree = ([preferences objectForKey:@"10.3"] ? [[preferences objectForKey:@"10.3"] boolValue] : NO);
	elevenTwo = ([preferences objectForKey:@"11.2"] ? [[preferences objectForKey:@"11.2"] boolValue] : NO);
	twelveOneTwo = ([preferences objectForKey:@"12.1.2"] ? [[preferences objectForKey:@"12.1.2"] boolValue] : NO);
	twelveFour = ([preferences objectForKey:@"12.4"] ? [[preferences objectForKey:@"12.4"] boolValue] : YES);
	thirteen = ([preferences objectForKey:@"13.0"] ? [[preferences objectForKey:@"13.0"] boolValue] : NO);
	thirteenFour = ([preferences objectForKey:@"13.4"] ? [[preferences objectForKey:@"13.4"] boolValue] : NO);
	thirteenFive = ([preferences objectForKey:@"13.5"] ? [[preferences objectForKey:@"13.5"] boolValue] : YES);
	fourteen = ([preferences objectForKey:@"14.0"] ? [[preferences objectForKey:@"14.0"] boolValue] : NO);
/*	[preferences registerBool:&enhance default:NO forKey:@"enhance"];
	[preferences registerBool:&all default:NO forKey:@"sdks-master"];
	[preferences registerBool:&nineThree default:YES forKey:@"9.3"];
	[preferences registerBool:&tenThree default:NO forKey:@"10.3"];
	[preferences registerBool:&elevenTwo default:NO forKey:@"11.2"];
	[preferences registerBool:&twelveOneTwo default:NO forKey:@"12.1.2"];
	[preferences registerBool:&twelveFour default:YES forKey:@"12.4"];
	[preferences registerBool:&thirteen default:NO forKey:@"13.0"];
	[preferences registerBool:&thirteenFour default:NO forKey:@"13.4"];
	[preferences registerBool:&thirteenFive default:YES forKey:@"13.5"];*/

	badUdid = NO;
	tweaksMade = NO;
	folderFailed = NO;
	enhanced = NO;
	alreadyHas = NO;
	failure = NO;
	theosUpdate = NO;
	installSuccess = NO;
	previousInstall = YES;
	attempted = NO;
	failed = NO;
	PoPuP = YES;
	saveUDIDOnDecline = YES;

	totalDownloaded = 0;

	if (useColor) {
		successfulSdk = [NSString stringWithFormat:@"[%sSuccessfully downloaded SDKS%s]\n", c_green, c_reset];
		failedSdk = [NSString stringWithFormat:@"[%sFailed Downloading SDKS%s]\n", c_red, c_reset];
		enhanceMsg = [NSString stringWithFormat:@"[%sDev Tools Installed%s]\n", c_green, c_reset];
		ignored = [NSString stringWithFormat:@"[%sPreviously installed SDKS%s]\n", c_yellow, c_reset];
		tFolderSuc = [NSString stringWithFormat:@"[%sTweaks folder created successfully%s]\n", c_green, c_reset];
		tFolderFail = [NSString stringWithFormat:@"[%sFailed to make /var/mobile/tweaks%s]\n", c_red, c_reset];
		tFolderIgnore = [NSString stringWithFormat:@"[%stweaks folder already exists%s]\n", c_yellow, c_reset];
		updated = [NSString stringWithFormat:@"[%sTheos is now Up-To-Date%s]\n", c_green, c_reset];
		theosFailureMessage = [NSString stringWithFormat:@"[%sTheos install FAILED!%s]\n", c_red, c_reset];
		theosSuccessMessage = [NSString stringWithFormat:@"[%sTheos installed To '/theos'%s]\n", c_green, c_reset];
		if (installedTheos && installedVarTheos){
			previousInstallMsg = [NSString stringWithFormat:@"[%sTheos previously installed to '%s/theos%s' & '%s/var/theos%s'%s]\n", c_yellow, c_red, c_yellow, c_red, c_yellow, c_reset];
		} else if (installedVarTheos){
			previousInstallMsg = [NSString stringWithFormat:@"[%sTheos previously installed to '%s/var/theos%s'%s]\n", c_yellow, c_red, c_yellow, c_reset];
		} else {
			previousInstallMsg = [NSString stringWithFormat:@"[%sTheos previously installed to '%s/theos%s'%s]\n", c_yellow, c_red, c_yellow, c_reset];
		}
	} else {
		successfulSdk = @"[Successfully downloaded SDKS]\n";
		failedSdk = @"[Failed Downloading SDKS]\n";
		enhanceMsg = @"[Dev Tools Installed]\n";
		ignored = @"[Ignored Previously Installed SDKS]\n";
		tFolderSuc = @"[Tweaks folder created successfully]\n";
		tFolderFail = @"[Failed to make /var/mobile/tweaks]\n";
		tFolderIgnore = @"[tweaks folder already exists]\n";
		updated = @"[Theos is now Up-To-Date]\n";
		theosFailureMessage = @"[Theos install FAILED!]\n";
		if ([installHere isEqualToString:@"/theos"]) {
			theosSuccessMessage = @"[Theos installed To '/theos']\n";
		} else {
			theosSuccessMessage = @"[Theos installed To '/var/theos']\n";
		}
		if (installedTheos && installedVarTheos){
			previousInstallMsg = [NSString stringWithFormat:@"[Theos previously installed to '/theos' & '/var/theos']\n"];
		} else if (installedVarTheos){
			previousInstallMsg = [NSString stringWithFormat:@"[Theos previously installed to '/var/theos']\n"];
		} else {
			previousInstallMsg = [NSString stringWithFormat:@"[Theos previously installed to '/theos']\n"];
		}
	}
	udidFail = [NSString stringWithFormat:@"[Your UDID Was NOT Accepted!]\nPlease pay for your version of %s.\n", [progName UTF8String]];
	msg = @"";
}

-(bool)sdk:(NSString *)sdk Link:(NSString *)Link {
	Loc = [NSString stringWithFormat:@"/theos/sdks/iPhoneOS%s.sdk", [sdk UTF8String]];
	if (![fileManager fileExistsAtPath: Loc]) {
		runCode = [NSString stringWithFormat:@"echo \"curl -LO %s\" | GaPp;TMP=$(mktemp -d);echo \"unzip %s.zip -d $TMP\" | GaPp;echo \"mv $TMP/*.sdk %@/sdks;echo\" | GaPp;echo \"rm -r %s.zip $TMP\" | GaPp", [Link UTF8String], [sdk UTF8String], installHere, [sdk UTF8String]];
		[self RunCMD:runCode WaitUntilExit: YES];
		totalDownloaded += 1;
		if ([fileManager fileExistsAtPath: Loc]) {
			if (useColor) {
				successfulSdk = [NSString stringWithFormat:@"%s%siPhoneOS %s SDK%s\n", [successfulSdk UTF8String], c_green, [sdk UTF8String], c_reset];
			} else {
				successfulSdk = [NSString stringWithFormat:@"%siPhoneOS %s SDK\n", [successfulSdk UTF8String], [sdk UTF8String]];
			}
			return (YES);
		} else {
			if (useColor) {
				failedSdk = [NSString stringWithFormat:@"%s%siPhoneOS %s SDK%s\n", [failedSdk UTF8String], c_red, [sdk UTF8String], c_reset];
			} else {
				failedSdk = [NSString stringWithFormat:@"%siPhoneOS %s SDK\n", [failedSdk UTF8String], [sdk UTF8String]];
			}
			failure = YES;
			return (NO);
		}
	} else {
		alreadyHas = YES;
		if (useColor) {
			ignored = [NSString stringWithFormat:@"%s%siPhoneOS %s SDK%s\n", [ignored UTF8String], c_yellow, [sdk UTF8String], c_reset];
		} else {
			ignored = [NSString stringWithFormat:@"%siPhoneOS %s SDK\n", [ignored UTF8String], [sdk UTF8String]];
		}
	}
	return (YES);
}

-(void)DoWnLoAd {
	if (all) {
		[self sdk:@"9.3" Link:@"https://www.dropbox.com/s/8qhz72yeumz5swy/9.3.zip"];
		[self sdk:@"10.3" Link:@"https://www.dropbox.com/s/fdze31wrnukk3t7/10.3.zip"];
		[self sdk:@"11.2" Link:@"https://www.dropbox.com/s/ak3bjqi4nz0yo0w/11.2.zip"];
		[self sdk:@"12.1.2" Link:@"https://www.dropbox.com/s/2zxfr7qk3fcnm8f/12.1.2.zip"];
		[self sdk:@"12.4" Link:@"https://www.dropbox.com/s/s3dmz4bqx3ayixm/12.4.zip"];
		[self sdk:@"13.0" Link:@"https://www.dropbox.com/s/fujs52jmc6vdh37/13.0.zip"];
		[self sdk:@"13.4" Link:@"https://www.dropbox.com/s/hxtkxy9c1fu71nq/13.4.zip"];
		[self sdk:@"13.5" Link:@"https://www.dropbox.com/s/ztqcfo7okv6276p/13.5.zip"];
		[self sdk:@"14.0" Link:@"https://www.dropbox.com/s/ly8627ncpaiv6ji/14.0.zip"];
	}else{
		nineThree ? [self sdk:@"9.3" Link:@"https://www.dropbox.com/s/8qhz72yeumz5swy/9.3.zip"] : 0;
		tenThree ? [self sdk:@"10.3" Link:@"https://www.dropbox.com/s/fdze31wrnukk3t7/10.3.zip"] : 0;
		elevenTwo ? [self sdk:@"11.2" Link:@"https://www.dropbox.com/s/ak3bjqi4nz0yo0w/11.2.zip"] : 0;
		twelveOneTwo ? [self sdk:@"12.1.2" Link:@"https://www.dropbox.com/s/2zxfr7qk3fcnm8f/12.1.2.zip"] : 0;
		twelveFour ? [self sdk:@"12.4" Link:@"https://www.dropbox.com/s/s3dmz4bqx3ayixm/12.4.zip"] : 0;
		thirteen ? [self sdk:@"13.0" Link:@"https://www.dropbox.com/s/fujs52jmc6vdh37/13.0.zip"] : 0;
		thirteenFour ? [self sdk:@"13.4" Link:@"https://www.dropbox.com/s/hxtkxy9c1fu71nq/13.4.zip"] : 0;
		thirteenFive ? [self sdk:@"13.5" Link:@"https://www.dropbox.com/s/ztqcfo7okv6276p/13.5.zip"] : 0;
		fourteen ? [self sdk:@"14.0" Link:@"https://www.dropbox.com/s/ly8627ncpaiv6ji/14.0.zip"] : 0;
	}
}

-(void)upDateTheos {
	[self RunCMD: @"echo \"$THEOS/bin/update-theos\" | GaPp" WaitUntilExit: YES];
	theosUpdate = YES;
}

-(void)enhancer{
	if ([fileManager fileExistsAtPath:@"/theos"]){
		if (enhance){
			runCode = [NSString stringWithFormat:@"echo \"curl -LO https://www.dropbox.com/s/ya3i2fft4dqvccm/includes.zip\" | GaPp;TMP=$(mktemp -d);echo \"unzip includes.zip -d $TMP\" | GaPp;echo \"mv $TMP/include/* /theos/include\" | GaPp;echo \"mv $TMP/lib/* %@/lib\" | GaPp;echo \"mv $TMP/templates/* %@/templates\" | GaPp;echo \"mv $TMP/vendor/* %@/vendor\" | GaPp;echo;echo \"rm -r includes.zip $TMP\" | GaPp;", installHere, installHere, installHere];
			[self RunCMD:runCode WaitUntilExit: YES];
		if ([fileManager fileExistsAtPath:@"/theos/vendor/templates/test.sh"])
			enhanced = YES;
		}
	}
}

-(int)Decrypt:(NSString *)uKey{key = [NSString stringWithFormat:@"%@", uKey];hashedKey = [CRYPT0 bddbeh7xeub7edshs:key dbddhex7buh7dchhs:db7bbhbchex7hb7sh256];decrypt = [current bdbdbehxuebe7bshs:nil key:hashedKey];return 1;}

-(BOOL)udidCheck:(NSString *)crypt0 prefPLIsT:(NSString *)prefPLIsT path:(NSString *)path {
	udidDevice = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice] _deviceInfoForKey:@"UniqueDeviceID"]];
	current = [preferences objectForKey:@"activationKey"];
	if (current != nil && current != NULL && ![current isEqual: @""]) {
		[self Decrypt:crypt0];
		if ([udidDevice isEqualToString:decrypt]){
			return YES;
		}
	}
	NSDictionary *file = [NSDictionary dictionaryWithContentsOfURL:[NSURL URLWithString:path]];
	NSDictionary *currentPlistV;
	NSArray *allKeys = file[@"keys"];
	unsigned long allKeysCount = allKeys.count;
	for (unsigned int choose = 0; choose < allKeysCount; choose++) {
		currentPlistV = allKeys[choose];
		current = [NSString stringWithFormat: @"%s", [currentPlistV[@"accepted"] UTF8String]];
		if (current != nil && current != NULL && ![current isEqual: @""]) {
			[self Decrypt:[NSString stringWithFormat:@"%@", crypt0]];
			if ([udidDevice isEqualToString:decrypt]){
				//[Prefs setObject:current forKey:@"activationKey"];
				[preferences setObject:current forKey: @"activationKey"];


				//[preferences writeToFile:@"/var/mobile/Library/Preferences/com.randy420.tai.plist" automically:YES];
				
				
				return YES;
			}
		}
	}
	if (saveUDIDOnDecline) {
		FILE *hideLog = freopen("/dev/null", "w", stderr);
		UIPasteboard.generalPasteboard.string = udidDevice;
		fclose(hideLog);
	}
	badUdid = YES;
	return NO;
}

-(void)addMsg: (NSString *)mSg{
	msg = [NSString stringWithFormat:@"%@%@\n", msg, mSg];
}

-(void)popup{
	badUdid ? [self addMsg:udidFail] : 0;
	theosUpdate ? [self addMsg:updated] : 0;
	installSuccess ? [self addMsg:theosSuccessMessage] : 0;
	if (!theosUpdate) {
		if (!badUdid) {
			if (!folderFailed && tweaksMade) {
			   [self addMsg:tFolderSuc];
			} else if (folderFailed && !tweaksMade) {
				[self addMsg:tFolderFail];
			} else if (!folderFailed && !tweaksMade) {
			   [self addMsg:tFolderIgnore];
			}
		}
	}
	if (attempted && failed && (!(previousInstall && installSuccess))) {
		[self addMsg:theosFailureMessage];
	}
	if (attempted && previousInstall){
		[self addMsg:previousInstallMsg];
	}

	enhanced ? [self addMsg:enhanceMsg] : 0;

	if (totalDownloaded >= 1){
		[self addMsg:successfulSdk];
	}
	alreadyHas ? [self addMsg:ignored] : 0;
	failure ? [self addMsg:failedSdk] : 0;

	if (PoPuP) {
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Installation Results" message: msg preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		
		}];
		[alert addAction:action];
		[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
	} else {
		printf("%s\n", [msg UTF8String]);
	}
}
-(void)popup:(BOOL)letRun{
	(badUdid && !letRun) ? [self addMsg:udidFail] : 0;
	theosUpdate ? [self addMsg:updated] : 0;
	installSuccess ? [self addMsg:theosSuccessMessage] : 0;
	if (!theosUpdate) {
		if (!badUdid || letRun) {
			if (!folderFailed && tweaksMade) {
			   [self addMsg:tFolderSuc];
			} else if (folderFailed && !tweaksMade) {
				[self addMsg:tFolderFail];
			} else if (!folderFailed && !tweaksMade) {
			   [self addMsg:tFolderIgnore];
			}
		}
	}
	if (attempted && failed && (!(previousInstall && installSuccess))) {
		[self addMsg:theosFailureMessage];
	}
	if (attempted && previousInstall){
		[self addMsg:previousInstallMsg];
	}

	enhanced ? [self addMsg:enhanceMsg] : 0;

	if (totalDownloaded >= 1){
		[self addMsg:successfulSdk];
	}
	alreadyHas ? [self addMsg:ignored] : 0;
	failure ? [self addMsg:failedSdk] : 0;

	if (PoPuP) {
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Installation Results" message: msg preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		
		}];
		[alert addAction:action];
		[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
	} else {
		printf("%s\n", [msg UTF8String]);
	}
}
@end