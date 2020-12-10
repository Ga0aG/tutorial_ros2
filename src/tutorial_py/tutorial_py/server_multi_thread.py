from example_interfaces.srv import AddTwoInts

import rclpy
from rclpy.node import Node

from time import sleep


class MinimalService(Node):

    def __init__(self):
        super().__init__('minimal_service')
        self.srv = self.create_service(AddTwoInts, 'add_two_ints', self.add_two_ints_callback,
        callback_group = rclpy.callback_groups.ReentrantCallbackGroup())

    def add_two_ints_callback(self, request, response):
        response.sum = request.a + request.b
        sleep(2)
        self.get_logger().info('Incoming request\na: %d b: %d' % (request.a, request.b))
        return response


def main(args=None):
    rclpy.init(args=args)
    exec = rclpy.executors.MultiThreadedExecutor()
    minimal_service = MinimalService()
    exec.add_node(minimal_service)
    exec.spin()

    rclpy.shutdown()


if __name__ == '__main__':
    main()