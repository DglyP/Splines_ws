/**
 * Splines.
 *
 * Here we use the interpolator.keyFrames() nodes
 * as control points to render different splines.
 *
 * Press ' ' to change the spline mode.
 * Press 'g' to toggle grid drawing.
 * Press 'c' to toggle the interpolator path drawing.
 */

import frames.input.*;
import frames.primitives.*;
import frames.core.*;
import frames.processing.*;

// global variables
// modes: 0 natural cubic spline; 1 Hermite;
// 2 (degree 7) Bezier; 3 Cubic Bezier
int mode;

Scene scene;
Interpolator interpolator;
OrbitNode eye;
boolean drawGrid = true, drawCtrl = true;

//Choose P3D for a 3D scene, or P2D or JAVA2D for a 2D scene
String renderer = P3D;
PFont f;

void setup() {
  size(1000, 600, renderer);
  f = createFont("ROBOTO", 16, true);
  scene = new Scene(this);
  eye = new OrbitNode(scene);
  eye.setDamping(0);
  scene.setEye(eye);
  scene.setFieldOfView(PI / 3);
  //interactivity defaults to the eye
  scene.setDefaultGrabber(eye);
  scene.setRadius(150);
  scene.fitBallInterpolation();
  interpolator = new Interpolator(scene, new Frame());
  // framesjs next version, simply go:
  //interpolator = new Interpolator(scene);

  // Using OrbitNodes makes path editable
  int n = 8;
  if (mode == 3) {
    n = 10;
  }
  for (int i = 0; i < n; i++) {
    Node ctrlPoint = new OrbitNode(scene);
    ctrlPoint.randomize();
    interpolator.addKeyFrame(ctrlPoint);
    println(ctrlPoint.position().x() + ", "+ ctrlPoint.position().y()+ ", "+ ctrlPoint.position().z());
  }
}

void draw() {
  background(175);
  if (drawGrid) {
    stroke(255, 255, 0);
    scene.drawGrid(200, 50);
  }
  if (drawCtrl) {
    fill(255, 0, 0);
    stroke(255, 0, 255);
    for (Frame frame : interpolator.keyFrames())
      scene.drawPickingTarget((Node)frame);
  } else {
    fill(255, 0, 0);
    stroke(255, 0, 255);
    scene.drawPath(interpolator);
  }
  // implement me
  // draw curve according to control polygon an mode
  // To retrieve the positions of the control points do:
  ArrayList<Vector> points = new ArrayList<Vector>();
  for (Frame frame : interpolator.keyFrames()) {
    points.add(frame.position());
  }
  switch (mode){
    case 0:
    NaturalCubic curveNatural = new NaturalCubic(points, 1000);
    textFont(f,16);
    fill(255,0,0);
    text(curveNatural.name(),-150,-150);
    curveNatural.drawCurve();
    break;
    case 1:
    CurveHermite curveHermite = new CurveHermite(points, 10000);
    textFont(f,16);
    fill(255,0,0);
    text(curveHermite.name(),-150,-150);
    curveHermite.drawCurve();
    break;
    case 2:
    CurveBezier7 curveBezier7 = new CurveBezier7(points, 10000);
    textFont(f,16);
    fill(255,0,0);
    text(curveBezier7.name(),-150,-150);
    curveBezier7.drawCurve();
    break;
    case 3:
      CurveBezierCubic curve = new CurveBezierCubic(points, 1000);
    textFont(f,16);
    fill(255,0,0);
    text(curve.name(),-150,-150);
    curve.drawCurve();
    break;
  }
 
}

void keyPressed() {
  if (key == ' ')
    mode = mode < 3 ? mode+1 : 0;
  if (key == 'g')
    drawGrid = !drawGrid;
  if (key == 'c')
    drawCtrl = !drawCtrl;
}
