CC = gcc

CFLAGS = -Wall -fPIC -shared

INC = -I"$(JAVA_HOME)/include" -I"$(JAVA_HOME)/include/linux" 

JAVA_CODE_ROOT_PATH = ./src/main/java

DEEPSPEECHSHAREDLIB_NAME = deepspeech
DEEPSPEECHSHAREDLIB_PATH = ./src/main/java/com/DeepSpeechCaller

JAVA_WRAPPER_NAME = DeepSpeechCaller
JAVA_WRAPPER_PATH = $(JAVA_CODE_ROOT_PATH)/com/DeepSpeechCaller

FILELINKS = -l$(DEEPSPEECHSHAREDLIB_NAME)
PATHLINKS = -L$(DEEPSPEECHSHAREDLIB_PATH) -Wl,-rpath,$(DEEPSPEECHSHAREDLIB_PATH)

LINKS = $(PATHLINKS) $(FILELINKS) 

TARGET_NAME = DeepSpeechCaller.c 
TARGET_PATH = ./src/main/java/com/DeepSpeechCaller

OUTPUT = libds_wrapper.so  

jni_wrapper:
	javac -h $(DEEPSPEECHSHAREDLIB_PATH) $(DEEPSPEECHSHAREDLIB_PATH)/DeepSpeechCaller.java

c_wrapper: 
	$(CC) $(CFLAGS) $(INC) $(TARGET_PATH)/$(TARGET_NAME) -o $(DEEPSPEECHSHAREDLIB_PATH)/$(OUTPUT) $(LINKS) 

test:
	java -Djava.library.path=$(JAVA_WRAPPER_PATH) -classpath $(JAVA_WRAPPER_PATH) $(JAVA_WRAPPER_NAME)