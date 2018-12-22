package com.toly1994.toly;

import android.os.Bundle;
import android.widget.Toast;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "www.toly1994.com/test.名字随意起";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                        if (methodCall.method.equals("showToast")) {
                            //解析参数
                            String msg = methodCall.argument("msg");
                            showToast(msg);
                        }
                        if (methodCall.method.equals("getMD5")) {
                            String arg = methodCall.argument("arg");
                            String md5 = getMD5(arg);
                            result.success(md5);
                        } else {
                            result.notImplemented();
                        }
                    }
                }
        );
    }

    /**
     * 显示吐司
     *
     * @param msg 信息
     */
    public void showToast(String msg) {
        Toast toast = Toast.makeText(this, msg, Toast.LENGTH_SHORT);
        toast.show();
    }


    /**
     * 获取一个字符串的Md5值
     *
     * @param content 内容
     * @return Md5值
     */
    public String getMD5(String content) {
        content = content + "芝麻开门";
        try {
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(content.getBytes());
            return getHashString(digest);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static String getHashString(MessageDigest digest) {
        StringBuilder builder = new StringBuilder();
        for (byte b : digest.digest()) {
            builder.append(Integer.toHexString((b >> 4) & 0xf));
            builder.append(Integer.toHexString(b & 0xf));
        }
        return builder.toString();
    }
}


