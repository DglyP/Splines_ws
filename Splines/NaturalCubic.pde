public class  NaturalCubic implements Curve {

  private ArrayList<Vector> ctrlPoints;
  private int numberOfPoints;

  public NaturalCubic(ArrayList<Vector> ctrlPoints, int numberOfPoints) {

    this.ctrlPoints = ctrlPoints;
    this.numberOfPoints = numberOfPoints;
  }


  public String name() {
    return "Natural cubic";
  }

  private ArrayList<float[]> calculate(float[] axisCoordenades, float[] gamma, int k) {
    ArrayList<float[]> result = new  ArrayList<float[]>();
    float[] a, b, c, d, omega, derivate;
    a = new float[8];
    b = new float[8];
    c= new float[8];
    d  = new float[8];
    omega = new float[8];
    derivate = new float[8];

    /* Calculamos el valor de omega para abcisas */
    omega[0] = 3. *( axisCoordenades[1]- axisCoordenades[0]) * gamma[0];
    for (int i=1; i<k; i++) {
      omega[i] = (3. * ( axisCoordenades[i+1] - axisCoordenades[i-1] )- omega[i-1] ) * gamma[i];
    }
    omega[k] = (3. * (axisCoordenades[k] - axisCoordenades[k-1] )-omega[k-1] ) * gamma[k];

    /* Valor de la primera derivada en los puntos (eje ) */
    derivate[k] = omega[k];
    for (int i=k-1; i>=0; i=i-1) {
      derivate[i] = omega[i] -gamma[i] * derivate[i+1];
    }

    /* Sustituimos los valores de gamma, omega y la primera derivada
     para calcular los coeficientes a, b, c y d */
    for (int i=0; i<k; i++) {
      a[i] = axisCoordenades[i];
      b[i] = derivate[i];
      c[i] = 3. * ( axisCoordenades[ i + 1] - axisCoordenades[ i ] ) - 2. * derivate[ i ] - derivate[ i + 1 ];
      d[i] = 2. * (axisCoordenades[ i ] - axisCoordenades[ i + 1 ] ) + derivate[ i ] + derivate[ i + 1 ];
    }

    result.add(0, a);
    result.add(1, b);
    result.add(2, c);
    result.add(3, d);

    return result;
  }

  public void drawCurve() {
    float[] gamma;
    int level = 7;
    ArrayList<float[]> x, y, z;
    gamma = new float[8];
    x = new ArrayList<float[]>();
    y = new ArrayList<float[]>();
    z = new ArrayList<float[]>();
    gamma[0] = 0.5;
    for (int i = 1; i <level; i++) {
      gamma[i] = 1. / (4. - gamma[i-1]);
    }
    gamma[level] = 1. / (2.- gamma[level-1]);

    for (int i = 0; i < 3; i ++) {

      float[] axis = new float[8];
      if (i == 0) {
        for (int j = 0; j < 8; j++)
          axis[j] = ctrlPoints.get(j).x();
        x = calculate(axis, gamma, level);
      }
      if (i == 1) {
        for (int j = 0; j < 8; j++)
          axis[j] = ctrlPoints.get(j).y();
        y = calculate(axis, gamma, level);
      }
      if (i == 2) {
        for (int j = 0; j < 8; j++)
          axis[j] = ctrlPoints.get(j).z();
        z = calculate(axis, gamma, level);
      }
    }
    /* En esta parte, se dibujara la curva por segmentos de puntos; */
    float dt = 1. / numberOfPoints;
    for (int i=0; i<level + 1; i++) {
      for (float t = dt; t <=1; t+=dt) {
        float xp, yp, zp;
        xp = (x.get(0)[i] + x.get(1)[i]*t+x.get(2)[i]*t*t+x.get(3)[i]*t*t*t);
        yp = (y.get(0)[i]+y.get(1)[i]*t+y.get(2)[i]*t*t+y.get(3)[i]*t*t*t);
        zp = (z.get(0)[i]+z.get(1)[i]*t+z.get(2)[i]*t*t+z.get(3)[i]*t*t*t);
        point(xp, yp, zp);
      }
    }
  }
}
