package com.example.flutter_hello

import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.DataBindingUtil
import com.example.flutter_hello.databinding.ActivitySecondBinding
import io.flutter.embedding.android.FlutterActivity

class SecondActivity : AppCompatActivity() {
    lateinit var mContext: Context
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        mContext = this
        val binding: ActivitySecondBinding =
            DataBindingUtil.setContentView(this, R.layout.activity_second)
        binding.jumpToDartSecond.setOnClickListener {
            //方式1：跳转到已经在flutter的routers声明的命名路由页面（会卡顿）
//            startActivity(FlutterActivity.withNewEngine().initialRoute("second").build(mContext))
            //方式2：跳转到initialRoute指定的页面(不卡顿)
//            startActivity(
//                FlutterActivity
//                    .withCachedEngine("second")
//                    .build(mContext)
//            )
            //方式3：intent传参的形式打开新的dart页面（会卡顿）
//            MainActivity.start(mContext,"second")
            startActivity(Intent(mContext,ThreeActivity::class.java))
        }
    }
}