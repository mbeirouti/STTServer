#include <jni.h>
#include "deepspeech.h"
#include <stdio.h>
#include "DeepSpeechCaller.h"
 
JNIEXPORT void JNICALL Java_DeepSpeechCaller_DS_1Version(JNIEnv *env, jclass jclass) {
   printf("You are currently running DeepSpeech Version %s\n", DS_Version());
}