# ros2-pkg-gen-helper

### Interactive shell script that asks for user input for following and generates ROS2 workspace with package name and node name and folder structure

usage: execute following command from your terminal [notice the "." before the shell script filename]: 

    . make-pkg.sh

### Inputs required:
1. ROS DISTRO Name e.g. foxy
2. workspace name without _ws suffix e.g. test [will generate workspace folder named test_ws]
3. package name
4. node name
5. build type or programming language - python or cpp [defaults to python]

### Output and folder structure generated
for inputs listed below:

ROS DISTRO name=foxy

workspace name=test

package name=testpkg

node name=mybot

build type=python

following folder structure will be generated 
test_ws

    src
  
        testpkg
        
            launch
            
            resource
            
            test
            
            testpkg
            
                __init__.py
                
                mybot.py
            
            world
            
            package.xml
            
            setup.cfg
            
            setup.py

in addition colcon build will be run after sourcing the ROS environment from ROS DISTRO specified
