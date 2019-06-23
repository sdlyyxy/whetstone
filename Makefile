LIBS=-lm
CROSS_COMPILE=mipsel-linux-uclibc-
all:
	gcc  whetstone.c $(LIBS)&&./a.out
	gcc -DDP whetstone.c $(LIBS)&&./a.out
	rm a.out
bin:
	$(CROSS_COMPILE)gcc whetstone.c -static -Wl,-Bstatic -lm -o whetstoneSP
	$(CROSS_COMPILE)gcc -DDP whetstone.c -static -Wl,-Bstatic -lm -o whetstoneDP

#new xcode compiler
newarm:
	clang -target armv6-apple-darwin-macho -isysroot /Users/sdlyyxy/Documents/InstallXcodeLion/InstallXcodeLion.pkg/Applications/Install\ Xcode.app/Contents/Resources/Packages/iPhoneSDK5_0/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.0.sdk  whet*c -miphoneos-version-min=3.0 -DDP -O3


#old xcode compiler
oldarm:
	/Users/sdlyyxy/Documents/InstallXcodeLion/InstallXcodeLion.pkg/Applications/Install\ Xcode.app/Contents/Resources/Packages/llvm-gcc4.2/usr/llvm-gcc-4.2/bin/llvm-gcc-4.2 -target armv6-apple-darwin-macho -isysroot /Users/sdlyyxy/Documents/InstallXcodeLion/InstallXcodeLion.pkg/Applications/Install\ Xcode.app/Contents/Resources/Packages/iPhoneSDK5_0/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.0.sdk  whet*c -miphoneos-version-min=3.0 -DDP -O3
