#define EPS 0.000000001
#define ROOT_DEGREE 5
#define COEFFICIENT 4

double task(const int num) {
    double xp = num;
    double xn = num / (double) ROOT_DEGREE;

    while ((xp - xn) > EPS) {
        xp = xn;
        xn = (COEFFICIENT * xp + num / (xp * xp * xp * xp) ) / ROOT_DEGREE;
    }
    return xn;
}
