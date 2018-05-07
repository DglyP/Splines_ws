public class  CurveBezierCubic implements Curve {

  private ArrayList<Vector> ctrlPoints;
  private int numberOfPoints;

  public CurveBezierCubic(ArrayList<Vector> ctrlPoints, int numberOfPoints) {

    this.ctrlPoints = ctrlPoints;
    this.numberOfPoints = numberOfPoints;
  }


  public String name() {
    return "Bezier cubic";
  }

  public Vector PointOnCubicBezier( Vector cp0, Vector cp1, Vector cp2, Vector cp3, float t) {
    Vector result = new Vector();
    float ax, bx, cx, ay, by, cy, az, bz, cz;

    cx = 3*(cp1.x() - cp0.x());
    bx = 3*(cp2.x() - cp1.x())- cx;
    ax = cp3.x() - cp0.x() - cx - bx;

    cy = 3*(cp1.y() - cp0.y());
    by = 3*(cp2.y() - cp1.y())- cy;
    ay = cp3.y() - cp0.y() - cy - by;

    cz = 3*(cp1.z() - cp0.z());
    bz = 3*(cp2.z() - cp1.z())- cz;
    az = cp3.z() - cp0.z() - cz - bz;

    float tSquare = t*t;
    float tCubed = tSquare * t;

    result.setX((ax * tCubed) + (bx * tSquare) + (cx * t) + cp0.x());
    result.setY((ay * tCubed) + (by * tSquare) + (cy * t) + cp0.y());
    result.setZ((az * tCubed) + (bz * tSquare) + (cz * t) + cp0.z());

    return result;
  }


  public void drawCurve() {
    float   dt;


    for (int j = 0; j < 2; j++ ) {

      Vector cp0 = new Vector(), cp1  = new Vector(), cp2  = new Vector(), cp3  = new Vector();
      cp0 = ctrlPoints.get(j + (j*2));
      cp1 = ctrlPoints.get(j + (j*2) + 1);
      cp2 =ctrlPoints.get(j + (j*2) + 2);
      cp3 = ctrlPoints.get(j + (j*2) + 3);

      dt = 1.0 / ( numberOfPoints - 1 );
      for (int i = 0; i < numberOfPoints; i++) {
        Vector aux = PointOnCubicBezier( cp0, cp1, cp2, cp3, i*dt );
        point(aux.x(), aux.y(), aux.z());
      }
    }
  }
}
