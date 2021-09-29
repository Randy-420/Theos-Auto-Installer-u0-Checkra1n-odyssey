void zProfile(bool argc) {
	NSMutableDictionary *preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.randy420.tai.plist"];
	NSString *installHere = ([preferences objectForKey:@"Location"] ? [preferences objectForKey:@"Location"] : @"/var/theos");

	char chunk[MAX_BUFFER_SIZE];
	FILE * fp = fopen(zpath, "r");
	FILE * fw = fopen(tzpath, "w");
///////////////////////////////////////
////      .profile Handling        ////
///////////////////////////////////////
	if (fp) {
		while (fgets(chunk, sizeof(chunk), fp) != NULL) {
			if (!(strcmp(chunk, divider) == 0 || strcmp(chunk, divider1) == 0 || strcmp(chunk, divider2) == 0 || strcmp(chunk, divider3) == 0 || strcmp(chunk, ttheos) == 0 || strcmp(chunk, nic) == 0 || strcmp(chunk, zcd) == 0 || strcmp(chunk, mmake) == 0 || strcmp(chunk, old)==0 || strcmp(chunk, varTtheos)==0 || strcmp(chunk, varNic)==0)) {
				fputs(chunk, fw);
			}
		}
	}
	if (argc) {
		fputs(divider divider1 divider2 divider1 divider, fw);
		if ([installHere isEqualToString:@"/theos"]) {
			fputs(ttheos nic, fw);
		} else {
			fputs(varTtheos varNic, fw);
		}
		fputs(zcd mmake divider divider1 divider2 divider1 divider, fw);
	}
	fclose(fp);
	fclose(fw);
	rename(tzpath,zpath);
}