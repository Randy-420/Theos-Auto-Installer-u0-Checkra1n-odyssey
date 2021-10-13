#include "functions/420.h"
#include "functions/profileHelper.h"
#include "functions/.profile.h"
#include "functions/.zprofile.h"

tai *TAI;
@interface taiPriv : NSObject
-(void)checkTerm;
-(BOOL)dTheos:(BOOL)dTheos;
-(void)startup;
@end

@implementation taiPriv
-(void)checkTerm {
	NSString *term = [NSString stringWithUTF8String:getenv("TERM")];
	if ([term isEqualToString: @"xterm-color"]) {
		printf("PLEASE RUN THEOS AUTO INSTALLER USING MTERMINAL\n-> NewTerm CRASHES\n");
		exit (0);
	}
}
-(BOOL)dTheos:(BOOL)dTheos {
	if (dTheos) {
		NSFileManager *fm = [[NSFileManager alloc] init];
		if ([fm removeItemAtPath:@"/theos" error:nil] || [fm removeItemAtPath:@"/var/theos" error:nil]) {
			printf("%sTheos %suninstalled %sSuccessfully!%s\n", c_cyan, c_red, c_cyan, c_reset);
		} else {
			printf("%sUnable to uninstall %sTheos%s\n", c_red, c_cyan, c_reset);
			sleep(3);
			return(NO);
		}
	}
	return(YES);
}

-(void)startup{
///////////////////////////////////////
////       Admin Handling          ////
///////////////////////////////////////
	TAI.useColor = YES;
	[TAI loader];
	[self checkTerm];
}
@end

int main(int argc, char* argv[]) {
	taiPriv *taiMain = [[taiPriv alloc] init];
	TAI = [[tai alloc] init];
	NSFileManager *fm = [[NSFileManager alloc] init];
///////////////////////////////////////
////     Declaration Handling      ////
///////////////////////////////////////
	NSString * helpme = [NSString stringWithFormat: @ "%sPlease launch'%stai%s' with one option at a time.\n"
	"%stai%s [%soption%s]%s\n"
	"-u%s Uninstall Theos.%s\n"
	"-r%s Reinstall Theos.%s\n"
	"-s%s Installenhanced dev tools & SDK files only.(requires theos to be installed already in location '/theos' or '/var/theos).\n%s", c_red, c_cyan, c_red, c_cyan, c_red, c_cyan, c_red, c_cyan, c_magenta, c_cyan, c_magenta, c_red, c_cyan, c_reset];
///////////////////////////////////////
////          Options              ////
///////////////////////////////////////
	[taiMain startup];
	TAI.PoPuP = NO;
	int opts = 0;
	int c;
	while ((c = getopt(argc, argv, ":sur")) != -1) {
		switch (c) {
			case 's':
				[TAI enhancer];
				[TAI DoWnLoAd];
				[TAI popup];
				exit (0);
			case 'u':
				opts += 1;
				Profile(NO);
				zProfile(NO);
				break;
			case 'r':
				opts += 2;
				break;
			case '?':
				printf("%s", [helpme UTF8String]);
				exit (1);
		}
	}
///////////////////////////////////////
////     Option Handling           ////
///////////////////////////////////////
	if ((opts==2) || (opts==1)){
		if (TAI.installedTheos || TAI.installedVarTheos){
			[taiMain dTheos:true];
		} else {
			printf("%stheos%s isn't installed, run the installer again\nPlease install Theos before trying to reinstall or delete it.\nಠ_ಠ\n%s", c_cyan, c_red, c_reset);
			exit (1);
		}
		if (opts==1){
			[TAI popup];
			exit(0);
		}
	}
	TAI.installedTheos = [fm fileExistsAtPath : @"/theos"];
	TAI.installedVarTheos = [fm fileExistsAtPath : @"/var/theos"];

	if (TAI.installedTheos || TAI.installedVarTheos) {
		printf("%sTheos%s already installed, run '%stai -r%s' to reinstall or '%stai -u%s' to uninstall%s\n", c_cyan, c_green, c_cyan, c_green, c_cyan, c_red, c_reset);
		exit(1);
	}
///////////////////////////////////////
////          git Theos           ////
///////////////////////////////////////
	if ([TAI theosInstall]) {
///////////////////////////////////////
////     .profile Handling         ////
///////////////////////////////////////
		Profile(YES);
		zProfile(YES);
///////////////////////////////////////
////       Folder Handling         ////
///////////////////////////////////////
		[TAI makeTweaksFolder];
///////////////////////////////////////
////     Enhancer Handling         ////
///////////////////////////////////////
		[TAI enhancer];
///////////////////////////////////////
////          SDK Handling         ////
///////////////////////////////////////
		[TAI DoWnLoAd];
	}
///////////////////////////////////////
////          MSG Handling         ////
///////////////////////////////////////
	[TAI popup];
	exit(0);
}