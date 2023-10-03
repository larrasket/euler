#include <stdio.h>

// just another big int problem, so
// boring :/
int fds(long long n) {
  long long int t = n;
  long long int ans = 0;
  do {
    n *= t;
  } while (t-- != 1);

  while (n) {
    ans += n % 10;
    n /= 10;
  }
  return ans;
}

int main(int argc, char *argv[]) { printf("%d", fds(100)); }
