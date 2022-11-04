package com.example.flutter_hello

import android.content.Context
import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec

var INIT_PARAMS = "initParams"

class MainActivity : FlutterActivity() {
    private var initParams: String? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        initParams = getIntent().getStringExtra(INIT_PARAMS)
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
                    SecondActivity::class.java
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
}