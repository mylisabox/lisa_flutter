package com.mylisabox.lisa.lisa_flutter;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import androidx.annotation.NonNull;
import androidx.wear.ambient.AmbientModeSupport;
import io.flutter.app.FlutterFragmentActivity;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.view.FlutterMain;
import io.flutter.view.FlutterView;

public class MainActivity extends FlutterFragmentActivity implements AmbientModeSupport.AmbientCallbackProvider {
  MethodChannel channel;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    channel = new MethodChannel(getFlutterView(), "wear");
    channel.setMethodCallHandler(new MethodChannel.MethodCallHandler()
    {
      @Override
      public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result)
      {
        switch (call.method) {
          case "getShape":
            getFlutterView().setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener()
            {
              @Override
              public WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets)
              {
                if (windowInsets != null && windowInsets.isRound()) {
                  result.success(0);
                } else {
                  result.success(1);
                }
                return new WindowInsets(windowInsets);
              }
            });
            getFlutterView().requestApplyInsets();
            break;
        }
      }
    });


    // Wire up the activity for ambient callbacks
    AmbientModeSupport.attach(this);
  }

  @Override
  public FlutterView createFlutterView(Context context) {
    FlutterView view = new FlutterView(this);
    view.getDartExecutor().executeDartEntrypoint(new DartExecutor.DartEntrypoint(FlutterMain.findAppBundlePath(), "mainWear"));
    FrameLayout frameLayout = findViewById(android.R.id.content);
    frameLayout.addView(view);
    return view;
  }

  @Override
  public AmbientModeSupport.AmbientCallback getAmbientCallback()
  {
    return new FlutterAmbientCallback(channel);
  }
}

class FlutterAmbientCallback extends AmbientModeSupport.AmbientCallback {
  final MethodChannel channel;

  public FlutterAmbientCallback(MethodChannel channel)
  {
    this.channel = channel;
  }

  @Override
  public void onEnterAmbient(Bundle ambientDetails)
  {
    channel.invokeMethod("enter", null);
    super.onEnterAmbient(ambientDetails);
  }

  @Override
  public void onExitAmbient()
  {
    channel.invokeMethod("exit", null);
    super.onExitAmbient();
  }

  @Override
  public void onUpdateAmbient()
  {
    channel.invokeMethod("update", null);
    super.onUpdateAmbient();
  }
}
