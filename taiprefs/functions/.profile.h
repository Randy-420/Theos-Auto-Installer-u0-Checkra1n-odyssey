#define MAX_BUFFER_SIZE 1000000

void Profile(bool argc) {
	const char * div = "###########################################\n";
	const char * div1 = "########ಠ_ಠ#######( ͠° ͟ʖ ͡°)####(•̀ᴗ•́)و#######\n";
	const char * div2 = "#####ADDED#BY#THEOS#AUTO#INSTALLER#########\n";
	const char * div3 = "\n";
	const char * ttheos = "export THEOS=/theos\n";
	const char * varTtheos = "export THEOS=/var/theos\n";
	const char * nic = "export nic=/theos/bin/nic.pl\n";
	const char * varNic = "export nic=/var/theos/bin/nic.pl\n";
	const char * cd = "export cd=\"cd /var/mobile/tweaks\"\n";
	const char * mmake = "export make=\"make clean package\"\n";
	const char * old = "export nic=$THEOS\"/bin/nic.pl\"\n";
	const char * cpath = "/var/mobile/.profile";
	const char * path = "/var/mobile/.profile.tmp";
	char chunk[MAX_BUFFER_SIZE];
	FILE * fp = fopen(cpath, "r");
	FILE * fw = fopen(path, "w");
///////////////////////////////////////
////      .profile Handling        ////
///////////////////////////////////////
	if (!(fp == NULL)) {
		while (fgets(chunk, sizeof(chunk), fp) != NULL) {
			if (!(((((((((((strcmp(chunk, div) == 0) || (strcmp(chunk, div1) == 0)) || (strcmp(chunk, div2) == 0)) || (strcmp(chunk, div3) == 0)) || (strcmp(chunk, ttheos) == 0)) || (strcmp(chunk, nic) == 0)) || (strcmp(chunk, cd) == 0)) || (strcmp(chunk, mmake) == 0)) || (strcmp(chunk, old)==0)) || (strcmp(chunk, varTtheos)==0)) || (strcmp(chunk, varNic)==0))) {
				fputs(chunk, fw);
			}
		}
	}
	if (argc) {
		fputs(div, fw);
		fputs(div1, fw);
		fputs(div2, fw);
		fputs(div1, fw);
		fputs(div, fw);
		if ([installHere isEqualToString:@"/theos"]) {
			fputs(ttheos, fw);
			fputs(nic, fw);
		} else {
			fputs(varTtheos, fw);
			fputs(varNic, fw);
		}
		fputs(cd, fw);
		fputs(mmake, fw);
		fputs(div, fw);
		fputs(div1, fw);
		fputs(div2, fw);
		fputs(div1, fw);
		fputs(div, fw);
	}
	fclose(fp);
	fclose(fw);
	rename(path,cpath);
}