#include "functions/420.h"
#include "functions/profileHelper.h"
#include "functions/.profile.h"
#include "functions/.zprofile.h"

int main(int argc, char* argv[]) {
	tai *TAI = [[tai alloc] init];
	NSFileManager *fm = [[NSFileManager alloc] init];
///////////////////////////////////////
////    •Declaration•Handling•     ////
///////////////////////////////////////
	NSString * helpme = [NSString stringWithFormat: @ "%sPlease launch'%stai%s' with one option at a time.\n"
	"%stai%s [%soption%s]%s\n"
	"-u%s Uninstall Theos.%s\n"
	"-r%s Reinstall Theos.%s\n"
	"-s%s Install enhanced dev tools & SDK files only.(requires theos to be installed already in location '%s/theos%s' or '%s/var/theos%s').\n%s"
	"-v%s Update Theos.\n%s", c_red, c_cyan, c_red, c_cyan, c_red, c_cyan, c_red, c_cyan, c_magenta, c_cyan, c_magenta, c_cyan, c_magenta, c_green, c_magenta, c_green, c_magenta, c_cyan, c_magenta, c_reset];
///////////////////////////////////////
////         •Options•             ////
///////////////////////////////////////
	[TAI startup];
	TAI.PoPuP = NO;

	int opts = 0;
	int c;
	while ((c = getopt(argc, argv, ":. :~ :.~sfurv")) != -1) {
		switch (c) {
			case '.':
				TAI.useColor = NO;
				break;
			case '~':
				TAI.abyss = YES;
				break;
			case 's':
				[TAI enhancer];
				[TAI DoWnLoAd];
				[TAI popup];
				exit (0);
			case 'u':
				opts += 1;
				break;
			case 'v':
				[TAI upDateTheos];
				[TAI popup];
				exit(0);
			case 'r':
				opts += 2;
				break;
			case 'f':
				[TAI fixTheos];
				exit (0);
			case '?':
				printf("%s", [helpme UTF8String]);
				exit (1);
		}
	}
///////////////////////////////////////
////      •Option•Handling•        ////
///////////////////////////////////////
	if ((opts==2) || (opts==1)){
		if ([fm fileExistsAtPath:@"/theos"] || [fm fileExistsAtPath:@"/var/theos"]){
			[TAI dTheos:true];
		} else {
			printf("%stheos%s isn't installed, run the installer again\nPlease install Theos before trying to reinstall or delete it.\nಠ_ಠ\n%s", c_cyan, c_red, c_reset);
			exit (1);
		}
		if (opts==1){
			Profile(NO);
			zProfile(NO);
			[TAI popup];
			exit(0);
		}
	}

	if ([fm fileExistsAtPath:@"/theos"] || [fm fileExistsAtPath:@"/var/theos"]) {
		printf("%sTheos%s already installed, run '%stai -r%s' to reinstall or '%stai -u%s' to uninstall%s\n", c_cyan, c_green, c_cyan, c_green, c_cyan, c_red, c_reset);
		exit(1);
	}
////////////////////////////////////////
////          •git•Theos•           ////
////////////////////////////////////////
	if ([TAI theosInstall]) {
///////////////////////////////////////
////     .profile•Handling         ////
///////////////////////////////////////
		Profile(YES);
		zProfile(YES);
///////////////////////////////////////
////       Folder•Handling         ////
///////////////////////////////////////
		[TAI makeTweaksFolder];
///////////////////////////////////////
////     Enhancer•Handling         ////
///////////////////////////////////////
		[TAI enhancer];
///////////////////////////////////////
////          SDK•Handling         ////
///////////////////////////////////////
		[TAI DoWnLoAd];
	}
///////////////////////////////////////
////          MSG•Handling         ////
///////////////////////////////////////
	[TAI popup];
	exit(0);
}