// App to test the jni lib can be successfully called
import com.neeul.clsj;

public class main
{
    public static void main(String argv[])
    {
        System.loadLibrary("clsj_swiggy");
        clsj.say_word(argv[0]);
    }
}
