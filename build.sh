#! /bin/sh
#clean everything so we know this script actuall worked!
rm *.so *.class

# i didn't know you could do this in java...
JAVA_HOME=`jrunscript -e 'java.lang.System.out.println(java.lang.System.getProperty("java.home"));'`/..

# compile java
javac HelloJNI.java
# generate C header from .class
javah HelloJNI

# compile C wrapper with jni.h, export so
# DO NOT include a -c option. that will break.
# some webpages mentioned a 
gcc -I$JAVA_HOME/include -I$JAVA_HOME/include/linux HelloJNI.c -shared -o libhello.so


#run .class (with C binding)
java -Djava.library.path=. HelloJNI


