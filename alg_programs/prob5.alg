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

val result = 1;
div_ptr = 0;
while (divisors[div_ptr]){
    result = result * divisors[div_ptr];
    div_ptr = div_ptr + 1;
}
number = result;
val character[12];
val char_ptr = 0;
while (number > 0) {
    character[char_ptr] = result % 10 + 48;
    number = number / 10;
    char_ptr = char_ptr + 1;
}
char_ptr = char_ptr - 1;

while (char_ptr >= 0){
    number = character[char_ptr];
    put number;
    char_ptr = char_ptr - 1 ;
}


