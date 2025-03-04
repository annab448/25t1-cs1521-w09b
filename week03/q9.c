char *string = "....";
char *s = &string[0];   // s = &string
int   length = 0;
while (*s != '\0') {
   length++;  // increment length
   s++;       // move to next char
}

// length = length of string
