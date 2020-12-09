from setuptools import setup

package_name = 'tutorial_py'

setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='root',
    maintainer_email='root@todo.todo',
    description='TODO: Package description',
    license='TODO: License declaration',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'service = tutorial_py.server_simple:main',
            'client = tutorial_py.client_simple:main',
            'server_multi_thread = tutorial_py.server_multi_thread:main',
            'client_multi_thread = tutorial_py.client_multi_thread:main',
        ],
    },
)
