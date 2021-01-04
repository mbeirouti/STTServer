#include <jni.h>
#include "deepspeech.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "DeepSpeechCaller.h"
 
JNIEXPORT jstring JNICALL Java_DeepSpeechCaller_DS_1Version(JNIEnv *env, jclass jclass) {
   char *version = DS_Version();
   jstring version_string = env->NewStringUTF(version);

   return version_string;
}