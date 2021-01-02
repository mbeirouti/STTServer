package com.NativeInterface;

public class NativeInterface {

    static{
		System.loadLibrary("ds_wrapper");
	}

	// Instance of the native method
    private native void DS_Version();


    public static void main(String[] args) {
        new NativeInterface().DS_Version();
    }
}