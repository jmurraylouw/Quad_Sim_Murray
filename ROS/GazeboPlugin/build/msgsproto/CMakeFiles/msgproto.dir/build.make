# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/esl/cmake-install/bin/cmake

# The command to remove a file.
RM = /home/esl/cmake-install/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build

# Include any dependencies generated for this target.
include msgsproto/CMakeFiles/msgproto.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include msgsproto/CMakeFiles/msgproto.dir/compiler_depend.make

# Include the progress variables for this target.
include msgsproto/CMakeFiles/msgproto.dir/progress.make

# Include the compile flags for this target's objects.
include msgsproto/CMakeFiles/msgproto.dir/flags.make

msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.o: msgsproto/CMakeFiles/msgproto.dir/flags.make
msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.o: ../msgsproto/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc
msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.o: msgsproto/CMakeFiles/msgproto.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.o"
	cd /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build/msgsproto && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.o -MF CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.o.d -o CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.o -c /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/msgsproto/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc

msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.i"
	cd /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build/msgsproto && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/msgsproto/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc > CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.i

msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.s"
	cd /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build/msgsproto && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/msgsproto/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc -o CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.s

msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.o: msgsproto/CMakeFiles/msgproto.dir/flags.make
msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.o: ../msgsproto/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc
msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.o: msgsproto/CMakeFiles/msgproto.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.o"
	cd /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build/msgsproto && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.o -MF CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.o.d -o CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.o -c /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/msgsproto/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc

msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.i"
	cd /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build/msgsproto && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/msgsproto/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc > CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.i

msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.s"
	cd /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build/msgsproto && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/msgsproto/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc -o CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.s

# Object files for target msgproto
msgproto_OBJECTS = \
"CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.o" \
"CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.o"

# External object files for target msgproto
msgproto_EXTERNAL_OBJECTS =

../export/lib/libmsgproto.so: msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.CoSimMsgs.pb.cc.o
../export/lib/libmsgproto.so: msgsproto/CMakeFiles/msgproto.dir/mw.internal.robotics.gazebotransport.TestMsgs.pb.cc.o
../export/lib/libmsgproto.so: msgsproto/CMakeFiles/msgproto.dir/build.make
../export/lib/libmsgproto.so: msgsproto/CMakeFiles/msgproto.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library ../../export/lib/libmsgproto.so"
	cd /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build/msgsproto && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/msgproto.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
msgsproto/CMakeFiles/msgproto.dir/build: ../export/lib/libmsgproto.so
.PHONY : msgsproto/CMakeFiles/msgproto.dir/build

msgsproto/CMakeFiles/msgproto.dir/clean:
	cd /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build/msgsproto && $(CMAKE_COMMAND) -P CMakeFiles/msgproto.dir/cmake_clean.cmake
.PHONY : msgsproto/CMakeFiles/msgproto.dir/clean

msgsproto/CMakeFiles/msgproto.dir/depend:
	cd /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/msgsproto /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build/msgsproto /home/esl/Masters/Developer/MATLAB/Quad_Sim_Murray/ROS/GazeboPlugin/build/msgsproto/CMakeFiles/msgproto.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : msgsproto/CMakeFiles/msgproto.dir/depend

