#include "taiprRootListController.h"
@interface PSListController (iOS12Plus)
-(BOOL)containsSpecifier:(PSSpecifier *)arg1;
@end
@implementation taiprRootListController
- (NSArray *)specifiers {
	NSArray *chosenIDs = @[@"lock", @"auth", @"Save", @"nineThree", @"tenThree", @"elevenTwo", @"twelveOneTwo", @"twelveFour", @"thirteen", @"thirteenFour", @"thirteenFive", @"fourteen"];
	loader();
	saveUDIDOnDecline = NO;
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
		self.savedSpecifiers = (_savedSpecifiers) ?: [[NSMutableDictionary alloc] init];
		for(PSSpecifier *specifier in _specifiers) {
			if([chosenIDs containsObject:[specifier propertyForKey:@"id"]]) {
				[self.savedSpecifiers setObject:specifier forKey:[specifier propertyForKey:@"id"]];
			}
		}
	}
	return _specifiers;
}

-(void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier {
	[super setPreferenceValue:value specifier:specifier];
	NSString *key = [specifier propertyForKey:@"key"];
	if([key isEqualToString:@"sdks-master"]) {
		if([value boolValue]) {
			[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"nineThree"], self.savedSpecifiers[@"tenThree"], self.savedSpecifiers[@"elevenTwo"], self.savedSpecifiers[@"twelveOneTwo"], self.savedSpecifiers[@"twelveFour"], self.savedSpecifiers[@"thirteen"], self.savedSpecifiers[@"thirteenFour"], self.savedSpecifiers[@"thirteenFive"], self.savedSpecifiers[@"fourteen"]] animated:YES];
		} else /*if ([self containsSpecifier:self.savedSpecifiers[@"all"]])*/ {
			[self insertContiguousSpecifiers:@[self.savedSpecifiers[@"nineThree"], self.savedSpecifiers[@"tenThree"], self.savedSpecifiers[@"elevenTwo"], self.savedSpecifiers[@"twelveOneTwo"], self.savedSpecifiers[@"twelveFour"], self.savedSpecifiers[@"thirteen"], self.savedSpecifiers[@"thirteenFour"], self.savedSpecifiers[@"thirteenFive"], self.savedSpecifiers[@"fourteen"]] afterSpecifierID:@"All" animated:YES];
		}
	}

	if(udidCheck((char*)PW, (char*)LoC, (char*)keyUrL)) {
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"lock"], self.savedSpecifiers[@"auth"], self.savedSpecifiers[@"Save"]] animated:YES];
	} else if (!([self containsSpecifier:self.savedSpecifiers[@"lock"]] || [self containsSpecifier:self.savedSpecifiers[@"auth"]] || [self containsSpecifier:self.savedSpecifiers[@"Save"]])) {
		[self insertContiguousSpecifiers:@[self.savedSpecifiers[@"lock"], self.savedSpecifiers[@"auth"], self.savedSpecifiers[@"Save"]] afterSpecifierID:@"switchID" animated:YES];
	}
}

-(void)reloadSpecifiers {
	[super reloadSpecifiers];
	if(udidCheck((char*)PW, (char*)LoC, (char*)keyUrL)) {
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"lock"], self.savedSpecifiers[@"auth"], self.savedSpecifiers[@"Save"]] animated:YES];
	}
	if([preferences[@"sdks-master"] boolValue]) {
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"nineThree"], self.savedSpecifiers[@"tenThree"], self.savedSpecifiers[@"elevenTwo"], self.savedSpecifiers[@"twelveOneTwo"], self.savedSpecifiers[@"twelveFour"], self.savedSpecifiers[@"thirteen"], self.savedSpecifiers[@"thirteenFour"], self.savedSpecifiers[@"thirteenFive"], self.savedSpecifiers[@"fourteen"]] animated:YES];
	}
}

-(void)viewDidLoad {
	[super viewDidLoad];
	[self reloadSpecifiers];
}

-(void)sDks {
	loader();
	if (udidCheck((char*)PW, (char*)LoC, (char*)keyUrL)){
		enhancer();
		DoWnLoAd();
	}
	popup();
}

-(void)fullDl {
	loader();
	if (udidCheck((char*)PW, (char*)LoC, (char*)keyUrL)){
		if (theosInstall()) {
			Profile(YES);
			zProfile(YES);
		}
		enhancer();
		DoWnLoAd();
	}
	popup();
}

-(void)updateTheos {
	loader();
	if (udidCheck((char*)PW, (char*)LoC, (char*)keyUrL)){
		updateTheos();
	}
	popup();
}

-(void)T {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://mobile.twitter.com/rj_skins"] options:@{} completionHandler:nil];
}

-(void)T2 {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://mobile.twitter.com/Alicydia"] options:@{} completionHandler:nil];
}

-(void)P {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.me/4Randy420"] options:@{} completionHandler:nil];
}

-(void)Save {
	[self.view endEditing:YES];
	loader();
	udidCheck((char*)PW, (char*)LoC, (char*)keyUrL);
	[super reloadSpecifiers];
	[self reloadSpecifiers];
}
@end