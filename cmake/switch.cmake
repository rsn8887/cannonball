# Switch CMake Setup.

set(sdl_root $ENV{DEVKITPRO}/portlibs/switch/include/SDL2)

include_directories(
  "${sdl_root}"
)

link_libraries(
    SDL2
    EGL
    GLESv2
    glapi
    drm_nouveau
    nx
    png
    jpeg
    z
    m
    c
)

add_definitions(-O3 -DSDL2 -D__SWITCH__)

# Location for Cannonball to create save files
# Used to auto-generate setup.hpp with various file paths
set(xml_directory ./)
set(sdl_flags "0")

# Set SDL2 instead of SDL1
set(SDL2 1)
