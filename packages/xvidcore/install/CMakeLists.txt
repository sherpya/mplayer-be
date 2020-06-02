project(xvidcore)
cmake_minimum_required(VERSION 3.6)
enable_language(ASM_NASM)

find_program (YASM_EXECUTABLE yasm)

if(NOT YASM_EXECUTABLE)
    message(FATAL_ERROR "yasm executable not found!")
endif()

set(CMAKE_ASM_NASM_COMPILER ${YASM_EXECUTABLE})

set(xvidcore_generic_sources
    src/decoder.c
    src/encoder.c
    src/xvid.c
    src/bitstream/bitstream.c
    src/bitstream/cbp.c
    src/bitstream/mbcoding.c
    src/dct/fdct.c
    src/dct/idct.c
    src/dct/simple_idct.c
    src/image/colorspace.c
    src/image/image.c
    src/image/interpolate8x8.c
    src/image/font.c
    src/image/postprocessing.c
    src/image/qpel.c
    src/image/reduced.c
    src/motion/estimation_bvop.c
    src/motion/estimation_common.c
    src/motion/estimation_gmc.c
    src/motion/estimation_pvop.c
    src/motion/estimation_rd_based.c
    src/motion/estimation_rd_based_bvop.c
    src/motion/gmc.c
    src/motion/motion_comp.c
    src/motion/vop_type_decision.c
    src/motion/sad.c
    src/prediction/mbprediction.c
    src/plugins/plugin_single.c
    src/plugins/plugin_2pass1.c
    src/plugins/plugin_2pass2.c
    src/plugins/plugin_lumimasking.c
    src/plugins/plugin_dump.c
    src/plugins/plugin_psnr.c
    src/plugins/plugin_ssim.c
    src/plugins/plugin_psnrhvsm.c
    src/quant/quant_h263.c
    src/quant/quant_matrix.c
    src/quant/quant_mpeg.c
    src/utils/emms.c
    src/utils/mbtransquant.c
    src/utils/mem_align.c
    src/utils/mem_transfer.c
    src/utils/timer.c
)

set(xvidcore_ia32_sources
    src/bitstream/x86_asm/cbp_mmx.asm
    src/bitstream/x86_asm/cbp_sse2.asm
    src/dct/x86_asm/fdct_mmx_ffmpeg.asm
    src/dct/x86_asm/fdct_mmx_skal.asm
    src/dct/x86_asm/fdct_sse2_skal.asm
    src/dct/x86_asm/idct_3dne.asm
    src/dct/x86_asm/idct_mmx.asm
    src/dct/x86_asm/idct_sse2_dmitry.asm
    src/image/x86_asm/colorspace_rgb_mmx.asm
    src/image/x86_asm/colorspace_yuv_mmx.asm
    src/image/x86_asm/colorspace_yuyv_mmx.asm
    src/image/x86_asm/interpolate8x8_3dn.asm
    src/image/x86_asm/interpolate8x8_3dne.asm
    src/image/x86_asm/interpolate8x8_mmx.asm
    src/image/x86_asm/interpolate8x8_xmm.asm
    src/image/x86_asm/postprocessing_mmx.asm
    src/image/x86_asm/postprocessing_sse2.asm
    src/image/x86_asm/reduced_mmx.asm
    src/image/x86_asm/qpel_mmx.asm
    src/image/x86_asm/gmc_mmx.asm
    src/image/x86_asm/deintl_sse.asm
    src/motion/x86_asm/sad_xmm.asm
    src/motion/x86_asm/sad_sse2.asm
    src/motion/x86_asm/sad_mmx.asm
    src/motion/x86_asm/sad_3dne.asm
    src/motion/x86_asm/sad_3dn.asm
    src/quant/x86_asm/quantize_h263_mmx.asm
    src/quant/x86_asm/quantize_h263_3dne.asm
    src/quant/x86_asm/quantize_mpeg_xmm.asm
    src/quant/x86_asm/quantize_mpeg_mmx.asm
    src/utils/x86_asm/mem_transfer_mmx.asm
    src/utils/x86_asm/mem_transfer_3dne.asm
    src/utils/x86_asm/interlacing_mmx.asm
    src/utils/x86_asm/cpuid.asm
    src/plugins/x86_asm/plugin_ssim-a.asm
)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    add_definitions(-DARCH_IS_X86_64 -DARCH_IS_64BIT)
    set(CMAKE_ASM_NASM_FLAGS "${CMAKE_ASM_NASM_FLAGS} -DWINDOWS -DNO_PREFIX  -DARCH_IS_X86_64")
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    add_definitions(-DARCH_IS_IA32 -DARCH_IS_32BIT)
    set(CMAKE_ASM_NASM_FLAGS "${CMAKE_ASM_NASM_FLAGS} -DWINDOWS")
endif()

add_definitions(-DARCH_IS_LITTLE_ENDIAN -D_FILE_OFFSET_BITS=64)

include_directories(${CMAKE_SOURCE_DIR}/src ${CMAKE_SOURCE_DIR}/src/bitstream/x86_asm)

set(EXPORTED_HEADERS src/xvid.h)
add_library(xvidcore STATIC ${xvidcore_generic_sources} ${xvidcore_ia32_sources})

install(TARGETS xvidcore ARCHIVE DESTINATION lib${LIB_SUFFIX})
install(FILES ${EXPORTED_HEADERS} DESTINATION include)
