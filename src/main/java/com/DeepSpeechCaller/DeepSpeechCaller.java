import java.io.File;

public class DeepSpeechCaller {
   static {
      File ds_wrapper = new File("./src/main/cpp/ds_wrapper/" + System.mapLibraryName("ds_wrapper"));
      System.load(ds_wrapper.getAbsolutePath());
   }

   private static native void DS_Version();

   public static void main(String[] args) {
      new DeepSpeechCaller().DS_Version();
   }
}