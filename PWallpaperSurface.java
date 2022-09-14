package processing.core;
import android.service.wallpaper.WallpaperService;

//https://github.com/processing/processing-android/issues/610#issuecomment-1186500735

public class PWallpaperSurface extends PSurfaceNone {
  public PWallpaperSurface (PSurfaceNone _super) {
    sketch = _super.sketch;
    graphics = _super.graphics;
    component = _super.component;
    surfaceReady = _super.surfaceReady;
    surfaceView = _super.surfaceView;
    view = _super.view;
    wallpaper = _super.wallpaper;
    requestedThreadStart = _super.requestedThreadStart;
    thread = _super.thread;
    paused = _super.paused;
    pauseObject = _super.pauseObject;
    frameRateTarget = _super.frameRateTarget;
    frameRatePeriod = _super.frameRatePeriod;
  }
  
  public WallpaperService getWallpaper() {
    return wallpaper;
  }
}
