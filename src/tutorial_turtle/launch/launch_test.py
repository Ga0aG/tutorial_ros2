
def generate_test_description():

    return launch.LaunchDescription([
        launch.actions.ExecuteProcess(
            cmd=[path_to_process],
        ),

        # Start tests right away - no need to wait for anything in this example.
        # In a more complicated launch description, we might want this action happen
        # once some process starts or once some other event happens
        launch_testing.actions.ReadyToTest()
    ])
@launch_testing.post_shutdown_test()
class TestShutdown(unittest.TestCase):

    def test_exit_code(self):
        # Check that all processes in the launch (in this case, there's just one) exit
        # with code 0
        launch_testing.asserts.assertExitCodes(self.proc_info)
