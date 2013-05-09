#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <buffer.h>

SV *_escape_html(SV *input){
    gh_buf buffer = GH_BUF_INIT; 
    SV *result;
    STRLEN slen;
    char *unescaped;

    if( !SvPOK(input) && !SvNOK(input) && !SvIOK(input) ) {
        croak("escape_html argument not a string");
    }

    unescaped = SvPV(input, slen);

    if( !houdini_escape_html( &buffer, unescaped, slen ) ) {
        return newSVsv(input);
    }

    result = newSVpvn( buffer.ptr, buffer.size );
    gh_buf_free(&buffer);
    return result;
}

SV *_unescape_html(SV *input){
    gh_buf buffer = GH_BUF_INIT; 
    SV *result;
    STRLEN slen;
    char *escaped;

    if( !SvPOK(input) && !SvNOK(input) && !SvIOK(input) ) {
        croak("unescape_html argument not a string");
    }

    escaped = SvPV(input, slen);

    if( !houdini_unescape_html( &buffer, escaped, slen ) ) {
        return newSVsv(input);
    }

    result = newSVpvn( buffer.ptr, buffer.size );
    gh_buf_free(&buffer);
    return result;
}

SV *_escape_xml(SV *input){
    gh_buf buffer = GH_BUF_INIT; 
    SV *result;
    STRLEN slen;
    char *src_string;

    if( !SvPOK(input) && !SvNOK(input) && !SvIOK(input) ) {
        croak("escape_xml argument not a string");
    }

    src_string = SvPV(input, slen);

    if( !houdini_escape_xml( &buffer, src_string, slen ) ) {
        return newSVsv(input);
    }

    result = newSVpvn( buffer.ptr, buffer.size );
    gh_buf_free(&buffer);
    return result;
}

SV *_escape_url(SV *input){
    gh_buf buffer = GH_BUF_INIT; 
    SV *result;
    STRLEN slen;
    char *src_string;

    if( !SvPOK(input) && !SvNOK(input) && !SvIOK(input) ) {
        croak("escape_url argument not a string");
    }

    src_string = SvPV(input, slen);

    if( !houdini_escape_url( &buffer, src_string, slen ) ) {
        return newSVsv(input);
    }

    result = newSVpvn( buffer.ptr, buffer.size );
    gh_buf_free(&buffer);
    return result;
}

SV *_escape_uri(SV *input){
    gh_buf buffer = GH_BUF_INIT; 
    SV *result;
    STRLEN slen;
    char *src_string;

    if( !SvPOK(input) && !SvNOK(input) && !SvIOK(input) ) {
        croak("escape_uri argument not a string");
    }

    src_string = SvPV(input, slen);

    if( !houdini_escape_uri( &buffer, src_string, slen ) ) {
        return newSVsv(input);
    }

    result = newSVpvn( buffer.ptr, buffer.size );
    gh_buf_free(&buffer);
    return result;
}

SV *_escape_href(SV *input){
    gh_buf buffer = GH_BUF_INIT; 
    SV *result;
    STRLEN slen;
    char *src_string;

    if( !SvPOK(input) && !SvNOK(input) && !SvIOK(input) ) {
        croak("escape_href argument not a string");
    }

    src_string = SvPV(input, slen);

    if( !houdini_escape_href( &buffer, src_string, slen ) ) {
        return newSVsv(input);
    }

    result = newSVpvn( buffer.ptr, buffer.size );
    gh_buf_free(&buffer);
    return result;
}


SV *_unescape_url(SV *input){
    gh_buf buffer = GH_BUF_INIT; 
    SV *result;
    STRLEN slen;
    char *src_string;

    if( !SvPOK(input) && !SvNOK(input) && !SvIOK(input) ) {
        croak("unescape_url argument not a string");
    }

    src_string = SvPV(input, slen);

    if( !houdini_unescape_url( &buffer, src_string, slen ) ) {
        return newSVsv(input);
    }

    result = newSVpvn( buffer.ptr, buffer.size );
    gh_buf_free(&buffer);
    return result;
}

SV *_unescape_uri(SV *input){
    gh_buf buffer = GH_BUF_INIT; 
    SV *result;
    STRLEN slen;
    char *src_string;

    if( !SvPOK(input) && !SvNOK(input) && !SvIOK(input) ) {
        croak("unescape_uri argument not a string");
    }

    src_string = SvPV(input, slen);

    if( !houdini_unescape_uri( &buffer, src_string, slen ) ) {
        return newSVsv(input);
    }

    result = newSVpvn( buffer.ptr, buffer.size );
    gh_buf_free(&buffer);
    return result;
}

SV *_escape_js(SV *input){
    gh_buf buffer = GH_BUF_INIT; 
    SV *result;
    STRLEN slen;
    char *src_string;

    if( !SvPOK(input) && !SvNOK(input) && !SvIOK(input) ) {
        croak("escape_js argument not a string");
    }

    src_string = SvPV(input, slen);

    if( !houdini_escape_js( &buffer, src_string, slen ) ) {
        return newSVsv(input);
    }

    result = newSVpvn( buffer.ptr, buffer.size );
    gh_buf_free(&buffer);
    return result;
}


SV *_unescape_js(SV *input){
    gh_buf buffer = GH_BUF_INIT; 
    SV *result;
    STRLEN slen;
    char *src_string;

    if( !SvPOK(input) && !SvNOK(input) && !SvIOK(input) ) {
        croak("escape_js argument not a string");
    }

    src_string = SvPV(input, slen);

    if( !houdini_unescape_js( &buffer, src_string, slen ) ) {
        return newSVsv(input);
    }

    result = newSVpvn( buffer.ptr, buffer.size );
    gh_buf_free(&buffer);
    return result;
}

MODULE = Escape::Houdini   PACKAGE = Escape::Houdini

SV *
escape_xml(str)
    SV *str;
CODE:
    RETVAL = _escape_xml(str);
OUTPUT:
    RETVAL

SV *
escape_html(str)
    SV *str;
CODE:
    RETVAL = _escape_html(str);
OUTPUT:
    RETVAL

SV *
unescape_html(str)
    SV *str;
CODE:
    RETVAL = _unescape_html(str);
OUTPUT:
    RETVAL

SV *
escape_uri(str)
    SV *str;
CODE:
    RETVAL = _escape_uri(str);
OUTPUT:
    RETVAL

SV *
escape_url(str)
    SV *str;
CODE:
    RETVAL = _escape_url(str);
OUTPUT:
    RETVAL

SV *
escape_href(str)
    SV *str;
CODE:
    RETVAL = _escape_href(str);
OUTPUT:
    RETVAL

SV *
unescape_uri(str)
    SV *str;
CODE:
    RETVAL = _unescape_uri(str);
OUTPUT:
    RETVAL

SV *
unescape_url(str)
    SV *str;
CODE:
    RETVAL = _unescape_url(str);
OUTPUT:
    RETVAL

SV *
escape_js(str)
    SV *str;
CODE:
    RETVAL = _escape_js(str);
OUTPUT:
    RETVAL

SV *
unescape_js(str)
    SV *str;
CODE:
    RETVAL = _unescape_js(str);
OUTPUT:
    RETVAL
