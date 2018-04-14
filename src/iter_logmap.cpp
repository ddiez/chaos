#include <Rcpp.h>
#include <vector>

using namespace Rcpp;
using namespace std;

// [[Rcpp::export]]
NumericVector iter_logmap_c(double r, int maxit = 100) {
  double x0 = .5;
  double x;
  int warmup = 100;
  NumericVector y(maxit);

  for (int k = 0; k < warmup; k++) {
    x = r * x0 * (1 - x0);
    x0 = x;
  }

  for (int k = 0; k < maxit; k++) {
    x = r * x0 * (1 - x0);
    //cout << "x: " << x << endl;
    y[k] = x;
    x0 = x;
  }
  return unique(y);
}
