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
#include "functions/includes.h"

@interface taiprRootListController : PSListController
@property (nonatomic, retain) NSMutableDictionary *savedSpecifiers;
@end