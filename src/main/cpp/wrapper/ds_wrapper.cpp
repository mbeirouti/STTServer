#include "deepspeech.h"
#include <stdio.h>
#include "com_NativeInterface_NativeInterface.h"

JNIEXPORT void JNICALL Java_NativeInterface_DS_Version(HNIENV *env, jobject thisObj) {
    char* version;

    version = DS_Version();
    fprintf("Version Equals %s", version);
    return;
}

