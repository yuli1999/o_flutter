package com.example.one_flutter;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.HashMap;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMethodCodec;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.dev/battery";
    private MethodChannel nativeChannel;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }


    //通道  接受flutter发送的消息
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        nativeChannel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL, StandardMethodCodec.INSTANCE);
        nativeChannel.setMethodCallHandler((call, result) -> {
            switch (call.method) {
                case "test":
                    HashMap<String, Object> map = new HashMap<>();
                    map.put("test", 6666);
                    nativeChannel.invokeMethod("test", map);//发送消息给flutter
                    break;
                case "test2":

                    break;

            }
        });
    }
}
