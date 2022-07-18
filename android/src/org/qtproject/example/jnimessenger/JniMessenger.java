package org.qtproject.example.jnimessenger;

public class JniMessenger
{
    private static native void callFromJava(String message);

    public JniMessenger() {}

    public static void printFromJava(String message)
    {
        System.out.println("This is printed from JAVA, message is: " + message);
        callFromJava("Olá de JAVA!");
    }
}
