package com.example.flutter_hello

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.fragment.app.FragmentTransaction
import io.flutter.embedding.android.FlutterFragment

class ThreeActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_three)
        var ft:FragmentTransaction=supportFragmentManager.beginTransaction()
        val dartView:FlutterFragment=FlutterFragment.withNewEngine().initialRoute("second").build()
        ft.replace(R.id.dartPageContain,dartView).commit()
    }
}