/*Declaración de funciones*/
void testMemory(int segmento, int offset, unsigned char dato, unsigned char dato2);
extern void putchar(char caracter);
extern void pokeb(int segmento, int offset, unsigned char dato);
extern void printAddress(int segmento, int offset);
extern char peekb(int segmento, int offset);

/*Función principal*/
int main(void)
{

  testMemory(0x00,0x3000,0x55,0x0AA);
  while (1) {

  }
  return 0;
}

/*Declaración de funciones*/
void testMemory(int segmento, int offset, unsigned char dato, unsigned char dato2)
{
  while(1)
  {
    printAddress(segmento ,offset);
    pokeb(segmento, offset, dato);
    if( peekb(segmento, offset) != dato )
      {
        putchar('F');
        break;
      }
    pokeb(segmento, offset, dato2);
    if( peekb(segmento, offset) != dato2 )
      {
        putchar('F');
        break;
      }
    else
      if( offset == 0X0FFFF )
        {
          putchar('E');
          break;
        }
    offset++;
  }
}
