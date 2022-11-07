package com.example.flutter_hello.androidview

import android.annotation.SuppressLint
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Parcelable
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.flutter_hello.R
import com.example.flutter_hello.databinding.ActivityAddFlutterViewBinding
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import java.util.*

class AddFlutterViewActivity : AppCompatActivity() {
    private lateinit var binding: ActivityAddFlutterViewBinding
    private lateinit var flutterViewEngine: FlutterViewEngine

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_add_flutter_view)

        val engine = FlutterEngine(applicationContext)
        engine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint(
                FlutterInjector.instance().flutterLoader().findAppBundlePath(),
                "showCell"
            )
        )

        flutterViewEngine = FlutterViewEngine(engine)
        // The activity and FlutterView have different lifecycles.
        // Attach the activity right away but only start rendering when the
        // view is also scrolled into the screen.
        flutterViewEngine.attachToActivity(this)

        val layoutManager = LinearLayoutManager(this)
        val recyclerView = binding.recyclerView
        val adapter = ListAdapter(this, flutterViewEngine)
        recyclerView.layoutManager = layoutManager
        recyclerView.adapter = adapter

        // If the activity was restarted, keep track of the previous scroll
        // position and of the previous cell indices that were randomly selected
        // as Flutter cells to preserve immersion.
        layoutManager.onRestoreInstanceState(savedInstanceState?.getParcelable<Parcelable>("layoutManager"))
        val previousFlutterCellsArray = savedInstanceState?.getIntegerArrayList("adapter")
        if (previousFlutterCellsArray != null) {
            adapter.previousFlutterCells = TreeSet(previousFlutterCellsArray)
        }
    }

    @SuppressLint("MissingSuperCall")
    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putParcelable(
            "layoutManager",
            binding.recyclerView.layoutManager?.onSaveInstanceState()
        )
        val previousFlutterCells =
            (binding.recyclerView.adapter as? ListAdapter)?.previousFlutterCells
        if (previousFlutterCells != null) {
            outState.putIntegerArrayList(
                "adapter",
                ArrayList(previousFlutterCells)
            )
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        flutterViewEngine.detachActivity()
    }

    // These below aren't used here in this demo but would be needed for Flutter plugins that may
    // consume these events.

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        flutterViewEngine.onRequestPermissionsResult(requestCode, permissions, grantResults)
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        flutterViewEngine.onActivityResult(requestCode, resultCode, data)
        super.onActivityResult(requestCode, resultCode, data)
    }

    override fun onUserLeaveHint() {
        flutterViewEngine.onUserLeaveHint()
        super.onUserLeaveHint()
    }
}