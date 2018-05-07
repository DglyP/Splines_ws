public class  CurveBezier7 implements Curve {

  private ArrayList<Vector> ctrlPoints;
  private int numberOfPoints;

  public CurveBezier7(ArrayList<Vector> ctrlPoints, int numberOfPoints) {

    this.ctrlPoints = ctrlPoints;
    this.numberOfPoints = numberOfPoints;
  }


  public String name() {
    return "Bezier 7";
  }

  private float[] buildArray(int letter) {
    float[] result = new float[ctrlPoints.size()];
    for (int i= 0; i< ctrlPoints.size(); i++) {
      switch(letter) {
      case 0:
        result[i] = ctrlPoints.get(i).x();
        break;
      case 1:
        result[i] = ctrlPoints.get(i).y();
        break;
      case 2:
        result[i] = ctrlPoints.get(i).z();
        break;
      }
    }
    return result;
  }
  public void drawCurve() {
    float[] arrayX = buildArray(0), arrayY = buildArray(1), arrayZ = buildArray(2);
    float du = 1. / numberOfPoints;
    
    for(float u = 0.; u <= 1; u += du){
      float x, y ,z ;
      x = ((pow(1-u,7))*arrayX[0]) + (7*pow(1-u, 6)*u*arrayX[1]) + + (21*pow(1-u, 5)*pow(u,2)*arrayX[2]) + (35*pow(1-u, 4)*pow(u,3)*arrayX[3]) + (35*pow(1-u, 3)*pow(u,4)*arrayX[4]) + (21*pow(1-u, 2)*pow(u,5)*arrayX[5]) + (7*(1-u)*pow(u,6)*arrayX[6]) +(pow(u,7)*arrayX[7]) ;
      y = ((pow(1-u,7))*arrayY[0]) + (7*pow(1-u, 6)*u*arrayY[1]) + + (21*pow(1-u, 5)*pow(u,2)*arrayY[2]) + (35*pow(1-u, 4)*pow(u,3)*arrayY[3]) + (35*pow(1-u, 3)*pow(u,4)*arrayY[4]) + (21*pow(1-u, 2)*pow(u,5)*arrayY[5]) + (7*(1-u)*pow(u,6)*arrayY[6]) +(pow(u,7)*arrayY[7]) ;
      z = ((pow(1-u,7))*arrayZ[0]) + (7*pow(1-u, 6)*u*arrayZ[1]) + + (21*pow(1-u, 5)*pow(u,2)*arrayZ[2]) + (35*pow(1-u, 4)*pow(u,3)*arrayZ[3]) + (35*pow(1-u, 3)*pow(u,4)*arrayZ[4]) + (21*pow(1-u, 2)*pow(u,5)*arrayZ[5]) + (7*(1-u)*pow(u,6)*arrayZ[6]) +(pow(u,7)*arrayZ[7]) ;
      point(x,y,z);
    }
  }
}
