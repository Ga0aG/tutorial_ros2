# CMake generated Testfile for 
# Source directory: /home/bot/tutorial/tutorial_ws/src/tutorial_hello_world
# Build directory: /home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(copyright "/usr/bin/python3" "-u" "/home/bot/ros2_foxy/install/ament_cmake_test/share/ament_cmake_test/cmake/run_test.py" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/test_results/tutorial_hello_world/copyright.xunit.xml" "--package-name" "tutorial_hello_world" "--output-file" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/ament_copyright/copyright.txt" "--command" "/home/bot/ros2_foxy/install/ament_copyright/bin/ament_copyright" "--xunit-file" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/test_results/tutorial_hello_world/copyright.xunit.xml")
set_tests_properties(copyright PROPERTIES  LABELS "copyright;linter" TIMEOUT "60" WORKING_DIRECTORY "/home/bot/tutorial/tutorial_ws/src/tutorial_hello_world")
add_test(cppcheck "/usr/bin/python3" "-u" "/home/bot/ros2_foxy/install/ament_cmake_test/share/ament_cmake_test/cmake/run_test.py" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/test_results/tutorial_hello_world/cppcheck.xunit.xml" "--package-name" "tutorial_hello_world" "--output-file" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/ament_cppcheck/cppcheck.txt" "--command" "/home/bot/ros2_foxy/install/ament_cppcheck/bin/ament_cppcheck" "--xunit-file" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/test_results/tutorial_hello_world/cppcheck.xunit.xml" "--include_dirs" "/home/bot/tutorial/tutorial_ws/src/tutorial_hello_world/include")
set_tests_properties(cppcheck PROPERTIES  LABELS "cppcheck;linter" TIMEOUT "300" WORKING_DIRECTORY "/home/bot/tutorial/tutorial_ws/src/tutorial_hello_world")
add_test(cpplint "/usr/bin/python3" "-u" "/home/bot/ros2_foxy/install/ament_cmake_test/share/ament_cmake_test/cmake/run_test.py" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/test_results/tutorial_hello_world/cpplint.xunit.xml" "--package-name" "tutorial_hello_world" "--output-file" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/ament_cpplint/cpplint.txt" "--command" "/home/bot/ros2_foxy/install/ament_cpplint/bin/ament_cpplint" "--xunit-file" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/test_results/tutorial_hello_world/cpplint.xunit.xml")
set_tests_properties(cpplint PROPERTIES  LABELS "cpplint;linter" TIMEOUT "120" WORKING_DIRECTORY "/home/bot/tutorial/tutorial_ws/src/tutorial_hello_world")
add_test(lint_cmake "/usr/bin/python3" "-u" "/home/bot/ros2_foxy/install/ament_cmake_test/share/ament_cmake_test/cmake/run_test.py" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/test_results/tutorial_hello_world/lint_cmake.xunit.xml" "--package-name" "tutorial_hello_world" "--output-file" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/ament_lint_cmake/lint_cmake.txt" "--command" "/home/bot/ros2_foxy/install/ament_lint_cmake/bin/ament_lint_cmake" "--xunit-file" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/test_results/tutorial_hello_world/lint_cmake.xunit.xml")
set_tests_properties(lint_cmake PROPERTIES  LABELS "lint_cmake;linter" TIMEOUT "60" WORKING_DIRECTORY "/home/bot/tutorial/tutorial_ws/src/tutorial_hello_world")
add_test(uncrustify "/usr/bin/python3" "-u" "/home/bot/ros2_foxy/install/ament_cmake_test/share/ament_cmake_test/cmake/run_test.py" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/test_results/tutorial_hello_world/uncrustify.xunit.xml" "--package-name" "tutorial_hello_world" "--output-file" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/ament_uncrustify/uncrustify.txt" "--command" "/home/bot/ros2_foxy/install/ament_uncrustify/bin/ament_uncrustify" "--xunit-file" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/test_results/tutorial_hello_world/uncrustify.xunit.xml")
set_tests_properties(uncrustify PROPERTIES  LABELS "uncrustify;linter" TIMEOUT "60" WORKING_DIRECTORY "/home/bot/tutorial/tutorial_ws/src/tutorial_hello_world")
add_test(xmllint "/usr/bin/python3" "-u" "/home/bot/ros2_foxy/install/ament_cmake_test/share/ament_cmake_test/cmake/run_test.py" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/test_results/tutorial_hello_world/xmllint.xunit.xml" "--package-name" "tutorial_hello_world" "--output-file" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/ament_xmllint/xmllint.txt" "--command" "/home/bot/ros2_foxy/install/ament_xmllint/bin/ament_xmllint" "--xunit-file" "/home/bot/tutorial/tutorial_ws/src/build/tutorial_hello_world/test_results/tutorial_hello_world/xmllint.xunit.xml")
set_tests_properties(xmllint PROPERTIES  LABELS "xmllint;linter" TIMEOUT "60" WORKING_DIRECTORY "/home/bot/tutorial/tutorial_ws/src/tutorial_hello_world")