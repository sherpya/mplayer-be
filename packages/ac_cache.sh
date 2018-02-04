# vim: set ft=sh:

# compiler and flags
export ac_cv_builtin_expect=yes
export ac_cv_always_inline=yes

export ac_cv_c_compiler_gnu=yes
export ac_cv_cxx_compiler_gnu=yes
export ac_cv_cpp_func=yes
export ac_cv_f77_compiler_gnu=no

export ac_cv_c_const=yes
export ac_cv_c_volatile=yes
export ac_cv_c_inline=inline
export ac_cv_c_restrict=__restrict

export cc_cv_flag_visibility=yes
export cc_cv_cflags__fvisibility_hidden=yes
export cc_cv_attribute_visibility_default=yes
export cc_cv_cflags__Wall=yes
export cc_cv_cflags__Werror=yes
export cc_cv_cflags__Wsign_compare=yes
export cc_cv_werror=-Werror

export ac_cv_sys_file_offset_bits=64
export ac_cv_sys_largefile_CC=no
export ac_cv_sys_large_files=no
export ac_cv_sys_largefile_source=no

export lt_cv_prog_gnu_ldcxx=yes
export lt_cv_prog_gnu_ld=yes

# uncomment to disable alloca
#export ac_cv_func_alloca=no
#export ac_cv_func_alloca_works=no
#export ac_cv_working_alloca_h=no
#export ac_cv_header_alloca_h=no

# misdetected while crosscompiling
export ac_cv_func_memcmp=yes
export ac_cv_func_memcmp_working=yes
export ac_cv_func_strtod=yes
export ac_cv_have_decl_strtod=yes
export ac_cv_header_fcntl_h=yes
export ac_cv_func_fcntl=no
export gl_cv_have_raw_decl_fcntl=no
export gl_cv_header_working_fcntl_h=no
export ac_cv_func_realpath=no
export gl_cv_func_realpath_works=no
export gl_cv_have_raw_decl_realpath=no
export double_slash_root=no
export func_strerror_0_works=yes
export gl_cv_func_strerror_0_works=yes
export ac_cv_func_malloc_0_nonnull=yes
export gl_cv_func_malloc_0_nonnull=1
export ac_cv_func_realloc=yes
export ac_cv_func_realloc_0_nonnull=yes
export gl_cv_func_stat_dir_slash=yes
export gl_cv_func_stat_file_slash=no
export ac_cv_func_stat_empty_string_bug=no

# iconv
export am_cv_func_iconv=yes
export am_cv_func_iconv_works=yes
export am_cv_lib_iconv=yes
export am_cv_proto_iconv_arg1=const
export am_cv_proto_iconv='extern size_t iconv (iconv_t cd, const char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);'

# checked by gavl
# 32bit Linux / 32-64 Bit Windows 1/0
# 64bit Linux 0/0
export ac_cv_c_clip_negative=1
export ac_cv_c_clip_positive=0
export ac_cv_c_clip_type=negative

# types
export ac_cv_c_bigendian=no
export ac_cv_c_int16_t=yes
export ac_cv_c_int32_t=yes
export ac_cv_c_int64_t=yes
export ac_cv_c_int8_t=yes
export ac_cv_c_uint16_t=yes
export ac_cv_c_uint32_t=yes
export ac_cv_c_uint64_t=yes
export ac_cv_c_uint8_t=yes
export ac_cv_alignof_double=8
export ac_cv_c_long_double=yes
export ac_cv_sizeof_double=8
export ac_cv_sizeof_float=4
export ac_cv_sizeof_fpos_t=8
export ac_cv_sizeof___int16=2
export ac_cv_sizeof_int16_t=2
export ac_cv_sizeof___int32=4
export ac_cv_sizeof_int32_t=4
export ac_cv_sizeof___int64=8
export ac_cv_sizeof_int64_t=8
export ac_cv_sizeof_int=4
export ac_cv_sizeof_intmax_t=8
export ac_cv_sizeof_long=4
export ac_cv_sizeof_long_long=8
export ac_cv_sizeof_mode_t=2
export ac_cv_sizeof_off_t=8
export ac_cv_sizeof_short=2
export ac_cv_sizeof_u_int16_t=2
export ac_cv_sizeof_uint16_t=2
export ac_cv_sizeof_u_int32_t=4
export ac_cv_sizeof_uint32_t=4
export ac_cv_sizeof_uintmax_t=8
export ac_cv_sizeof_unsigned_int=4
export ac_cv_sizeof_unsigned_long=4
export ac_cv_sizeof_unsigned_long_long=8
export ac_cv_sizeof_unsigned_short=2
export ac_cv_sizeof_wchar_t=2
export ac_cv_type__Bool=yes
export ac_cv_type_ieee754_float32_t=no
export ac_cv_type_ieee754_float64_t=no
export ac_cv_type_ieee854_float80_t=no
export ac_cv_type_int16_t=yes
export ac_cv_type_int32_t=yes
export ac_cv_type_int64_t=yes
export ac_cv_type_int8_t=yes
export ac_cv_type_int=yes
export ac_cv_type_long=yes
export ac_cv_type_long_double_wider=yes
export ac_cv_type_long_long=yes
export ac_cv_type_long_long_int=yes

# programs
export ac_cv_path_DOXYGEN=no
export ac_cv_path_GTK_CONFIG=no
export ac_cv_prog_GTKDOC=false
export ac_cv_prog_HASDOCBOOK=no
export ac_cv_prog_HAVE_DOXYGEN=false
export ac_cv_prog_HAVE_PKG_CONFIG=yes
export ac_cv_prog_have_xmlto=no
export ac_cv_prog_make_make_set=yes
export ac_cv_prog_NASM=nasm
export ac_cv_prog_ac_yasm=yes
export ac_cv_prog_YASM_CHECK=yes

# windows xp compatibility
export ac_cv_func_vsnprintf_s=no
