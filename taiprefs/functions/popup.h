void popup(){
	if (badUdid) {
		addMsg((char *)[udidFail UTF8String]);
	}
	if (theosUpdate) {
		addMsg((char*)[updated UTF8String]);
	}
	if (installSuccess) {
		addMsg((char*)[theosSuccessMessage UTF8String]);
	}
	if (!theosUpdate) {
		if (!badUdid) {
			if (!folderFailed && tweaksMade) {
			addMsg((char*)[tFolderSuc UTF8String]);
			} else if (folderFailed && !tweaksMade) {
				addMsg((char*)[tFolderFail UTF8String]);
			} else if (!folderFailed && !tweaksMade) {
			addMsg((char*)[tFolderIgnore UTF8String]);
			}
		}
	}
	if (attempted && failed && (!(previousInstall && installSuccess))) {
		addMsg((char*)[theosFailureMessage UTF8String]);
	}
	if (attempted && previousInstall){
		addMsg((char*)[previousInstallMsg UTF8String]);
	}
	if (enhanced) {
		addMsg((char*)[enhanceMsg UTF8String]);
	}
	if (totalDownloaded >= 1){
		addMsg((char*)[successfulSdk UTF8String]);
	}
	if (alreadyHas) {
		addMsg((char*)[ignored UTF8String]);
	}
	if (failure){
		addMsg((char*)[failedSdk UTF8String]);
	}
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
