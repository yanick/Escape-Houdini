#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <buffer.h>

SV *_escape_html(SV *sstr){
    gh_buf buffer = GH_BUF_INIT; 
    SV *str, *result;
    STRLEN slen, dlen;
    U8 *src, *dst;
    char *stuff;
    int i;

    if( !SvPOK(sstr) && !SvNOK(sstr) && !SvIOK(sstr) ) {
        croak("html_escape argument not a string");
    }

    str    = newSVsv(sstr); /* make a copy to make func($1) work */
/*    SvPOK_on(str); */

/*    houdini_escape_html( buffer,SvPV_nolen(str), SvCUR(str) ); */
    stuff = SvPV(sstr, slen);

    if( !houdini_escape_html( &buffer, stuff, slen ) ) {
        return newSVsv(sstr);
    }

    result = newSVpvn( buffer.ptr, buffer.size );
    return result;

    if (sstr == &PL_sv_undef) return newSV(0);
    str    = sv_2mortal(newSVsv(sstr)); /* make a copy to make func($1) work */
    slen   = SvPOK(str) ? SvCUR(str) : 0;
    dlen   = 0;
    result = newSV(slen * 3 + 1); /* at most 3 times */ /* Y? */
 
    SvPOK_on(result);
    src   = (U8 *)SvPV_nolen(str);
    dst   = (U8 *)SvPV_nolen(result);

    houdini_escape_html( buffer, src, slen );

    /*dst = gh_buf_cstr(buffer);*/
 
/*    SvCUR_set(result, gh_buf_len(buffer)); */
    return result;
}

MODULE = Escape::Houdini   PACKAGE = Escape::Houdini

# import/export

SV *
escape_html(str)
    SV *str;
CODE:
    RETVAL = _escape_html(str);
OUTPUT:
    RETVAL
