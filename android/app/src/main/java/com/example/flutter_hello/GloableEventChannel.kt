package com.example.flutter_hello

import io.flutter.plugin.common.EventChannel

class GloableEventChannel {
    var eventSink: EventChannel.EventSink? = null

    private object Holder{
        val instance=GloableEventChannel()
    }

    companion object{
        fun getInstance()=Holder.instance
    }

}