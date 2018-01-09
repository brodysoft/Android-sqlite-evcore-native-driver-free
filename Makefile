# top-level Makefile

all: ndkbuild

init:
	git submodule update --init

regen:
	java -cp gluegentools/antlr.jar:gluegentools/gluegen.jar com.jogamp.gluegen.GlueGen -I. -Ecom.jogamp.gluegen.JavaEmitter -CEVCoreNativeDriver.cfg native/sqlc.h
	sed -i.orig 's/^import/\/\/import/' java/io/sqlc/EVCoreNativeDriver.java

ext-ndkbuild:
	rm -rf lib libs extbuild/lib extbuild/libs
	ndk-build -C extbuild
	cp -r extbuild/libs lib
	jar cf evcore-native-driver.jar lib

clean:
	rm -rf obj lib libs *.jar *.zip *.jar
	rm -rf extbuild/obj extbuild/libs

