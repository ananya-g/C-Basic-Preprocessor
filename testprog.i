
02111-1307 USA.  




#ifndef _STDIO_H

#if !defined __need_FILE && !defined __need___FILE
# define _STDIO_H	1
# include <features.h>

__BEGIN_DECLS

# define __need_size_t
# define __need_NULL
# include <stddef.h>

# include <bits/types.h>
# define __need_FILE
# define __need___FILE
#endif 


#if !defined __FILE_defined && defined __need_FILE

__BEGIN_NAMESPACE_STD

typedef struct _IO_FILE FILE;
__END_NAMESPACE_STD
#if defined __USE_LARGEFILE64 || defined __USE_SVID || defined __USE_POSIX \
|| defined __USE_BSD || defined __USE_ISOC99 || defined __USE_XOPEN \
|| defined __USE_POSIX2
__USING_NAMESPACE_STD(FILE)
#endif

# define __FILE_defined	1
#endif 
#undef	__need_FILE


#if !defined ____FILE_defined && defined __need___FILE


typedef struct _IO_FILE __FILE;

# define ____FILE_defined	1
#endif 
#undef	__need___FILE


#ifdef	_STDIO_H
#define _STDIO_USES_IOSTREAM

#include <libio.h>

#ifdef __USE_XOPEN
# ifdef __GNUC__
#  ifndef _VA_LIST_DEFINED
typedef _G_va_list va_list;
#   define _VA_LIST_DEFINED
#  endif
# else
#  include <stdarg.h>
# endif
#endif


__BEGIN_NAMESPACE_STD
#ifndef __USE_FILE_OFFSET64
typedef _G_fpos_t fpos_t;
#else
typedef _G_fpos64_t fpos_t;
#endif
__END_NAMESPACE_STD
#ifdef __USE_LARGEFILE64
typedef _G_fpos64_t fpos64_t;
#endif


#define _IOFBF 0 		
#define _IOLBF 1		
#define _IONBF 2		



#ifndef BUFSIZ
# define BUFSIZ _IO_BUFSIZ
#endif



Some things throughout the library rely on this being -1.  
#ifndef EOF
# define EOF (-1)
#endif



These values should not be changed.  
#define SEEK_SET	0	
#define SEEK_CUR	1	
#define SEEK_END	2	


#if defined __USE_SVID || defined __USE_XOPEN

# define P_tmpdir	"/tmp"
#endif



FILENAME_MAX	Maximum length of a filename.  
#include <bits/stdio_lim.h>



extern struct _IO_FILE *stdin;		
extern struct _IO_FILE *stdout;		
extern struct _IO_FILE *stderr;		
#ifdef __STDC__

#define stdin stdin
#define stdout stdout
#define stderr stderr
#endif

__BEGIN_NAMESPACE_STD

extern int remove (__const char *__filename) __THROW;

extern int rename (__const char *__old, __const char *__new) __THROW;
__END_NAMESPACE_STD

#ifdef __USE_ATFILE

extern int renameat (int __oldfd, __const char *__old, int __newfd,
__const char *__new) __THROW;
#endif

__BEGIN_NAMESPACE_STD

marked with __THROW.  
#ifndef __USE_FILE_OFFSET64
extern FILE *tmpfile (void);
#else
# ifdef __REDIRECT
extern FILE *__REDIRECT (tmpfile, (void), tmpfile64);
# else
#  define tmpfile tmpfile64
# endif
#endif

#ifdef __USE_LARGEFILE64
extern FILE *tmpfile64 (void);
#endif


extern char *tmpnam (char *__s) __THROW;
__END_NAMESPACE_STD

#ifdef __USE_MISC

that it does not allow S to be NULL.  
extern char *tmpnam_r (char *__s) __THROW;
#endif


#if defined __USE_SVID || defined __USE_XOPEN

