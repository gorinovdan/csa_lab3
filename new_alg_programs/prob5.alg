val divisors[20];
val n = 2;
val number;
val div_ptr;

while (n < 21) {
    number = n;
    div_ptr = 0;
    while ((div_ptr < 20) & divisors[div_ptr]){
        if (number % divisors[div_ptr] == 0) {
            number = number / divisors[div_ptr];
        }
        div_ptr = div_ptr + 1;
    }
    if ( number > 1 ){
        divisors[div_ptr] = number;
    }
    n = n + 1;
}
