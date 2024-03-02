val r = 1;
val i = 2;
val k;
val a;

while (i <= 20) {
    if (r % i) {
        k = i;
        a = k * i;
        while (a <= 20) {
            k = i * k;
            a = k * i;
        }
        r = k * r;
    }
    i = i + 1;
}

val n;
n = r;
val c[12];
val p = 0;
while (n > 0) {
    c[p] = n % 10 + 48;
    n = n / 10;
    p = p + 1;
}
p = p - 1;

while (p >= 0){
    n = c[p];
    put n;
    p = p - 1 ;
}