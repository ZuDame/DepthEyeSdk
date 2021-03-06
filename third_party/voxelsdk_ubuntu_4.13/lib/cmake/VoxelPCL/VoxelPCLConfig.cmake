# - Config file for the FooBar package
# It defines the following variables
#  VOXEL_PCL_INCLUDE_DIRS - include directories for FooBar
#  VOXEL_PCL_LIBRARIES    - libraries to link against

find_package(Voxel "0.6.7" REQUIRED)
find_package(PCL "1.6" REQUIRED COMPONENTS common io visualization)
find_package(Qt5Widgets REQUIRED)
 
# Compute paths
get_filename_component(VOXEL_PCL_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)

set(VOXEL_PCL_INCLUDE_DIRS "${VOXELPCL_CMAKE_DIR}/../../../include/voxel-0.6.7" ${VOXEL_INCLUDE_DIRS} ${PCL_INCLUDE_DIRS})
 
# Our library dependencies (contains definitions for IMPORTED targets)
if(NOT TARGET Voxel::voxelpcl AND NOT Voxel_BINARY_DIR)
  include("${VOXEL_PCL_CMAKE_DIR}/VoxelPCLTargets.cmake")
endif()
 
# These are IMPORTED targets created by FooBarTargets.cmake
set(VOXEL_PCL_LIBRARIES Voxel::voxelpcl ${VOXEL_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_VISUALIZATION_LIBRARIES})
