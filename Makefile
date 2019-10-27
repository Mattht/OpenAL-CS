# Makefile for OpenAL#
# Written by Ethan "flibitijibibo" Lee

# Source Lists
SRC = \
	src/ALC10.cs \
	src/ALC11.cs \
	src/AL10.cs \
	src/AL11.cs \
	src/ALEXT.cs \
	src/EFX.cs

# Targets

debug: clean-debug
	mkdir -p bin/Debug
	cp app.config bin/Debug/OpenAL-CS.dll.config
	dmcs /unsafe -debug -out:bin/Debug/OpenAL-CS.dll -target:library $(SRC)

clean-debug:
	rm -rf bin/Debug

release: clean-release
	mkdir -p bin/Release
	cp app.config bin/Release/OpenAL-CS.dll.config
	dmcs /unsafe -optimize -out:bin/Release/OpenAL-CS.dll -target:library $(SRC)

clean-release:
	rm -rf bin/Release

clean: clean-debug clean-release
	rm -rf bin

all: debug release
