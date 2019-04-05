#include<stdio.h>
#include<stdlib.h>
#include<string.h>
void* removeComments(char**,int *);
void* includeHeader(char*, int *);
void* macro(char**,int,int);
char* fgetString(FILE *fp)
{
	int i=0;
	char *p=NULL;
	do{
		p=realloc(p,i+2);
		p[i]=fgetc(fp);//fread(p[i],1,1,fp);
	}while(p[i++]!='\n');
	p[i]='\0';
	return p;
}
void* getFile(FILE *fp,int *lc)
{
	char **buf=NULL,ch;
CHECK_EOF:
	while((ch=fgetc(fp))!=EOF)
	{
		if(ch==' ' || ch=='\t') goto CHECK_EOF;//REMOVE INDENTS
		fseek(fp,-1,1);
		buf=realloc(buf,((*lc)+1)*sizeof(char*));
		buf[(*lc)]= fgetString(fp);
		(*lc)++;
	}
	return buf;
}
main(int argc, char **argv)
{
	FILE *fp;
	char **buf=NULL,**t=NULL;
	char ***bufH=NULL;
	int lc=0,lh[4]={0};
	int i,j,h=0;
	char ch;
	void* removeComments(char**,int *);
	void* includeHeader(char*, int *);
	printf("\nPROG START\n");
	if(argc!=2)
	{
		printf("Wrong Syntax.\n");	// ./prepro <filename.c>
		return 0;
	}
	fp=fopen(argv[1],"r");
	buf=getFile(fp,&lc);  //Getting File into buffer
	printf("\nsize of buf=%d\n",sizeof(buf));
	void* includeHeader(char*, int *);
	fclose(fp);
	t=buf;
	t=(char**)removeComments(t,&lc);	//Remove Comments
	printf("ENTERING PREPROCESSOR COMMANDS\n");
	/* Inclusion of PREPROCESSOR COMMANDS */
	for(i=0;i<lc;i++)	
	{
		if(t[i][0]=='#' && strstr(t[i],"include"))
		{
			bufH=realloc(bufH,(h+1)*sizeof(char**));
			bufH[h]=includeHeader(t[i], &lh[h]);
			h++;
			t[i]="\n";	
		}
		if(t[i][0]=='#' && strstr(t[i],"define"))
		{
			buf=macro(buf,i,lc);
			t[i]="\n";			
		}
	}
/* COMMANDS:
if(t[i][0]=='#' && strstr(t[i],"ifdef"))
if(t[i][0]=='#' && strstr(t[i],"ifndef"))
if(t[i][0]=='#' && strstr(t[i],"else"))
if(t[i][0]=='#' && strstr(t[i],"if"))
if(t[i][0]=='#' && strstr(t[i],"elif"))
if(t[i][0]=='#' && strstr(t[i],"endif"))
if(t[i][0]=='#' && strstr(t[i],"undef"))
if(t[i][0]=='#' && strstr(t[i],"pragma"))
if(t[i][0]=='#' && strstr(t[i],"error"))
if(t[i][0]=='#' && strstr(t[i],"elif"))
*/

buf=t;
//printf("lol\n");
fp=fopen("testprog.i","w");
for(i=0;i<h;i++)
{//	printf("lh=%d\n",lh[i]);
	for(j=0;j<lh[i];j++)
	{
		//printf("%s",bufH[i][j]);
		fprintf(fp,"%s",bufH[i][j]);
}	}
for(i=0;i<lc;i++)
	fprintf(fp,"%s",buf[i]);
fclose(fp);
free(buf);
free(bufH);
}

void* removeComments(char **p,int *lc)
{
	int i,j=0;
	char *q[2]={0,0};
	char *x=NULL,*y=NULL;
	for(i=0;i<(*lc);i++)
	{	
		q[0]=0,q[1]=0;
		if(q[0]=strchr(p[i],34))
		{	
			if((q[1]=strchr(q[0]+1,34) )==0)
			{
				for(j=i+1;;j++)
				{
					if((q[1]=strchr(p[j],34)) !=0) 
					{
						i=j; break;	
		}	}	}	}
		if( x=strstr(p[i],"//"))
		{	
			if( !( (q[0]<x) && (q[1]>x) ) )
			{	
				strcpy(x,"");//"n"='\n\0'
				continue;
		}	}
		if( x=strstr(p[i],"/*") )
		{	
			if( !(q[0]<x && q[1]>x))
			{	
				strcpy(x,"\n");
				if(y=strstr(x+2,"*/"))	
					memmove(x,y+2,y+2-x);
				else
				{
					for(j=i+1;;j++)
					{	
						if(x=strstr(p[j],"*/"))
						{
							strcpy(x,"\n");
							break;
						}			
						strcpy(p[j],"");
					}
					i=j;
	}	}	}	}
	return p;
}
void* includeHeader(char *l,int *lc)
{	//include"stdio.h"?		//include abcd<stdio.h>?
	char **bufH=NULL;
	char t[50];
	char path[50],*tok;
	FILE *fh;
	strcpy(path,"/usr/include/");
//	printf("Reached include condition\n");
	strcpy(t,l);
	strtok(t,"<>\"");
	tok=strtok(NULL,"<>\"");	//tok= stdio.h
	printf("\ntok=%s\n",tok);
	if(strchr(t,'\"'))
	{if((fh=fopen(tok,"r"))==NULL)
		fh=fopen(strcat(path,tok),"r"); // /usr/include/stdio.h
	}
	else	
		fh=fopen(strcat(path,tok),"r"); // /usr/include/stdio.h
//	printf("\nfh=%s\n",path);
	if(fh!=NULL)
	{
		bufH=getFile(fh,&(*lc));
		bufH=removeComments(bufH, &(*lc));
//		printf("FINISHED Buffer of header,header=%s\n",tok);
//		printf("IT WORKS\n");
	}
	return bufH;
}

void* macro(char **buf,int l,int lc)
{	//#define MAC definition
	char **tb=buf;
	char tl[80],*tok;
	char m[10];
	char def[50];
	strcpy(tl,buf[l]);
	strtok(tl," ");
	tok=strtok(NULL," ");
	strcpy(m,tok);		//m=MAC
	tok=strtok(NULL," ");
	strcpy(def,tok);	//def=definition
	for(i=l+1;i<lc;i++)
	{	if(strstr(tb[i],"undef"))
		{	if(strstr(tb[i],m))
				break;
		}
		if(tok=strstr(tb[i],m))
		{if(
			buf=realloc(buf,strlen(def)+sizeof(buf));
			strncpy(tok, def, strlen(def));	
			`