is allocated by `malloc'.  
extern char *tempnam (__const char *__dir, __const char *__pfx)
__THROW __attribute_malloc__;
#endif


__BEGIN_NAMESPACE_STD

marked with __THROW.  
extern int fclose (FILE *__stream);

marked with __THROW.  
extern int fflush (FILE *__stream);
__END_NAMESPACE_STD

#ifdef __USE_MISC

therefore not marked with __THROW.  
extern int fflush_unlocked (FILE *__stream);
#endif

#ifdef __USE_GNU

therefore not marked with __THROW.  
extern int fcloseall (void);
#endif


__BEGIN_NAMESPACE_STD
#ifndef __USE_FILE_OFFSET64

marked with __THROW.  
extern FILE *fopen (__const char *__restrict __filename,
__const char *__restrict __modes);

marked with __THROW.  
extern FILE *freopen (__const char *__restrict __filename,
__const char *__restrict __modes,
FILE *__restrict __stream);
#else
# ifdef __REDIRECT
extern FILE *__REDIRECT (fopen, (__const char *__restrict __filename,
__const char *__restrict __modes), fopen64);
extern FILE *__REDIRECT (freopen, (__const char *__restrict __filename,
__const char *__restrict __modes,
FILE *__restrict __stream), freopen64);
# else
#  define fopen fopen64
#  define freopen freopen64
# endif
#endif
__END_NAMESPACE_STD
#ifdef __USE_LARGEFILE64
extern FILE *fopen64 (__const char *__restrict __filename,
__const char *__restrict __modes);
extern FILE *freopen64 (__const char *__restrict __filename,
__const char *__restrict __modes,
FILE *__restrict __stream);
#endif

#ifdef	__USE_POSIX

extern FILE *fdopen (int __fd, __const char *__modes) __THROW;
#endif

#ifdef	__USE_GNU

and uses the given functions for input and output.  
extern FILE *fopencookie (void *__restrict __magic_cookie,
__const char *__restrict __modes,
_IO_cookie_io_functions_t __io_funcs) __THROW;


extern FILE *fmemopen (void *__s, size_t __len, __const char *__modes) __THROW;


and the number of characters written on fflush or fclose.  
extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __THROW;
#endif


__BEGIN_NAMESPACE_STD

Else make it use buffer BUF, of size BUFSIZ.  
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __THROW;

else allocate an internal buffer N bytes long.  
extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
int __modes, size_t __n) __THROW;
__END_NAMESPACE_STD

#ifdef	__USE_BSD

Else make it use SIZE bytes of BUF for buffering.  
extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
size_t __size) __THROW;


extern void setlinebuf (FILE *__stream) __THROW;
#endif


__BEGIN_NAMESPACE_STD

marked with __THROW.  
extern int fprintf (FILE *__restrict __stream,
__const char *__restrict __format, ...);

marked with __THROW.  
extern int printf (__const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
__const char *__restrict __format, ...) __THROW;


marked with __THROW.  
extern int vfprintf (FILE *__restrict __s, __const char *__restrict __format,
_G_va_list __arg);

marked with __THROW.  
extern int vprintf (__const char *__restrict __format, _G_va_list __arg);

extern int vsprintf (char *__restrict __s, __const char *__restrict __format,
_G_va_list __arg) __THROW;
__END_NAMESPACE_STD

#if defined __USE_BSD || defined __USE_ISOC99 || defined __USE_UNIX98
__BEGIN_NAMESPACE_C99

extern int snprintf (char *__restrict __s, size_t __maxlen,
__const char *__restrict __format, ...)
__THROW __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
__const char *__restrict __format, _G_va_list __arg)
__THROW __attribute__ ((__format__ (__printf__, 3, 0)));
__END_NAMESPACE_C99
#endif

#ifdef __USE_GNU

Store the address of the string in *PTR.  
extern int vasprintf (char **__restrict __ptr, __const char *__restrict __f,
_G_va_list __arg)
__THROW __attribute__ ((__format__ (__printf__, 2, 0)));
extern int __asprintf (char **__restrict __ptr,
__const char *__restrict __fmt, ...)
__THROW __attribute__ ((__format__ (__printf__, 2, 3)));
extern int asprintf (char **__restrict __ptr,
__const char *__restrict __fmt, ...)
__THROW __attribute__ ((__format__ (__printf__, 2, 3)));


therefore not marked with __THROW.  
extern int vdprintf (int __fd, __const char *__restrict __fmt,
_G_va_list __arg)
__attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, __const char *__restrict __fmt, ...)
__attribute__ ((__format__ (__printf__, 2, 3)));
#endif


__BEGIN_NAMESPACE_STD

marked with __THROW.  
extern int fscanf (FILE *__restrict __stream,
__const char *__restrict __format, ...) __wur;

marked with __THROW.  
extern int scanf (__const char *__restrict __format, ...) __wur;

extern int sscanf (__const char *__restrict __s,
__const char *__restrict __format, ...) __THROW;
__END_NAMESPACE_STD

#ifdef	__USE_ISOC99
__BEGIN_NAMESPACE_C99

marked with __THROW.  
extern int vfscanf (FILE *__restrict __s, __const char *__restrict __format,
_G_va_list __arg)
__attribute__ ((__format__ (__scanf__, 2, 0))) __wur;


marked with __THROW.  
extern int vscanf (__const char *__restrict __format, _G_va_list __arg)
__attribute__ ((__format__ (__scanf__, 1, 0))) __wur;


extern int vsscanf (__const char *__restrict __s,
__const char *__restrict __format, _G_va_list __arg)
__THROW __attribute__ ((__format__ (__scanf__, 2, 0)));
__END_NAMESPACE_C99
#endif 


__BEGIN_NAMESPACE_STD

marked with __THROW.  
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);


marked with __THROW.  
extern int getchar (void);
__END_NAMESPACE_STD


optimization for it.  
#define getc(_fp) _IO_getc (_fp)

#if defined __USE_POSIX || defined __USE_MISC

marked with __THROW.  
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
#endif 

#ifdef __USE_MISC

therefore not marked with __THROW.  
extern int fgetc_unlocked (FILE *__stream);
#endif 


__BEGIN_NAMESPACE_STD

marked with __THROW.  
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);


marked with __THROW.  
extern int putchar (int __c);
__END_NAMESPACE_STD


so we always do the optimization for it.  
#define putc(_ch, _fp) _IO_putc (_ch, _fp)

#ifdef __USE_MISC

therefore not marked with __THROW.  
extern int fputc_unlocked (int __c, FILE *__stream);
#endif 

#if defined __USE_POSIX || defined __USE_MISC

marked with __THROW.  
extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);
#endif 


#if defined __USE_SVID || defined __USE_MISC \
|| (defined __USE_XOPEN && !defined __USE_XOPEN2K)

extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);
#endif


__BEGIN_NAMESPACE_STD

marked with __THROW.  
extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
__wur;


marked with __THROW.  
extern char *gets (char *__s) __wur;
__END_NAMESPACE_STD

#ifdef __USE_GNU

therefore not marked with __THROW.  
extern char *fgets_unlocked (char *__restrict __s, int __n,
FILE *__restrict __stream) __wur;
#endif


#ifdef	__USE_GNU

therefore not marked with __THROW.  
extern _IO_ssize_t __getdelim (char **__restrict __lineptr,
size_t *__restrict __n, int __delimiter,
FILE *__restrict __stream) __wur;
extern _IO_ssize_t getdelim (char **__restrict __lineptr,
size_t *__restrict __n, int __delimiter,
FILE *__restrict __stream) __wur;


therefore not marked with __THROW.  
extern _IO_ssize_t getline (char **__restrict __lineptr,
size_t *__restrict __n,
FILE *__restrict __stream) __wur;
#endif


__BEGIN_NAMESPACE_STD

marked with __THROW.  
extern int fputs (__const char *__restrict __s, FILE *__restrict __stream);


marked with __THROW.  
extern int puts (__const char *__s);



marked with __THROW.  
extern int ungetc (int __c, FILE *__stream);



marked with __THROW.  
extern size_t fread (void *__restrict __ptr, size_t __size,
size_t __n, FILE *__restrict __stream) __wur;

marked with __THROW.  
extern size_t fwrite (__const void *__restrict __ptr, size_t __size,
size_t __n, FILE *__restrict __s) __wur;
__END_NAMESPACE_STD

#ifdef __USE_GNU

therefore not marked with __THROW.  
extern int fputs_unlocked (__const char *__restrict __s,
FILE *__restrict __stream);
#endif

#ifdef __USE_MISC

therefore not marked with __THROW.  
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
size_t __n, FILE *__restrict __stream) __wur;
extern size_t fwrite_unlocked (__const void *__restrict __ptr, size_t __size,
size_t __n, FILE *__restrict __stream) __wur;
#endif


__BEGIN_NAMESPACE_STD

marked with __THROW.  
extern int fseek (FILE *__stream, long int __off, int __whence);

marked with __THROW.  
extern long int ftell (FILE *__stream) __wur;

marked with __THROW.  
extern void rewind (FILE *__stream);
__END_NAMESPACE_STD


are originally defined in the Large File Support API.  

#if defined __USE_LARGEFILE || defined __USE_XOPEN2K
# ifndef __USE_FILE_OFFSET64

marked with __THROW.  
extern int fseeko (FILE *__stream, __off_t __off, int __whence);

marked with __THROW.  
extern __off_t ftello (FILE *__stream) __wur;
# else
#  ifdef __REDIRECT
extern int __REDIRECT (fseeko,
(FILE *__stream, __off64_t __off, int __whence),
fseeko64);
extern __off64_t __REDIRECT (ftello, (FILE *__stream), ftello64);
#  else
#   define fseeko fseeko64
#   define ftello ftello64
#  endif
# endif
#endif

__BEGIN_NAMESPACE_STD
#ifndef __USE_FILE_OFFSET64

marked with __THROW.  
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);

marked with __THROW.  
extern int fsetpos (FILE *__stream, __const fpos_t *__pos);
#else
# ifdef __REDIRECT
extern int __REDIRECT (fgetpos, (FILE *__restrict __stream,
fpos_t *__restrict __pos), fgetpos64);
extern int __REDIRECT (fsetpos,
(FILE *__stream, __const fpos_t *__pos), fsetpos64);
# else
#  define fgetpos fgetpos64
#  define fsetpos fsetpos64
# endif
#endif
__END_NAMESPACE_STD

#ifdef __USE_LARGEFILE64
extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) __wur;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, __const fpos64_t *__pos);
#endif

__BEGIN_NAMESPACE_STD

extern void clearerr (FILE *__stream) __THROW;

extern int feof (FILE *__stream) __THROW __wur;

extern int ferror (FILE *__stream) __THROW __wur;
__END_NAMESPACE_STD

#ifdef __USE_MISC

extern void clearerr_unlocked (FILE *__stream) __THROW;
extern int feof_unlocked (FILE *__stream) __THROW __wur;
extern int ferror_unlocked (FILE *__stream) __THROW __wur;
#endif


__BEGIN_NAMESPACE_STD

marked with __THROW.  
extern void perror (__const char *__s);
__END_NAMESPACE_STD


all the necessary functionality.  
#include <bits/sys_errlist.h>


#ifdef	__USE_POSIX

extern int fileno (FILE *__stream) __THROW __wur;
#endif 

#ifdef __USE_MISC

extern int fileno_unlocked (FILE *__stream) __THROW __wur;
#endif


#if (defined __USE_POSIX2 || defined __USE_SVID  || defined __USE_BSD || \
defined __USE_MISC)

marked with __THROW.  
extern FILE *popen (__const char *__command, __const char *__modes) __wur;


marked with __THROW.  
extern int pclose (FILE *__stream);
#endif


#ifdef	__USE_POSIX

extern char *ctermid (char *__s) __THROW;
#endif 


#ifdef __USE_XOPEN

extern char *cuserid (char *__s);
#endif 


#ifdef	__USE_GNU
struct obstack;			


extern int obstack_printf (struct obstack *__restrict __obstack,
__const char *__restrict __format, ...)
__THROW __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
__const char *__restrict __format,
_G_va_list __args)
__THROW __attribute__ ((__format__ (__printf__, 2, 0)));
#endif 


#if defined __USE_POSIX || defined __USE_MISC



extern void flockfile (FILE *__stream) __THROW;


possible.  
extern int ftrylockfile (FILE *__stream) __THROW __wur;


extern void funlockfile (FILE *__stream) __THROW;
#endif 

#if defined __USE_XOPEN && !defined __USE_XOPEN2K && !defined __USE_GNU

follow.  In GNU mode we don't do this nonsense.  
# define __need_getopt
# include <getopt.h>
#endif	


several optimizing inline functions and macros.  
#ifdef __USE_EXTERN_INLINES
# include <bits/stdio.h>
#endif
#if __USE_FORTIFY_LEVEL > 0 && !defined __cplusplus
# include <bits/stdio2.h>
#endif
#ifdef __LDBL_COMPAT
# include <bits/stdio-ldbl.h>
#endif

__END_DECLS

#endif 

#endif 

02111-1307 USA.  




#ifndef	_STRING_H
#define	_STRING_H	1

#include <features.h>

__BEGIN_DECLS


#define	__need_size_t
#define	__need_NULL
#include <stddef.h>


__BEGIN_NAMESPACE_STD

extern void *memcpy (void *__restrict __dest,
__const void *__restrict __src, size_t __n)
__THROW __nonnull ((1, 2));

correct behavior for overlapping strings.  
extern void *memmove (void *__dest, __const void *__src, size_t __n)
__THROW __nonnull ((1, 2));
__END_NAMESPACE_STD


or NULL if C was not found in the first N bytes of SRC.  
#if defined __USE_SVID || defined __USE_BSD || defined __USE_XOPEN
extern void *memccpy (void *__restrict __dest, __const void *__restrict __src,
int __c, size_t __n)
__THROW __nonnull ((1, 2));
#endif 


__BEGIN_NAMESPACE_STD

extern void *memset (void *__s, int __c, size_t __n) __THROW __nonnull ((1));


extern int memcmp (__const void *__s1, __const void *__s2, size_t __n)
__THROW __attribute_pure__ __nonnull ((1, 2));


extern void *memchr (__const void *__s, int __c, size_t __n)
__THROW __attribute_pure__ __nonnull ((1));
__END_NAMESPACE_STD

#ifdef __USE_GNU

length limit.  
extern void *rawmemchr (__const void *__s, int __c)
__THROW __attribute_pure__ __nonnull ((1));


extern void *memrchr (__const void *__s, int __c, size_t __n)
__THROW __attribute_pure__ __nonnull ((1));
#endif


__BEGIN_NAMESPACE_STD

extern char *strcpy (char *__restrict __dest, __const char *__restrict __src)
__THROW __nonnull ((1, 2));

extern char *strncpy (char *__restrict __dest,
__const char *__restrict __src, size_t __n)
__THROW __nonnull ((1, 2));


extern char *strcat (char *__restrict __dest, __const char *__restrict __src)
__THROW __nonnull ((1, 2));

extern char *strncat (char *__restrict __dest, __const char *__restrict __src,
size_t __n) __THROW __nonnull ((1, 2));


extern int strcmp (__const char *__s1, __const char *__s2)
__THROW __attribute_pure__ __nonnull ((1, 2));

extern int strncmp (__const char *__s1, __const char *__s2, size_t __n)
__THROW __attribute_pure__ __nonnull ((1, 2));


extern int strcoll (__const char *__s1, __const char *__s2)
__THROW __attribute_pure__ __nonnull ((1, 2));

extern size_t strxfrm (char *__restrict __dest,
__const char *__restrict __src, size_t __n)
__THROW __nonnull ((2));
__END_NAMESPACE_STD

#ifdef __USE_GNU

This is not standardsized but something like will come.  
# include <xlocale.h>


extern int strcoll_l (__const char *__s1, __const char *__s2, __locale_t __l)
__THROW __attribute_pure__ __nonnull ((1, 2, 3));

extern size_t strxfrm_l (char *__dest, __const char *__src, size_t __n,
__locale_t __l) __THROW __nonnull ((2, 4));
#endif

#if defined __USE_SVID || defined __USE_BSD || defined __USE_XOPEN_EXTENDED

extern char *strdup (__const char *__s)
__THROW __attribute_malloc__ __nonnull ((1));
#endif


appears before STRING[N].  
#if defined __USE_GNU
extern char *strndup (__const char *__string, size_t __n)
__THROW __attribute_malloc__ __nonnull ((1));
#endif

#if defined __USE_GNU && defined __GNUC__

# define strdupa(s)							      \
(__extension__							      \
({									      \
__const char *__old = (s);					      \
size_t __len = strlen (__old) + 1;				      \
char *__new = (char *) __builtin_alloca (__len);			      \
(char *) memcpy (__new, __old, __len);				      \
}))


# define strndupa(s, n)							      \
(__extension__							      \
({									      \
__const char *__old = (s);					      \
size_t __len = strnlen (__old, (n));				      \
char *__new = (char *) __builtin_alloca (__len + 1);		      \
__new[__len] = '\0';						      \
(char *) memcpy (__new, __old, __len);				      \
}))
#endif

__BEGIN_NAMESPACE_STD

extern char *strchr (__const char *__s, int __c)
__THROW __attribute_pure__ __nonnull ((1));

extern char *strrchr (__const char *__s, int __c)
__THROW __attribute_pure__ __nonnull ((1));
__END_NAMESPACE_STD

#ifdef __USE_GNU

the closing NUL byte in case C is not found in S.  
extern char *strchrnul (__const char *__s, int __c)
__THROW __attribute_pure__ __nonnull ((1));
#endif

__BEGIN_NAMESPACE_STD

consists entirely of characters not in REJECT.  
extern size_t strcspn (__const char *__s, __const char *__reject)
__THROW __attribute_pure__ __nonnull ((1, 2));

consists entirely of characters in ACCEPT.  
extern size_t strspn (__const char *__s, __const char *__accept)
__THROW __attribute_pure__ __nonnull ((1, 2));

extern char *strpbrk (__const char *__s, __const char *__accept)
__THROW __attribute_pure__ __nonnull ((1, 2));

extern char *strstr (__const char *__haystack, __const char *__needle)
__THROW __attribute_pure__ __nonnull ((1, 2));



extern char *strtok (char *__restrict __s, __const char *__restrict __delim)
__THROW __nonnull ((2));
__END_NAMESPACE_STD


passed between calls are stored in SAVE_PTR.  
extern char *__strtok_r (char *__restrict __s,
__const char *__restrict __delim,
char **__restrict __save_ptr)
__THROW __nonnull ((2, 3));
#if defined __USE_POSIX || defined __USE_MISC
extern char *strtok_r (char *__restrict __s, __const char *__restrict __delim,
char **__restrict __save_ptr)
__THROW __nonnull ((2, 3));
#endif

#ifdef __USE_GNU

extern char *strcasestr (__const char *__haystack, __const char *__needle)
__THROW __attribute_pure__ __nonnull ((1, 2));
#endif

#ifdef __USE_GNU

HAYSTACK is HAYSTACKLEN bytes long.  
extern void *memmem (__const void *__haystack, size_t __haystacklen,
__const void *__needle, size_t __needlelen)
__THROW __attribute_pure__ __nonnull ((1, 3));


last written byte.  
extern void *__mempcpy (void *__restrict __dest,
__const void *__restrict __src, size_t __n)
__THROW __nonnull ((1, 2));
extern void *mempcpy (void *__restrict __dest,
__const void *__restrict __src, size_t __n)
__THROW __nonnull ((1, 2));
#endif


__BEGIN_NAMESPACE_STD

extern size_t strlen (__const char *__s)
__THROW __attribute_pure__ __nonnull ((1));
__END_NAMESPACE_STD

#ifdef	__USE_GNU

If no '\0' terminator is found in that many characters, return MAXLEN.  
extern size_t strnlen (__const char *__string, size_t __maxlen)
__THROW __attribute_pure__ __nonnull ((1));
#endif


__BEGIN_NAMESPACE_STD

extern char *strerror (int __errnum) __THROW;
__END_NAMESPACE_STD
#if defined __USE_XOPEN2K || defined __USE_MISC

preferred.  
# if defined __USE_XOPEN2K && !defined __USE_GNU

ERRNUM.  
#  ifdef __REDIRECT_NTH
extern int __REDIRECT_NTH (strerror_r,
(int __errnum, char *__buf, size_t __buflen),
__xpg_strerror_r) __nonnull ((2));
#  else
extern int __xpg_strerror_r (int __errnum, char *__buf, size_t __buflen)
__THROW __nonnull ((2));
#   define strerror_r __xpg_strerror_r
#  endif
# else

used.  
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
__THROW __nonnull ((2));
# endif
#endif


the namespace rules does not allow this.  
extern void __bzero (void *__s, size_t __n) __THROW __nonnull ((1));

#ifdef __USE_BSD

extern void bcopy (__const void *__src, void *__dest, size_t __n)
__THROW __nonnull ((1, 2));


extern void bzero (void *__s, size_t __n) __THROW __nonnull ((1));


extern int bcmp (__const void *__s1, __const void *__s2, size_t __n)
__THROW __attribute_pure__ __nonnull ((1, 2));


extern char *index (__const char *__s, int __c)
__THROW __attribute_pure__ __nonnull ((1));


extern char *rindex (__const char *__s, int __c)
__THROW __attribute_pure__ __nonnull ((1));


The least-significant bit is position 1, the most-significant 32.  
extern int ffs (int __i) __THROW __attribute__ ((__const__));


platforms.  
# ifdef	__USE_GNU
extern int ffsl (long int __l) __THROW __attribute__ ((__const__));
#  ifdef __GNUC__
__extension__ extern int ffsll (long long int __ll)
__THROW __attribute__ ((__const__));
#  endif
# endif


extern int strcasecmp (__const char *__s1, __const char *__s2)
__THROW __attribute_pure__ __nonnull ((1, 2));


extern int strncasecmp (__const char *__s1, __const char *__s2, size_t __n)
__THROW __attribute_pure__ __nonnull ((1, 2));
#endif 

#ifdef	__USE_GNU

of the global one.  
extern int strcasecmp_l (__const char *__s1, __const char *__s2,
__locale_t __loc)
__THROW __attribute_pure__ __nonnull ((1, 2, 3));

extern int strncasecmp_l (__const char *__s1, __const char *__s2,
size_t __n, __locale_t __loc)
__THROW __attribute_pure__ __nonnull ((1, 2, 4));
#endif

#ifdef	__USE_BSD

terminating it with a '\0', and update *STRINGP to point past it.  
extern char *strsep (char **__restrict __stringp,
__const char *__restrict __delim)
__THROW __nonnull ((1, 2));
#endif

#ifdef	__USE_GNU

extern int strverscmp (__const char *__s1, __const char *__s2)
__THROW __attribute_pure__ __nonnull ((1, 2));


extern char *strsignal (int __sig) __THROW;


extern char *__stpcpy (char *__restrict __dest, __const char *__restrict __src)
__THROW __nonnull ((1, 2));
extern char *stpcpy (char *__restrict __dest, __const char *__restrict __src)
__THROW __nonnull ((1, 2));


the last character written into DEST.  
extern char *__stpncpy (char *__restrict __dest,
__const char *__restrict __src, size_t __n)
__THROW __nonnull ((1, 2));
extern char *stpncpy (char *__restrict __dest,
__const char *__restrict __src, size_t __n)
__THROW __nonnull ((1, 2));


extern char *strfry (char *__string) __THROW __nonnull ((1));


extern void *memfrob (void *__s, size_t __n) __THROW __nonnull ((1));

# ifndef basename

available.  
extern char *basename (__const char *__filename) __THROW __nonnull ((1));
# endif
#endif


#if defined __GNUC__ && __GNUC__ >= 2
# if defined __OPTIMIZE__ && !defined __OPTIMIZE_SIZE__ \
&& !defined __NO_INLINE__ && !defined __cplusplus

One can inhibit all optimizations by defining __NO_STRING_INLINES.  


#  include <bits/string.h>


#  include <bits/string2.h>
# endif

# if __USE_FORTIFY_LEVEL > 0 && !defined __cplusplus

#  include <bits/string3.h>
# endif
#endif

__END_DECLS

#endif 


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


for(i=0;i<10;i++)
{

a[i]=rand()%100;
printf("%d, ",a[i]);
}

reverse(a,10);
printf("Reve//rsed:");
for(i=0;i<10;i++)
printf("%d, ",a[i]);
}
