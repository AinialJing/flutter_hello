package com.example.flutter_hello

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

class MyApplication : Application() {
    lateinit var flutterEngineInit: FlutterEngine
    override fun onCreate() {
        super.onCreate()
        flutterEngineInit = FlutterEngine(this)
        // 开始执行Dart代码以预热FlutterEngine
        flutterEngineInit.navigationChannel.setInitialRoute("second")
        flutterEngineInit.getDartExecutor()
            .executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
        // 缓存FlutterActivity要使用的FlutterEngine
        FlutterEngineCache.getInstance().put("second", flutterEngineInit)
    }

    override fun onTerminate() {
        flutterEngineInit.destroy()
        super.onTerminate()
    }
}