#define EPS 0.000000001
#define ROOT_DEGREE 5
#define COEFFICIENT 4

double task(const int num) {
    double prev_root = num;
    double new_root = num / (double) ROOT_DEGREE;

    while ((prev_root - new_root) > EPS) {
        prev_root = new_root;
        new_root = (COEFFICIENT * prev_root + num / (prev_root * prev_root * prev_root * prev_root) ) / ROOT_DEGREE;
    }
    return new_root;
}
