package com.example.flutter_hello

import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.ConnectivityManager
import android.os.Bundle
import android.util.Log
import com.example.flutter_hello.androidview.AddFlutterViewActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StringCodec

var INIT_PARAMS = "initParams"
const val TAG:String="MainActivity"

class MainActivity : FlutterActivity() {
    private var initParams: String? = null
    private lateinit var eventChannel:EventChannel
    private lateinit var networkIntentFilter:IntentFilter
    private val netWorkStateReceiver=NetWorkStateReceiver()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.e(TAG,"onCreate")
        initParams = getIntent().getStringExtra(INIT_PARAMS)
        MethodChannel(
            flutterEngine!!.dartExecutor.binaryMessenger,
            "nativeCall"
        ).setMethodCallHandler { call, result ->
            run {
                if (call.method.equals("nativeMethod")) {
                    result.success("success")
                    Log.e(TAG, "Get Dart call method")
                }
            }
        }
        networkIntentFilter=IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION)
        registerReceiver(netWorkStateReceiver,networkIntentFilter)
        eventChannel= EventChannel(flutterEngine!!.dartExecutor.binaryMessenger,"getNetworkState")
        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                if (events != null) {
                    GloableEventChannel.getInstance().eventSink=events
                }
            }

            override fun onCancel(arguments: Any?) {

            }

        })
    }

    override fun getInitialRoute(): String? {
        return if (initParams == null) super.getInitialRoute() else initParams
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        var channel = BasicMessageChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "BasicChannel",
            StringCodec.INSTANCE
        )
        channel.setMessageHandler { message, reply ->
            startActivity(
                Intent(
                    this,
                    AddFlutterViewActivity::class.java
                )
            )
            reply.reply("成功跳转")
        }

    }

    companion object {
        fun start(context: Context, initParams: String) {
            val intent = Intent(context, MainActivity::class.java)
            intent.putExtra(INIT_PARAMS, initParams)
            context.startActivity(intent)
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.e(TAG,"onDestroy")
        unregisterReceiver(netWorkStateReceiver)
    }
}