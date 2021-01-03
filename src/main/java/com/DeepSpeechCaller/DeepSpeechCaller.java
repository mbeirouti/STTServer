public class DeepSpeechCaller {
    static {
       System.loadLibrary("ds_wrapper"); // Load native library hello.dll (Windows) or libhello.so (Unixes)
                                    //  at runtime
                                    // This library contains a native method called sayHello()
    }
  
    // Declare an instance native method sayHello() which receives no parameter and returns void
    private native void Version();
  
    // Test Driver
    public static void main(String[] args) {
       new DeepSpeechCaller().Version();  // Create an instance and invoke the native method
    }
 }