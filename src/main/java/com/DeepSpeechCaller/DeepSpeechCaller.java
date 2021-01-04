import java.io.File;

public class DeepSpeechCaller {
   static {
      File ds_wrapper = new File("./src/main/cpp/ds_wrapper/" + System.mapLibraryName("ds_wrapper"));
      System.load(ds_wrapper.getAbsolutePath());
   }

   private static native String DS_Version();

   public static void main(String[] args) {
      String version = new DeepSpeechCaller().DS_Version();
      System.out.println("You are using DeepSpeech version " + version);
   }
}