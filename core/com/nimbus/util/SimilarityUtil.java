package com.nimbus.util;

public class SimilarityUtil {
  private static int min(int one, int two, int three) {
    int min = one;
    if (two < min) {
      min = two;
    }
    
    if (three < min) {
      min = three;
    }
    
    return min;
  }
  
  private static double min(double one, double two, double three) {
    double min = one;
    if (two < min) {
      min = two;
    }
    
    if (three < min) {
      min = three;
    }
    
    return min;
  }

  public static double cost(char ch1, char ch2) {
    if (ch1 == ch2) {
      return 0;
    } else if ((ch1 == 'B' && ch2 == '8') ||
               (ch1 == '8' && ch2 == 'B') ||
               (ch1 == '0' && ch2 == 'O') ||
               (ch1 == '0' && ch2 == 'o') ||
               (ch1 == 'O' && ch2 == '0') ||
               (ch1 == 'o' && ch2 == '0') ||
               (ch1 == '5' && ch2 == 'S') ||
               (ch1 == 'S' && ch2 == '5') ||
               (ch1 == 'D' && ch2 == 'O') ||
               (ch1 == 'O' && ch2 == 'D') ||
               (ch1 == 'D' && ch2 == 'o') ||
               (ch1 == 'o' && ch2 == 'D') ||
               (ch1 == '7' && ch2 == 'T') ||
               (ch1 == 'T' && ch2 == '7')) {
      return 0.4;
    } else if ((ch1 == 'E' && ch2 == 'B') ||
               (ch1 == 'B' && ch2 == 'E') ||
               (ch1 == 'Y' && ch2 == 'V') ||
               (ch1 == 'V' && ch2 == 'Y') ||
               (ch1 == 'G' && ch2 == '6') ||
               (ch1 == '6' && ch2 == 'G') ||
               (ch1 == 'S' && ch2 == '6') ||
               (ch1 == '6' && ch2 == 'S') ||
               (ch1 == 'B' && ch2 == '6') ||
               (ch1 == '6' && ch2 == 'B') ||
               (ch1 == 'S' && ch2 == '9') ||
               (ch1 == '9' && ch2 == 'S') ||
               (ch1 == '6' && ch2 == '5') ||
               (ch1 == '5' && ch2 == '6') ||
               (ch1 == '6' && ch2 == '8') ||
               (ch1 == '8' && ch2 == '6')) {
      return 0.7;
    } else if (ch1 == '-' || ch2 == '-') {
      return 0.1;
    } else {
      return 1;
    }
  }
  
  public static double cost(char ch) {
    if (ch == '-') {
      return 0.1;
    } else {
      return 1;
    }
  }
  
  public static double ld(String str1In, String str2In) {
    String str1 = str1In.replace(" ", "");
    String str2 = str2In.replace(" ", "");
    
    int n = str1.length();
    int m = str2.length();
    if (n == 0) {
      return m;
    }
    if (m == 0) {
      return n;
    }
    double d[][] = new double[n + 1][m + 1];
    for (int i = 0; i <= n; i++) {
      d[i][0] = i;
    }
    for (int j = 0; j <= m; j++) { 
      d[0][j] = j;
    }
    
    for (int i = 1; i <= n; i++) {
      char ch1 = str1.charAt(i - 1);
      for (int j = 1; j <= m; j++) {
        char ch2 = str2.charAt(j - 1);
        // int temp = cost(ch1, ch2);
        double cost_i_j = cost(ch1, ch2);
        double cost_i = cost(ch1);
        double cost_j = cost(ch2);
        d[i][j] = min(d[i - 1][j] + cost_i, 
            d[i][j - 1] + cost_j, 
            d[i - 1][j - 1] + cost_i_j);
      }
    }
    return d[n][m];
  }

  public static double sim(String str1, String str2) {
    //int ld = ld(str1, str2);
    //return 1 - (double) ld / Math.max(str1.length(), str2.length());
    double ld = ld(str1, str2);
    return 1 - ld / Math.max(str1.length(), str2.length());
  }

  public static void main(String[] args) {
    //String str1 = "chenlb.blogjava.net";
    //String str2 = "chenlb.javaeye.com";
    String str1 = "AAS9 00649A";
    String str2 = "AA59-00649A";
    System.out.println("ld=" + ld(str1, str2));
    System.out.println("sim=" + sim(str1, str2));
  }
}
