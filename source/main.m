#include "functions/420.h"

int main(int argc, char* argv[]) {
	tai *TAI = [[tai alloc] init];
///////////////////////////////////////
////    •Declaration•Handling•     ////
///////////////////////////////////////
	NSString * helpme = [NSString stringWithFormat:@"%s%@ '%stai%s' %@.\n"
	"%stai -%s[%s%@%s]%s\n"
	"-u%s %@.%s\n"
	"-r%s %@.%s\n"
	"-s%s %@ '%s/theos%s' %@ '%s/var/theos%s').\n%s"
	"-v%s %@ Theos.%s\n"
	"-.%s %@.\n%s"
	"-p update .profile, .zprofile and .zshrc",
	c_red, local(@"LAUNCH", @"Please launch"), c_cyan, c_red, local(@"ONE_OPT", @"with one option at a time"), c_cyan, c_red, c_cyan, local(@"OPTION", @"option"), c_red, c_cyan, c_magenta, local(@"-U", @"Uninstall Theos"), c_cyan, c_magenta, local(@"-r", @"Reinstall Theos"), c_cyan, c_magenta, local(@"-S", @"Install enhanced dev tools & SDK files only.(requires theos to be installed already in location"), c_green, c_magenta, local(@"OR", @"or"), c_green, c_magenta, c_cyan, c_magenta, local(@"UPDATE", @"Update"), c_cyan, c_magenta, local(@"-.", @"Remove color from the terminal output"), c_reset];
///////////////////////////////////////
////         •Options•             ////
///////////////////////////////////////
	[TAI startup];

	TAI.PoPuP = NO;

	int opts = 0;
	int c;
	while ((c = getopt(argc, argv, ":. :~ :.~psfurv")) != -1) {
		switch (c) {
			case '~':
				TAI.abyss = YES;
				TAI.PoPuP = YES;
			case '.':
				TAI.useColor = NO;
				break;
			case 'p':
				for (NSString *profile in TAI.profiles) {
					[TAI addToProfile:YES profile:profile];
				}
				exit(0);
			case 's':
				[TAI enhancer];
				[TAI DoWnLoAd];
				[TAI popup];
				exit (0);
			case 'u':
				opts += 1;
				break;
			case 'v':
				if (TAI.previousInstall) {
					[TAI depends];
					[TAI upDateTheos];
					[TAI popup];
				}else{
					[TAI Print:local(@"INSTALL_FIRST", @"Theos is NOT installed, install theos before proceeding")];
				}
				exit(0);
			case 'r':
				opts += 2;
				break;
			case 'f':
				[TAI header];
				[TAI fixTheos];
				exit (0);
			case '?':
				[TAI header];
				[TAI Print:helpme];
				exit (1);
		}
	}
///////////////////////////////////////
////      •Option•Handling•        ////
///////////////////////////////////////
	if ((opts==2) || (opts==1)){
		if (TAI.previousInstall){
			[TAI dTheos:true];
		} else {
			[TAI Print:[NSString stringWithFormat:@"%stheos%s %@.\nಠ_ಠ\n%s", c_cyan, c_red, local(@"NOT_INSTALLED", @"isn't installed, run the installer again. Please install Theos before trying to reinstall or delete it"), c_reset]];
			exit (1);
		}
		if (opts==1){
			for (NSString *profile in TAI.profiles) {
				[TAI addToProfile:NO profile:profile];
			}
			[TAI popup];
			exit(0);
		}
	}

	if (TAI.installedTheos || TAI.installedVarTheos || TAI.installedOptTheos) {
		[TAI header];
		[TAI Print:[NSString stringWithFormat:@"%sTheos%s %@ '%stai -r%s' %@ '%stai -u%s' %@%s\n", c_cyan, c_green, local(@"ALREADY", @"already installed, run"), c_cyan, c_green, local(@"TO_REINSTALL", @"to reinstall or"), c_cyan, c_red, local(@"UNINSTALL", @"uninstall"), c_reset]];
		exit(1);
	}
////////////////////////////////////////
////      •Theos•Dependencies•       ////
////////////////////////////////////////
	[TAI depends];
////////////////////////////////////////
////          •git•Theos•           ////
////////////////////////////////////////
	if ([TAI theosInstall]) {
///////////////////////////////////////
////     .profile•Handling         ////
///////////////////////////////////////
		for (NSString *profile in TAI.profiles) {
			[TAI addToProfile:YES profile:profile];
		}
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