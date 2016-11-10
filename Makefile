#nhorner makefile for ServerCountThrees assignment, cs178 09/13/16


.SUFFIXES: .c .o

# holds source files
OBJDIR = /home/nhorner/cs178/ServerCountThrees

# put ServerCountThrees and data file in test directory per assignment
TESTDIR = test

objects = readInt32BitLE.o ServerCountThrees.o

ServerCountThrees :  $(objects)
	cc -o ServerCountThrees $(objects)

readInt32BitLE.o : readInt32BitLE.c readInt32BitLE.h
	cc -c readInt32BitLE.c

ServerCountThrees.o : ServerCountThrees.c readInt32BitLE.h
	cc -c ServerCountThrees.c

.PHONY : test
test : ServerCountThrees
	mkdir $(TESTDIR)
	mv ServerCountThrees $(TESTDIR)
	#unzip threesData.zip
	cp threesData.bin $(TESTDIR)
	cd $(TESTDIR) && ./ServerCountThrees 

# remove files, directories create during make and make test 
.PHONY : clean
clean :
	-rm -rf $(TESTDIR)


