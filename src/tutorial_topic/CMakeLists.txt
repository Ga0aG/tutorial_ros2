cmake_minimum_required(VERSION 3.5)
project(tutorial_topic)

# Default to C99
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 99)
endif()

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)
find_package(tutorial_interfaces REQUIRED)

# uncomment the following section in order to fill in
# further dependencies manually.
# find_package(<dependency> REQUIRED)

add_executable(publisher src/publisher.cpp)
add_executable(subscriber src/subscriber.cpp)
add_executable(subscriber_multi src/subscriber_multi.cpp)
add_executable(pub_custom_msg src/pub_custom_msg.cpp)
add_executable(publisher_statistics src/publisher_statistics.cpp)
ament_target_dependencies(publisher rclcpp std_msgs)
ament_target_dependencies(subscriber rclcpp std_msgs)
ament_target_dependencies(subscriber_multi rclcpp std_msgs)
ament_target_dependencies(publisher_statistics rclcpp std_msgs)
ament_target_dependencies(pub_custom_msg tutorial_interfaces rclcpp std_msgs)

target_include_directories(publisher_statistics PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>)
target_include_directories(publisher PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>)
target_include_directories(subscriber PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>)
target_include_directories(subscriber_multi PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>)
target_include_directories(pub_custom_msg PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>)

install(TARGETS publisher
  DESTINATION lib/${PROJECT_NAME})
install(TARGETS publisher_statistics
  DESTINATION lib/${PROJECT_NAME})
install(TARGETS subscriber
  DESTINATION lib/${PROJECT_NAME})
install(TARGETS subscriber_multi
  DESTINATION lib/${PROJECT_NAME})
install(TARGETS pub_custom_msg
  DESTINATION lib/${PROJECT_NAME})

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # uncomment the line when a copyright and license is not present in all source files
  #set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # uncomment the line when this package is not in a git repo
  #set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
