package com.example.flutter_hello.androidview

import android.app.Activity
import android.content.Intent
import androidx.activity.ComponentActivity
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import io.flutter.embedding.android.ExclusiveAppComponent
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.platform.PlatformPlugin

class FlutterViewEngine(val engine: FlutterEngine) : LifecycleObserver,ExclusiveAppComponent<Activity> {
    private var flutterView: FlutterView? = null
    private var activity: ComponentActivity? = null
    private var platformPlugin: PlatformPlugin? = null

    private fun hookActivityAndView() {
        // Assert state.
        activity!!.let { activity ->
            flutterView!!.let { flutterView ->
                platformPlugin = PlatformPlugin(activity, engine.platformChannel)

                engine.activityControlSurface.attachToActivity(this, activity.lifecycle)
                flutterView.attachToFlutterEngine(engine)
                activity.lifecycle.addObserver(this)
            }
        }
    }

    private fun unhookActivityAndView() {
        // Stop reacting to activity events.
        activity!!.lifecycle.removeObserver(this)

        // Plugins are no longer attached to an activity.
        engine.activityControlSurface.detachFromActivity()

        // Release Flutter's control of UI such as system chrome.
        platformPlugin!!.destroy()
        platformPlugin = null

        // Set Flutter's application state to detached.
        engine.lifecycleChannel.appIsDetached();

        // Detach rendering pipeline.
        flutterView!!.detachFromFlutterEngine()
    }

    fun attachToActivity(activity: ComponentActivity) {
        this.activity = activity
        if (flutterView != null) {
            hookActivityAndView()
        }
    }

    fun detachActivity() {
        if (flutterView != null) {
            unhookActivityAndView()
        }
        activity = null
    }

    fun attachFlutterView(flutterView: FlutterView) {
        this.flutterView = flutterView
        if (activity != null) {
            hookActivityAndView()
        }
    }

    fun detachFlutterView() {
        unhookActivityAndView()
        flutterView = null
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_RESUME)
    private fun resumeActivity() {
        if (activity != null) {
            engine.lifecycleChannel.appIsResumed()
        }

        platformPlugin?.updateSystemUiOverlays()
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_PAUSE)
    private fun pauseActivity() {
        if (activity != null) {
            engine.lifecycleChannel.appIsInactive()
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_STOP)
    private fun stopActivity() {
        if (activity != null) {
            engine.lifecycleChannel.appIsPaused()
        }
    }

    fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        if (activity != null && flutterView != null) {
            engine
                .activityControlSurface
                .onRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }

    fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (activity != null && flutterView != null) {
            engine.activityControlSurface.onActivityResult(requestCode, resultCode, data);
        }
    }

    fun onUserLeaveHint() {
        if (activity != null && flutterView != null) {
            engine.activityControlSurface.onUserLeaveHint();
        }
    }

    override fun detachFromFlutterEngine() {

    }

    override fun getAppComponent(): Activity {
        return activity!!
    }
}