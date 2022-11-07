package com.example.flutter_hello

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.net.ConnectivityManager
import android.os.Build
import android.widget.Toast
import androidx.annotation.Nullable
import io.flutter.plugin.common.EventChannel

class NetWorkStateReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        //检测API是不是小于21，因为到了API21之后getNetworkInfo(int networkType)方法被弃用
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP) {
            //获得ConnectivityManager对象
            val connMgr =
                context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            //获取ConnectivityManager对象对应的NetworkInfo对象
            //获取WIFI连接的信息
            val wifiNetworkInfo = connMgr.getNetworkInfo(ConnectivityManager.TYPE_WIFI)
            //获取移动数据连接的信息
            val dataNetworkInfo = connMgr.getNetworkInfo(ConnectivityManager.TYPE_MOBILE)
            if (GloableEventChannel.getInstance().eventSink==null){
                return
            }
            if (wifiNetworkInfo!!.isConnected && dataNetworkInfo!!.isConnected) {
                GloableEventChannel.getInstance().eventSink!!.success(1)
            } else if (wifiNetworkInfo!!.isConnected && !dataNetworkInfo!!.isConnected) {
                GloableEventChannel.getInstance().eventSink!!.success(0)
            } else if (!wifiNetworkInfo!!.isConnected && dataNetworkInfo!!.isConnected) {
                GloableEventChannel.getInstance().eventSink!!.success(3)
            } else {
                GloableEventChannel.getInstance().eventSink!!.success(0)
            }
        } else {
            //获得ConnectivityManager对象
            val connMgr =
                context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            var connectedState = false
            //获取所有网络连接的信息
            val networks = connMgr.allNetworks
            //通过循环将网络信息逐个取出来
            for (i in networks.indices) {
                //获取ConnectivityManager对象对应的NetworkInfo对象
                val networkInfo = connMgr.getNetworkInfo(networks[i])
                if (networkInfo!!.isAvailable && networkInfo!!.isConnected) {
                    connectedState = true
                    break
                }
            }
            if (GloableEventChannel.getInstance().eventSink==null){
                return
            }
            GloableEventChannel.getInstance().eventSink!!.success(if (connectedState) 1 else 0)
        }
    }
}