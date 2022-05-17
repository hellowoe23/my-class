extern "C"
{
#include <openssl/applink.c>
};
#include <stdio.h>
#include <openssl/evp.h>
#include <openssl/bio.h>
unsigned char* sm3(unsigned char* msg)
{
   EVP_MD_CTX* ctx = NULL;
   EVP_MD* SM3 = NULL;
   unsigned int len = 0;
   unsigned char* outdigest = NULL;
    unsigned char *ret=(unsigned char*)malloc(32*sizeof(unsigned char*));
  
    ctx = EVP_MD_CTX_new();
    if (ctx == NULL)
        goto err;

  
    SM3 = EVP_MD_fetch(NULL, "SM3", NULL);
    if (SM3 == NULL)
        goto err;

   
    if (!EVP_DigestInit_ex(ctx, SM3, NULL))
        goto err;

  
    if (!EVP_DigestUpdate(ctx, msg, sizeof(msg)))
        goto err;

    outdigest = (unsigned char*)OPENSSL_malloc(EVP_MD_get_size(SM3));
    if (outdigest == NULL)
        goto err;


    if (!EVP_DigestFinal_ex(ctx, outdigest, &len))
        goto err;
   
     for (int i = 0; i < 32; i++)
    {
         ret[i] = outdigest[i];
    }
   
    //BIO_dump_fp(stdout, outdigest, len);

err:
    /* Clean up all the resources we allocated */

    EVP_MD_free(SM3);
    EVP_MD_CTX_free(ctx);
    OPENSSL_free(outdigest);
    return ret;
}
void birthday_attack(unsigned char* m)
{
    unsigned char* temp;
    unsigned char* temp1;
    unsigned char btemp[32], btemp1[32];
    //const unsigned char r[] = "123";
   EVP_MD* SM3 = NULL;
   temp=sm3(m);
   temp1 = sm3(m);
   while(1){
       for (int i = 0; i < 32; i++)
       {
           btemp[i] = temp[i];
       }
    free(temp);
    temp=sm3(btemp);
    for (int i = 0; i < 32; i++)
    {
      btemp[i] = temp[i];
    }
    free(temp);
    temp = sm3(btemp);
    for (int i = 0; i < 32; i++)
    {
        btemp1[i] = temp1[i];
    }
    free(temp1);
    temp1=sm3(btemp1);
   for (int i = 0; i <3; i++)
   {
       if (temp[i] != temp1[i]) goto flag;
   }
   printf("Ç°24Î»sm4Åö×²£º\n");
   for (int i = 0; i < 32; i++)
   {
       printf("%02hx", btemp[i]);
   }
   printf("\n");
   for (int i = 0; i < 32; i++)
   {
       printf("%02hx", temp[i]);
   }
   printf("\n");
   for (int i = 0; i < 32; i++)
   {
       printf("%02hx", btemp1[i]);
   }
   printf("\n");
   for (int i = 0; i < 32; i++)
   {
       printf("%02hx", temp1[i]);
   }
   printf("\n");
   break;
flag:
   continue;
   }
}
int main(void)
{
    unsigned char m[] = "abc";
    birthday_attack(m);
}
