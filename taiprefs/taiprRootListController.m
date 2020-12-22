#include "taiprRootListController.h"
@interface PSListController (iOS12Plus)
-(BOOL)containsSpecifier:(PSSpecifier *)arg1;
@end
@implementation taiprRootListController
	tai *TAI;
- (NSArray *)specifiers {
	TAI = [[tai alloc] init];
	NSArray *chosenIDs = @[@"lock", @"auth", @"Save", @"nineThree", @"tenThree", @"elevenTwo", @"twelveOneTwo", @"twelveFour", @"thirteen", @"thirteenFour", @"thirteenFive", @"fourteen"];
	[TAI loader];
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
		} else if (![self containsSpecifier:self.savedSpecifiers[@"nineThree"]]) {
			[self insertContiguousSpecifiers:@[self.savedSpecifiers[@"nineThree"], self.savedSpecifiers[@"tenThree"], self.savedSpecifiers[@"elevenTwo"], self.savedSpecifiers[@"twelveOneTwo"], self.savedSpecifiers[@"twelveFour"], self.savedSpecifiers[@"thirteen"], self.savedSpecifiers[@"thirteenFour"], self.savedSpecifiers[@"thirteenFive"], self.savedSpecifiers[@"fourteen"]] afterSpecifierID:@"All" animated:YES];
		}
	}

	if([TAI udidCheck:PW prefPLIsT:LoC path:keyUrL]) {
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"lock"], self.savedSpecifiers[@"auth"], self.savedSpecifiers[@"Save"]] animated:YES];
	} else if (!([self containsSpecifier:self.savedSpecifiers[@"lock"]] || [self containsSpecifier:self.savedSpecifiers[@"auth"]] || [self containsSpecifier:self.savedSpecifiers[@"Save"]])) {
		[self insertContiguousSpecifiers:@[self.savedSpecifiers[@"lock"], self.savedSpecifiers[@"auth"], self.savedSpecifiers[@"Save"]] afterSpecifierID:@"switchID" animated:YES];
	}
}

-(void)reloadSpecifiers {
	[super reloadSpecifiers];
	if([TAI udidCheck:PW prefPLIsT:LoC path:keyUrL]) {
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
	[TAI loader];
	if ([TAI udidCheck:PW prefPLIsT:LoC path:keyUrL]){
		[TAI enhancer];
		[TAI DoWnLoAd];
	}
	[TAI popup];
}

-(void)fullDl {
	[TAI loader];
	if ([TAI udidCheck:PW prefPLIsT:LoC path:keyUrL]){
		if ([TAI theosInstall]) {
			Profile(YES);
			zProfile(YES);
		}
		[TAI enhancer];
		[TAI DoWnLoAd];
	}
	[TAI popup];
}

-(void)updateTheos {
	[TAI loader];
	if ([TAI udidCheck:PW prefPLIsT:LoC path:keyUrL]){
		[TAI upDateTheos];
	}
	[TAI popup];
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
	[TAI loader];
	[TAI udidCheck:PW prefPLIsT:LoC path:keyUrL];
	[super reloadSpecifiers];
	[self reloadSpecifiers];
}
@end