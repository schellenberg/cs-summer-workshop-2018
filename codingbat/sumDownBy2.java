public int sumDownBy2(int n) {
  if (n < 0) {
    return 0;
  }
  if (n == 1) {
    return 1;
    }
  else if (n == 0) {
    return 0;
    }
  else {
    return n  + sumDownBy2(n - 2);
    }
}
