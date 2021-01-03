// Save as "HelloJNI.c"
#include <jni.h>        // JNI header provided by JDK
#include "deepspeech.h"
#include <stdio.h>      // C Standard IO Header
#include "DeepSpeechCaller.h"   // Generated
 
// Implementation of the native method sayHello()
JNIEXPORT void JNICALL Java_DeepSpeechCaller_Version(JNIEnv *env, jobject thisObj) {
   printf("You are using DeepSpeech version %s\n", DS_Version());
   return;
}


int main() {
   printf("You are using DeepSpeech version %s\n", DS_Version());
}