# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
PostBuild.CGL.Debug:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/Debug/libCGL.a:
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/Debug/libCGL.a


PostBuild.glew.Debug:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/Debug/libglew.a:
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/Debug/libglew.a


PostBuild.glfw.Debug:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/Debug/libglfw3.a:
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/Debug/libglfw3.a


PostBuild.meshedit.Debug:
PostBuild.CGL.Debug: /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/Debug/meshedit
PostBuild.glew.Debug: /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/Debug/meshedit
PostBuild.glfw.Debug: /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/Debug/meshedit
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/Debug/meshedit:\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/Debug/libCGL.a\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/Debug/libglew.a\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/Debug/libglfw3.a\
	/usr/local/lib/libfreetype.dylib\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/src/dirent/glut32.lib\
	/usr/local/lib/libfreetype.dylib
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/Debug/meshedit


PostBuild.CGL.Release:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/Release/libCGL.a:
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/Release/libCGL.a


PostBuild.glew.Release:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/Release/libglew.a:
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/Release/libglew.a


PostBuild.glfw.Release:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/Release/libglfw3.a:
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/Release/libglfw3.a


PostBuild.meshedit.Release:
PostBuild.CGL.Release: /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/Release/meshedit
PostBuild.glew.Release: /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/Release/meshedit
PostBuild.glfw.Release: /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/Release/meshedit
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/Release/meshedit:\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/Release/libCGL.a\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/Release/libglew.a\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/Release/libglfw3.a\
	/usr/local/lib/libfreetype.dylib\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/src/dirent/glut32.lib\
	/usr/local/lib/libfreetype.dylib
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/Release/meshedit


PostBuild.CGL.MinSizeRel:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/MinSizeRel/libCGL.a:
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/MinSizeRel/libCGL.a


PostBuild.glew.MinSizeRel:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/MinSizeRel/libglew.a:
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/MinSizeRel/libglew.a


PostBuild.glfw.MinSizeRel:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/MinSizeRel/libglfw3.a:
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/MinSizeRel/libglfw3.a


PostBuild.meshedit.MinSizeRel:
PostBuild.CGL.MinSizeRel: /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/MinSizeRel/meshedit
PostBuild.glew.MinSizeRel: /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/MinSizeRel/meshedit
PostBuild.glfw.MinSizeRel: /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/MinSizeRel/meshedit
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/MinSizeRel/meshedit:\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/MinSizeRel/libCGL.a\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/MinSizeRel/libglew.a\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/MinSizeRel/libglfw3.a\
	/usr/local/lib/libfreetype.dylib\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/src/dirent/glut32.lib\
	/usr/local/lib/libfreetype.dylib
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/MinSizeRel/meshedit


PostBuild.CGL.RelWithDebInfo:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/RelWithDebInfo/libCGL.a:
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/RelWithDebInfo/libCGL.a


PostBuild.glew.RelWithDebInfo:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/RelWithDebInfo/libglew.a:
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/RelWithDebInfo/libglew.a


PostBuild.glfw.RelWithDebInfo:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/RelWithDebInfo/libglfw3.a:
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/RelWithDebInfo/libglfw3.a


PostBuild.meshedit.RelWithDebInfo:
PostBuild.CGL.RelWithDebInfo: /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/RelWithDebInfo/meshedit
PostBuild.glew.RelWithDebInfo: /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/RelWithDebInfo/meshedit
PostBuild.glfw.RelWithDebInfo: /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/RelWithDebInfo/meshedit
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/RelWithDebInfo/meshedit:\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/RelWithDebInfo/libCGL.a\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/RelWithDebInfo/libglew.a\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/RelWithDebInfo/libglfw3.a\
	/usr/local/lib/libfreetype.dylib\
	/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/src/dirent/glut32.lib\
	/usr/local/lib/libfreetype.dylib
	/bin/rm -f /Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/RelWithDebInfo/meshedit




# For each target create a dummy ruleso the target does not have to exist
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/src/dirent/glut32.lib:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/Debug/libglew.a:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/MinSizeRel/libglew.a:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/RelWithDebInfo/libglew.a:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glew/Release/libglew.a:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/Debug/libglfw3.a:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/MinSizeRel/libglfw3.a:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/RelWithDebInfo/libglfw3.a:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/deps/glfw/src/Release/libglfw3.a:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/Debug/libCGL.a:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/MinSizeRel/libCGL.a:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/RelWithDebInfo/libCGL.a:
/Users/ziyezhong/desktop/CS284/p2-meshedit-sp20-ZiyeZhong/xcode/CGL/src/Release/libCGL.a:
/usr/local/lib/libfreetype.dylib:
