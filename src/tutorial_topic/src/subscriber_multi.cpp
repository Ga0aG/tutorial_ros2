#include <memory>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"
using std::placeholders::_1;
// 会一起丢包
class MultiSubscriber : public rclcpp::Node
{
  public:
    MultiSubscriber()
    : Node("multi_subscriber")
    {
      subscription1_ = this->create_subscription<std_msgs::msg::String>(
      "topic", 10, std::bind(&MultiSubscriber::topic_callback1, this, _1));
      subscription2_ = this->create_subscription<std_msgs::msg::String>(
      "topic", 10, std::bind(&MultiSubscriber::topic_callback2, this, _1));
    }

  private:
    void topic_callback1(const std_msgs::msg::String::SharedPtr msg) const
    {
      RCLCPP_INFO(this->get_logger(), "1 heard: '%s'", msg->data.c_str());

    }
    void topic_callback2(const std_msgs::msg::String::SharedPtr msg) const
    {
      RCLCPP_INFO(this->get_logger(), "2 heard: '%s'", msg->data.c_str());
      rclcpp::sleep_for(std::chrono::seconds(2));
    }
    rclcpp::Subscription<std_msgs::msg::String>::SharedPtr subscription1_;
    rclcpp::Subscription<std_msgs::msg::String>::SharedPtr subscription2_;
};

class MultiThreadSubscriber : public rclcpp::Node
{
  public:
    MultiThreadSubscriber()
    : Node("multi_subscriber")
    {
      auto cbg = this->create_callback_group(rclcpp::CallbackGroupType::Reentrant);
      subscription1_ = this->create_subscription<std_msgs::msg::String>(
      "topic", 10, std::bind(&MultiThreadSubscriber::topic_callback1, this, _1),rmw_qos_profile_default,cbg);
      subscription2_ = this->create_subscription<std_msgs::msg::String>(
      "topic", 10, std::bind(&MultiThreadSubscriber::topic_callback2, this, _1),rmw_qos_profile_default,cbg);
    }

  private:
    void topic_callback1(const std_msgs::msg::String::SharedPtr msg) const
    {
      RCLCPP_INFO(this->get_logger(), "1 heard: '%s'", msg->data.c_str());

    }
    void topic_callback2(const std_msgs::msg::String::SharedPtr msg) const
    {
      RCLCPP_INFO(this->get_logger(), "2 heard: '%s'", msg->data.c_str());
      rclcpp::sleep_for(std::chrono::seconds(2));
    }
    rclcpp::Subscription<std_msgs::msg::String>::SharedPtr subscription1_;
    rclcpp::Subscription<std_msgs::msg::String>::SharedPtr subscription2_;
};

int main(int argc, char * argv[])
{
  rclcpp::init(argc, argv);
  // rclcpp::spin(std::make_shared<MultiSubscriber>());
  std::shared_ptr<rclcpp::Node> node =
    std::make_shared<MultiThreadSubscriber>("test_multi_threaded_executor subscribers");
  bool yield_before_execute = true;
  rclcpp::executors::MultiThreadedExecutor executor(
    rclcpp::ExecutorOptions(), 2u, yield_before_execute);
  executor.add_node(node);
  executor.spin();
  rclcpp::shutdown();
  return 0;
}
