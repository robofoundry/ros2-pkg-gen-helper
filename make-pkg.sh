#!/bin/bash

BASEDIR=${PWD}
echo "current folder [workspace folder will be created here]: $BASEDIR"


echo "Enter ROS Distro Name [e.g. foxy. default is foxy] :" 
read ros_distro



echo "Enter Workspace Name [without _ws suffix] :"
read wsName
wsName+="_ws"
echo "workspace directory will be created as $wsName"

echo "Enter Package Name to be created inside the workspace :"
read pkgName
echo "package name : $pkgName"

echo "Enter Node Name to be created inside the workspace :"
read nodeName
echo "Node name : $nodeName"

prBuildType="ament_python"
echo "Enter programming language - python [default] or cpp:"
read prLanguage
echo "language name : $prLanguage"


if [ "$prLanguage" == "" ] || [ "$prLanguage" == "python" ] || [ "$prLanguage" == "Python" ]; then
    prBuildType="ament_python"
else
    prBuildType="ament_cmake"
fi

dirpath="${BASEDIR}"
echo "updated dirpath:: $dirpath"
dirpath+="/${wsName}/src"

#echo "basdir::$BASEDIR wsname::$wsName"

echo "following workspace folders will be created:$dirpath"
mkdir -p $dirpath 
cd $wsName
echo "sourcing ROS environment..."
source /opt/ros/$ros_distro/setup.bash 

cd src
pwd

echo "creating a package..."
echo "buildtype::$prBuildType pkgname::$pkgName"
if [ "$nodeName" != "" ]; then
    ros2 pkg create --build-type $prBuildType --node-name $nodeName $pkgName --dependencies rclpy std_msgs
else
    ros2 pkg create --build-type $prBuildType $pkgName --dependencies rclpy std_msgs
fi

cd $pkgName
pwd
mkdir launch
mkdir world

echo "changing back to workspace root folder::$wsName"
cd $dirpath
cd ..
pwd

echo "running colcon build..."
colcon build 



