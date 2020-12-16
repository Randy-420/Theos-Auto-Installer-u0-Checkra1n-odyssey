FINALPACKAGE=1
TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = taiPrefs

export ARCHS = armv7 armv7s arm64 arm64e

taiPrefs_FILES = taiprRootListController.m $(wildcard functions/*.m)
taiPrefs_FRAMEWORKS = UIKit
taiPrefs_PRIVATE_FRAMEWORKS = Preferences
taiPrefs_INSTALL_PATH = /Library/PreferenceBundles

$(BUNDLE_NAME)_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

taiPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
