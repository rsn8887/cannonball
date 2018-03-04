# Vita CMake Setup.

include("${VITASDK}/share/vita.cmake" REQUIRED)

set(TITLEID "CANNONBAL")

set(lib_base $ENV{VITASDK}/arm-vita-eabi/lib)
set(sdl_root $ENV{VITASDK}/arm-vita-eabi/include/SDL2)

include_directories(
	"${sdl_root}"
)

link_libraries(
    SDL2
	Vita2d
#	VitaGL
	SceSysmodule_stub
	SceDisplay_stub
	SceGxm_stub
	SceCtrl_stub
	ScePgf_stub
	ScePower_stub
	SceCommonDialog_stub
	SceAudio_stub
	SceShellSvc_stub
	SceHid_stub
	SceTouch_stub
	png
	jpeg
	z
	m
	c
)

# Linking
link_directories(
    "${lib_base}"
)

add_definitions(-O3 -DSDL2)

# Location for Cannonball to create save files
# Used to auto-generate setup.hpp with various file paths
set(xml_directory ux0:/data/cannonball/)
#set(sdl_flags "SDL_DOUBLEBUF | SDL_HWSURFACE")
set(sdl_flags "0")

# Set SDL2 instead of SDL1
set(SDL2 1)
set(VITA 1)
#set(OPENGL 1)

set(FLAGS
        -marm -mfpu=neon -mcpu=cortex-a9 -march=armv7-a -mfloat-abi=hard -ffast-math
        -fno-asynchronous-unwind-tables -funroll-loops
        -mword-relocations -fno-unwind-tables -fno-optimize-sibling-calls
        -mvectorize-with-neon-quad -funsafe-math-optimizations
        -mlittle-endian -munaligned-access
        )
