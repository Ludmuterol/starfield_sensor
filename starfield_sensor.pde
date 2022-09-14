import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
Star[] stars = new Star[800];
float speed=10.0;

Context context;
SensorManager manager;
Sensor sensor;
AccelerometerListener listener;
float ax, ay, az;

void setup() {
  fullScreen();
  orientation(PORTRAIT);
  frameRate(50);
  for( int i=0;i<stars.length;i++){
    stars[i]=new Star(); 
  }
  context = (new PWallpaperSurface((PSurfaceNone)surface)).getWallpaper();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
  listener = new AccelerometerListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
}

void draw() {
  background(0);
  translate(width/2,height/2);
  for(int i=0;i<stars.length;i++){
    stars[i].update();
    stars[i].show();
  }
}

void resume() {
  if (manager != null) {
    manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
  }
}

void pause() {
  if (manager != null) {
    manager.unregisterListener(listener);
  }
}

class AccelerometerListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    ax = event.values[0];
    ay = event.values[1];
    az = event.values[2];    
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}
public void onResume() {
  super.onResume();
  if (manager != null) {
    manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
  }
}

public void onPause() {
  super.onPause();
  if (manager != null) {
    manager.unregisterListener(listener);
  }
}
