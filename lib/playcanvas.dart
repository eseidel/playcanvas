// ignore_for_file: non_constant_identifier_names

@JS('pc')
library playcanvas.js;

import 'dart:html' show CanvasElement, Element;

import 'package:js/js.dart';

@JS()
@staticInterop
abstract class AppBase {}

@JS()
@anonymous
class ApplicationOptions {}

@JS()
abstract class Application extends AppBase {
  external factory Application(
      CanvasElement canvas, ApplicationOptions options);
  external void start();

  external Entity get root;
  external GraphicsDevice get graphicsDevice;
}

@JS()
abstract class CameraComponent extends Component {
  external factory CameraComponent(ComponentSystem system, Entity entity);
  external set clearColor(Color color);
}

@JS()
abstract class Color {
  external factory Color(double r, double g, double b, [double a = 1]);

  external static Color get RED;
  external static Color get BLACK;
  external static Color get WHITE;
}

@JS()
abstract class Component extends EventHandler {
  external factory Component(ComponentSystem system, Entity entity);
}

@JS()
abstract class ComponentSystem extends EventHandler {
  external factory ComponentSystem(AppBase app);
}

@JS()
abstract class ElementInput {
  external factory ElementInput(Element element);
}

@JS()
@anonymous
abstract class ComponentOptions {}

@JS()
@anonymous
class RenderOptions extends ComponentOptions {
  external String get type;
  external Material get material;

  external factory RenderOptions({String type, Material material});
}

@JS()
@anonymous
class CameraOptions extends ComponentOptions {
  external Color get clearColor;

  external factory CameraOptions({Color clearColor});
}

@JS()
@anonymous
class LightOptions extends ComponentOptions {
  external String get type;
  external Color get color;
  external bool get castShadows;
  external double get intensity;
  external double get shadowBias;
  external double get shadowDistance;
  external double get normalOffsetBias;
  external int get shadowResolution;

  external factory LightOptions({
    String type,
    Color color,
    bool castShadows,
    double intensity,
    double shadowBias,
    double shadowDistance,
    double normalOffsetBias,
    int shadowResolution,
  });
}

@JS()
@anonymous
class ScreenOptions extends ComponentOptions {
  external Vec2 get referenceResolution;
  external bool get screenSpace;

  external factory ScreenOptions({
    Vec2 referenceResolution,
    bool screenSpace,
  });
}

@JS()
abstract class Entity extends GraphNode {
  external factory Entity([String name]);
  external addComponent(String type, [ComponentOptions data]);
  external addChild(GraphNode child);
  external setPosition(num x, num y, num z);
  external setEulerAngles(num x, num y, num z);
  external rotate(num x, num y, num z);
  external rotateLocal(num x, num y, num z);
  external translateLocal(num x, num y, num z);
  external translate(num x, num y, num z);
  external setRotation(num x, num y, num z);
  external setLocalRotation(num x, num y, num z);
  external setLocalPosition(num x, num y, num z);
  external setLocalEulerAngles(num x, num y, num z);
  external setLocalScale(num x, num y, num z);
}

@JS()
abstract class EventHandler {
  // https://developer.playcanvas.com/api/pc.html#HandleEventCallback
  external void on(
      String event,
      void Function(
              [dynamic arg1,
              dynamic arg2,
              dynamic arg3,
              dynamic arg4,
              dynamic arg5,
              dynamic arg6,
              dynamic arg7,
              dynamic arg8])
          callback);
}

@JS()
abstract class GraphicsDevice {
  external num get maxCubeMapSize;
  external num get maxTextureSize;
  external num get maxPixelRatio;
}

@JS()
abstract class GraphNode extends EventHandler {}

@JS()
abstract class LightComponent extends Component {
  external factory LightComponent(ComponentSystem system, Entity entity);
  external set type(String type);
  external set color(Color color);
}

@JS()
@staticInterop
abstract class Material {
  external factory Material();
}

@JS()
abstract class Mouse extends EventHandler {
  external factory Mouse(Element element);
}

@JS()
abstract class RenderComponent extends Component {
  external factory RenderComponent(ComponentSystem system, Entity entity);
  external set type(String type);
}

@JS()
abstract class StandardMaterial extends Material {
  external factory StandardMaterial();
  external set diffuse(Color color);
  external void update();
}

@JS()
abstract class TouchDevice extends EventHandler {
  external factory TouchDevice(Element element);
}

@JS()
@staticInterop
abstract class Vec2 {
  external factory Vec2(num x, num y);
}

@JS()
@staticInterop
abstract class Vec3 {
  external factory Vec3(num x, num y, num z);
}
