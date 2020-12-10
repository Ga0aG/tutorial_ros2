import sys

from example_interfaces.srv import AddTwoInts
import rclpy
from rclpy.node import Node


class MinimalClientAsync(Node):

    def __init__(self):
        super().__init__('minimal_client_async')
        group = rclpy.callback_groups.ReentrantCallbackGroup()
        self.cli1 = self.create_client(AddTwoInts, 'add_two_ints',callback_group=group)
        self.cli2 = self.create_client(AddTwoInts, 'add_two_ints',callback_group=group)
        # server node 开始跑了应该就是ready,所以只要一个wait_for_service
        while not self.cli1.wait_for_service(timeout_sec=1.0):
            self.get_logger().info('service not available, waiting again...')
        self.req1 = AddTwoInts.Request()
        self.req2 = AddTwoInts.Request()

    def send_request(self):
        self.req1.a = 1
        self.req1.b = 2
        self.future1 = self.cli1.call_async(self.req1)
        self.req2.a = 3
        self.req2.b = 4
        self.future2 = self.cli2.call_async(self.req2)

def main(args=None):
    rclpy.init(args=args)
    exec = rclpy.executors.MultiThreadedExecutor()
    minimal_client = MinimalClientAsync()
    minimal_client.send_request()
    exec.add_node(minimal_client)
    # while rclpy.ok():
    #     exec.spin_once()
    #     if minimal_client.future1.done() and minimal_client.future2.done():
    #         try:
    #             response1 = minimal_client.future1.result()
    #         except Exception as e:
    #             minimal_client.get_logger().info(
    #                 'Service call failed %r' % (e,))
    #         else:
    #             minimal_client.get_logger().info(
    #                 'Result of add_two_ints: for %d + %d = %d' %
    #                 (minimal_client.req1.a, minimal_client.req1.b, response1.sum))
    #         try:
    #             response2 = minimal_client.future2.result()
    #         except Exception as e:
    #             minimal_client.get_logger().info(
    #                 'Service call failed %r' % (e,))
    #         else:
    #             minimal_client.get_logger().info(
    #                 'Result of add_two_ints: for %d + %d = %d' %
    #                 (minimal_client.req2.a, minimal_client.req2.b, response2.sum))
    #         break

    minimal_client.get_logger().info(
        'Switch to spin_until_future_complete')
    exec.spin_until_future_complete(minimal_client.future1)
    response1 = minimal_client.future1.result()
    minimal_client.get_logger().info(
        'Result of add_two_ints: for %d + %d = %d' %
        (minimal_client.req1.a, minimal_client.req1.b, response1.sum))
    exec.spin_until_future_complete(minimal_client.future2)
    response2 = minimal_client.future2.result()
    minimal_client.get_logger().info(
        'Result of add_two_ints: for %d + %d = %d' %
        (minimal_client.req2.a, minimal_client.req2.b, response2.sum))


    minimal_client.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()