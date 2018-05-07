public class  CurveHermite implements Curve {

  private ArrayList<Vector> ctrlPoints;
  private int numberOfPoints;

  public CurveHermite(ArrayList<Vector> ctrlPoints, int numberOfPoints) {

    this.ctrlPoints = ctrlPoints;
    this.numberOfPoints = numberOfPoints;
  }


  public String name() {
    return "Hermite";
  }

  private float[] convertVectotToArray(Vector data) {
    float[] result = new float[3];
    result[0] = data.x();
    result[1] = data.y();
    result[2] = data.z();
    return result;
  }

  private Vector getPointsToCalculate(int index) {
    Vector result;
    if (index < 0)
      result =  ctrlPoints.get(0);
    else if (index >= int(ctrlPoints.size()))
      result =   ctrlPoints.get(7);
    else
      result =  ctrlPoints.get(index);

    return result;
  }

  private float calculateHermite(float[] data) {
    float result = 0., a, b, c, d, tSquare, tCubic;
    a = -data[0] / 2. + (3. * data[1]) / 2. - (3. * data[2]) / 2. + data[3] / 2.;
    b = data[0] - (5. * data[1] ) / 2. + 2. * data[2] - data[3] / 2.;
    c = -data[0]/2. + data[2]/2.;
    d = data[1];
    tSquare = data[4]*data[4];
    tCubic = tSquare * data[4];
    result = a*tCubic + b*tSquare + c*data[4] + d;

    return result;
  }

  public void drawCurve() {
    for (int i = 0; i < numberOfPoints; i++) {
      float percent = ((float)i) / (float(numberOfPoints - 1));
      float dx = (ctrlPoints.size()-1) * percent;
      int index = int(dx);
      float t = dx - floor(dx);
      Vector A = getPointsToCalculate(index - 1);
      Vector B = getPointsToCalculate(index);
      Vector C = getPointsToCalculate(index + 1);
      Vector D = getPointsToCalculate(index + 2);

      float[] floatX = {A.x(), B.x(), C.x(), D.x(), t};
      float x =calculateHermite(floatX);
      float[] floatY = {A.y(), B.y(), C.y(), D.y(), t};
      float y =calculateHermite(floatY);
      float[] floatZ = {A.z(), B.z(), C.z(), D.z(), t};
      float z =calculateHermite(floatZ);
      point(x, y, z);
    }
  }
}
