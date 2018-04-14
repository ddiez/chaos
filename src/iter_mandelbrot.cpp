#include <Rcpp.h>
#include <complex>

using namespace Rcpp;
using namespace std;

//[[Rcpp::export]]
int iter_mandelbrot_c(std::complex<double> c, int maxit = 100, double tol = 1e-6) {
  complex<double> z0(0, 0);
  complex<double> z;
  int n = 0;

  for (int k = 0; k < maxit; k++) {
    z = pow(z0, 2) + c;
    //cout << "Complex: " << z << endl;
    //cout << "Module: " << abs(z) << endl;
    n++;

    if(isinf(abs(z))) break;

    if (abs(z - z0) < tol) break;

    z0 = z;
  }

  return n;
}