JAVA_ROOT = ./src/main/java
C_ROOT = ./src/main/cpp

# JNI Wrapper for the C wrapper library below
JAVA_WRAPPER_CLASS = DeepSpeechCaller
JAVA_WRAPPER_NAME = $(JAVA_WRAPPER_CLASS).java
JAVA_WRAPPER_PATH = $(JAVA_ROOT)/com/DeepSpeechCaller

# C Wrapper for the DeepSpeech shared library provided by Mozilla
C_WRAPPER_NAME = DeepSpeechCaller.c 
C_WRAPPER_PATH = $(C_ROOT)/ds_wrapper
C_WRAPPER_LIB_NAME = libds_wrapper
C_WRAPPER_LIB_OUT_FILE_NAME = $(C_WRAPPER_LIB_NAME).so

# DeepSpeech shared library provided by Mozilla
DEEPSPEECH_LIB_NAME = deepspeech
DEEPSPEECH_LIB_PATH = $(C_ROOT)/deepspeech

CC = gcc

CFLAGS = -Wall -fPIC -shared

# Necessary library directories to include when building the C Wrapper
INC = -I"$(JAVA_HOME)/include" -I"$(JAVA_HOME)/include/linux" -I"$(DEEPSPEECH_LIB_PATH)"

# Where to find the necessary shared libraries for linking and the names of those libraries
PATH_LINKS = -L$(DEEPSPEECH_LIB_PATH) -Wl,-rpath,$(DEEPSPEECH_LIB_PATH)
FILE_LINKS = -l$(DEEPSPEECH_LIB_NAME)

LINKS = $(PATH_LINKS) $(FILE_LINKS) 

jni_wrapper:
	javac -h $(C_WRAPPER_PATH) $(JAVA_WRAPPER_PATH)/$(JAVA_WRAPPER_NAME)

c_wrapper: 
	$(CC) $(CFLAGS) $(INC) $(C_WRAPPER_PATH)/$(C_WRAPPER_NAME) -o $(C_WRAPPER_PATH)/$(C_WRAPPER_LIB_OUT_FILE_NAME) $(LINKS) 

test:
	java -Djava.library.path=$(JAVA_WRAPPER_PATH) -classpath $(JAVA_WRAPPER_PATH) $(JAVA_WRAPPER_CLASS)

build: jni_wrapper c_wrapper

all: jni_wrapper c_wrapper test