#include "taiprefs/functions/includes.h"

void checkTerm(void){
	const char* test = getenv("TERM");
	NSString *Test = [NSString stringWithUTF8String:test];
	if ([Test isEqualToString: @"xterm-color"]) {
		printf("PLEASE RUN THEOS AUTO INSTALLER USING MTERMINAL or THEOSTERM\n-> NewTerm CRASHES\n");
		exit (0);
	}
}

int d_theos(bool u_theos){
	if (u_theos) {
		if ([fileManager removeItemAtPath:@"/theos" error:nil]){
			printf("%sTheos %suninstalled %sSuccessfully!%s\n", c_cyan, c_red, c_cyan, c_reset);
		} else {
			printf("%sUnable to uninstall %sTheos%s\n", c_red, c_cyan, c_reset);
		}
	}
	return(1);
}

void startup(void){
///////////////////////////////////////
////       Admin Handling          ////
///////////////////////////////////////
	printf("		%sT%sheos %sA%suto %sI%snstaller%s by%s Randy420\n%s\n\n", c_red, c_cyan, c_red, c_cyan, c_red, c_cyan, c_reset, c_magenta, c_reset);
	checkTerm();
	useColor = YES;
	loader();
}

int main(int argc, char* argv[]) {
///////////////////////////////////////
////     Declaration Handling      ////
///////////////////////////////////////
	bool profileinclude = true;

	NSString * helpme = [NSString stringWithFormat: @ "%sPlease launch'%stai%s' with one option at a time.\n"
		"%stai%s [%soption%s]%s\n"
		"-u%s Uninstall Theos.%s\n"
		"-r%s Reinstall Theos.%s\n"
		"-s%s Installenhanced dev tools & SDK files only.(requires theos to be installed already in location '/theos').\n%s", c_red, c_cyan, c_red, c_cyan, c_red, c_cyan, c_red, c_cyan, c_magenta, c_cyan, c_magenta, c_red, c_cyan, c_reset];
///////////////////////////////////////
////          Options              ////
///////////////////////////////////////
	startup();
	PoPuP = NO;
	int opts = 0;
	int c;
	installed = [fileManager fileExistsAtPath:@"/theos"];
	while ((c = getopt(argc, argv, ":surp")) != -1) {
		switch (c) {
			case 'p':
				//[preferences setObject:@"abc" forKey:@"activationKey"];
				[preferences setObject: @"abc" forKey: @"activationKey"];
				[preferences writeToFile:@"/var/mobile/Library/Preferences/com.randy420.tai.plist" atomically:YES];
				exit(0);
			case 's':
        enhancer();
		    DoWnLoAd();
				popup();
				exit (0);
				break;
			case 'u':
				opts += 1;
				profileinclude = false;
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
////     .profile Handling         ////
///////////////////////////////////////
	Profile(profileinclude);
	zProfile(profileinclude);
///////////////////////////////////////
////     Option Handling           ////
///////////////////////////////////////
	if ((opts==2) || (opts==1)){
		if (installed){
			d_theos(true);
		} else {
			printf("%stheos%s isn't installed, run the installer again\nPlease install Theos before trying to delete it.\nಠ_ಠ\n%s", c_cyan, c_red, c_reset);
			exit (1);
		}
		if (opts==1){
			popup();
			exit(0);
		}
	}
	installed = [fileManager fileExistsAtPath:@"/theos"];
	if (installed) {
		printf("%sTheos%s already installed, run '%stai -r%s' to reinstall or '%stai -u%s' to uninstall%s\n", c_cyan, c_green, c_cyan, c_green, c_cyan, c_red, c_reset);
		exit(1);
	}
///////////////////////////////////////
////       Folder Handling         ////
///////////////////////////////////////
	makeTweaksFolder();
///////////////////////////////////////
////          git Theos           ////
///////////////////////////////////////
	if (theosInstall()) {
///////////////////////////////////////
////     .profile Handling         ////
///////////////////////////////////////
		Profile(profileinclude);
		zProfile(profileinclude);
///////////////////////////////////////
////     Enhancer Handling         ////
///////////////////////////////////////
		enhancer();
///////////////////////////////////////
////          SDK Handling         ////
///////////////////////////////////////
		DoWnLoAd();
	}
///////////////////////////////////////
////          MSG Handling         ////
///////////////////////////////////////
	popup();
	exit(0);
	}