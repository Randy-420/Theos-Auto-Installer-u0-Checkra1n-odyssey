#include "functions/420.h"
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
		if ([fileManager removeItemAtPath:@"/theos" error:nil] || [fileManager removeItemAtPath:@"/var/theos" error:nil]) {
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
	printf("\t\t%sT%sheos %sA%suto %sI%snstaller%s by%s Randy420\n%s\n\n", c_red, c_cyan, c_red, c_cyan, c_red, c_cyan, c_reset, c_magenta, c_reset);
	[self checkTerm];
	useColor = 1;
	[TAI loader];
}
@end

int main(int argc, char* argv[]) {
	@autoreleasepool {
		taiPriv *taiMain = [[taiPriv alloc] init];
		TAI = [[tai alloc] init];
///////////////////////////////////////
////     Declaration Handling      ////
///////////////////////////////////////
		NSString * helpme = [NSString stringWithFormat: @ "%sPlease launch'%stai%s' with one option at a time.\n"
		"%stai%s [%soption%s]%s\n"
		"-u%s Uninstall Theos.%s\n"
		"-r%s Reinstall Theos.%s\n"
		"-s%s Installenhanced dev tools & SDK files only.(requires theos to be installed already in location '/theos').\n%s", c_red, c_cyan, c_red, c_cyan, c_red, c_cyan, c_red, c_cyan, c_magenta, c_cyan, c_magenta, c_red, c_cyan, c_reset];
///////////////////////////////////////
////          Options              ////
///////////////////////////////////////
		[taiMain startup];
		PoPuP = NO;
		int opts = 0;
		int c;
		if (!installedTheos && !installedVarTheos) {
			installed = NO;
		} else {
			installed = YES;
		}
		while ((c = getopt(argc, argv, ":sur")) != -1) {
			switch (c) {
				case 's':
					[TAI enhancer];
					[TAI DoWnLoAd];
					[TAI popup];
					exit (0);
					break;
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
					return 1;
					break;
			}
		}
///////////////////////////////////////
////     Option Handling           ////
///////////////////////////////////////
		if ((opts==2) || (opts==1)){
			if (installed){
				installed = ![taiMain dTheos:true];
			} else {
				printf("%stheos%s isn't installed, run the installer again\nPlease install Theos before trying to delete it.\nಠ_ಠ\n%s", c_cyan, c_red, c_reset);
				exit (1);
			}
			if (opts==1){
				[TAI popup];
				exit(0);
			}
		}
		installedTheos = [fileManager fileExistsAtPath : @"/theos"];
		installedVarTheos = [fileManager fileExistsAtPath : @"/var/theos"];

		if (installedTheos || installedVarTheos) {
			printf("%sTheos%s already installed, run '%stai -r%s' to reinstall or '%stai -u%s' to uninstall%s\n", c_cyan, c_green, c_cyan, c_green, c_cyan, c_red, c_reset);
			exit(1);
		}
///////////////////////////////////////
////       Folder Handling         ////
///////////////////////////////////////
		[TAI makeTweaksFolder];
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
}