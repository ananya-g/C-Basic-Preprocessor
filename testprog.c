//REVERSING THE ARRAY
#include<stdio.h>
#include<string.h>
void reverse(int *a,int n)
{
	int t,l,r;
	for(l=n-1,r=0;l>r;l--,r++)
		if(a[l]!=a[r])
			t=a[l], a[l]=a[r], a[r]=t;
	return;
}
main()
{
	int a[10],i;
	srand(getpid());
	/*
	   for(i=0;i<10;i++)
	   scanf("%d",&a[i]);
	*/
	for(i=0;i<10;i++)
	{
	/*nigger what the fuck*/
		a[i]=rand()%100;
		printf("%d, ",a[i]);
	}

	reverse(a,10);
	printf("Reve//rsed:");
	for(i=0;i<10;i++)
		printf("%d, ",a[i]);
}
