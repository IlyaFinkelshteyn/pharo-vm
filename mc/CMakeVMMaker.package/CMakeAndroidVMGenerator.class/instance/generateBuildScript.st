building
generateBuildScript
	config write: '
	#/bin/sh
export NDK=/Users/jbarnaud/Documents/Repository/ndkandroid/
export SDK=/Users/jbarnaud/Documents/Repository/sdkandroid/
export NDK_PROJECT_PATH=', self buildDir pathString, '
export ROOTSOURCE=$NDK_PROJECT_PATH
export PATH=$PATH:$SDK/tools:$NDK
cd ..
./scripts/extract-commit-info.sh
cd build
android update project -p . -t ', config androidVersion ,' 
ndk-build NDK_DEBUG=0'
	
	 toFile: 'build.sh'.
	
	config write: '
		#/bin/sh
export NDK=/Users/jbarnaud/Documents/Repository/ndkandroid/
export SDK=/Users/jbarnaud/Documents/Repository/sdkandroid/
export NDK_PROJECT_PATH=', self buildDir pathString, '
export ROOTSOURCE=$NDK_PROJECT_PATH
export PATH=$PATH:$SDK/tools:$NDK	
ant clean debug -verbose
adb -d install -r ./bin/StackActivity-debug.apk'
	
	 toFile: 'package.sh'
	
