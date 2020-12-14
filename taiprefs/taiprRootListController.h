#include <Preferences/PSListController.h>
#include <Preferences/PSSpecifier.h>
#include <spawn.h>
#include <Social/SLComposeViewController.h>
#include <Social/SLServiceTypes.h>
#include <Twitter/Twitter.h>
#include <objc/runtime.h>
#include <Preferences/PSTableCell.h>
#include <Social/SLComposeViewController.h>
#include <Social/SLServiceTypes.h>
#include <Twitter/Twitter.h>
#include <CepheiPrefs/HBRootListController.h>
#include <stdio.h>
#include <dirent.h>
#include "functions/420.h"
#include "functions/.profile.h"
#include "functions/.zprofile.h"

@interface taiprRootListController : PSListController
@property (nonatomic, retain) NSMutableDictionary *savedSpecifiers;
@end