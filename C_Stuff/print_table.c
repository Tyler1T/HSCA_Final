#include <stdio.h>
#include <math.h>

/*
	This program generates the table for the Spring 2021 4233 class
*/

/*
  Rounding Calls
*/

double rnd_near(double x, double bits) {
  double scale, x_round;
  scale = pow(2.0, bits);
  x_round = rint(x * scale) / scale;
  return x_round;
}

double rnd_down(double x, double bits) {
  double scale, x_round;
  scale = pow(2.0, bits);
  x_round = floor(x * scale) / scale;
  return x_round;
}

double rnd_up(double x, double bits) {
  double scale, x_round;
  scale = pow(2.0, bits);
  x_round = ceil(x * scale) / scale;
  return x_round;
}

double rnd_zero(double x, double bits) {
  if (x < 0) 
    return rnd_up(x, bits);
  else
    return rnd_down(x, bits);
}


/*
  Floor function
*/

double flr(double x, double precision) {
  double scale, x_round;
  scale = pow(2.0, precision);
  x_round = floor(x * scale) / scale;
  return x_round;
}


/*
  Binary Conversion
*/

void disp_bin(double x, int bits_to_left, int bits_to_right, FILE *out_file) {
  double diff;
  int i;
  if (fabs(x) <  pow(2.0, -bits_to_right)) {
    for (i = -bits_to_left + 1; i <= bits_to_right; i++) {
      printf("0");
    }
    return;
  }
  if (x < 0.0) {
    x = pow(2.0, ((double) bits_to_left)) + x;
  }
  for (i = -bits_to_left + 1; i <= bits_to_right; i++) {
    diff = pow(2.0, -i);
    if (x < diff) {
      printf("0");
    }
    else {
      fprintf(out_file, "1");
      x -= diff;
    }
    if (i == 0) {
      printf(".");
    }
  }
}


int main () {

  int sign_integer = 1;
  int fraction = 15;
  int m = 8;
  int i;
  double x, xl, xm;
  double y0, y1;
  double x0f, x1f;
  double a0[256];
  double a1[256];

  for (i=0; i < 128; i++) {
    x = 1.0 + pow(2.0, -7)*i;
    xm = rnd_down(x, 7);
    xl = x - xm;
    x0f = ((xm + pow(2.0, (-m-1)) + sqrt(2)*pow(2.0, (-m-2))));
    x1f = ((xm + pow(2.0, (-m-1)) - sqrt(2)*pow(2.0, (-m-2))));
    y0 = 1/x0f;
    y1 = 1/x1f;
    a0[i] = rnd_near(((-1.0/2)*y0*(sqrt(2)-1))+((1.0/2)*y1*(sqrt(2)+1)), 17);
    a1[i] = rnd_near(fabs(sqrt(2)*(y0-y1) * pow(2.0, m)), 11);
    printf("x = %.8f\t", x);
    printf("a0[%d] = %.15f\t", i, a0[i]);
    printf("a1[%d] = %.12f\n", i, a1[i]);        

  }

  
}
