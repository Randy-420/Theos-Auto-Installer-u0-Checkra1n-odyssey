include $(THEOS)/makefiles/common.mk
export TARGET:=iphone:clang:13.5:7.0

TOOL_NAME = tai
tai_FILES = main.m $(wildcard functions/*.m)
tai_FRAMEWORKS = UIKit
tai_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tool.mk
include $(THEOS_MAKE_PATH)/aggregate.mk