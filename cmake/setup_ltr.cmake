macro(SetUpLTR LTR_Source_Path)
	##########################################################################################
	# lets SETup OpenMP flags
	FIND_PACKAGE(OpenMP)
	IF(OPENMP_FOUND)
	    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
	    SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
	ENDIF(OPENMP_FOUND)

	# let use pthread on unix
	IF(UNIX)
	    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -pthread")
	    SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O2 -pthread")
	ENDIF(UNIX)
	
	MESSAGE(STATUS "LTR_Source_Path       : ${LTR_Source_Path}")
	
	##########################################################################################
	# lets SETup ltr
	SET(LTR_Install_Path ${LTR_Source_Path}/lib)

	INCLUDE_DIRECTORIES(${LTR_Source_Path})
	INCLUDE_DIRECTORIES(${LTR_Source_Path}/contrib)
	LINK_DIRECTORIES(${LTR_Install_Path})

	FIND_LIBRARY(LTR_library ltr HINTS ${LTR_Install_Path})
	FIND_LIBRARY(LTR_library_d ltr_d HINTS ${LTR_Install_Path})

	# lets SETup Utilities
	FIND_LIBRARY(rlog_library rlog HINTS ${LTR_Install_Path})
	FIND_LIBRARY(rlog_library_d rlog_d HINTS ${LTR_Install_Path})

	# lets SETup Puppy
	FIND_LIBRARY(puppy_library puppy HINTS ${LTR_Install_Path})
	FIND_LIBRARY(puppy_library_d puppy_d HINTS ${LTR_Install_Path})
	
	SET(LTR_libs optimized ltr debug ltr_d
		optimized puppy debug puppy_d
		optimized rlog debug rlog_d
		${Boost_LIBRARIES})
	
	IF(LTR_library AND rlog_library AND puppy_library)
		MESSAGE(STATUS "LTR RELEASE libraries have been found")
	ELSE(LTR_library AND rlog_library AND puppy_library)
		MESSAGE(STATUS "LTR RELEASE libraries have been NOT found")
	ENDIF(LTR_library AND rlog_library AND puppy_library)
	
	IF(LTR_library_d AND rlog_library_d AND puppy_library_d)
		MESSAGE(STATUS "LTR DEBUG libraries have been found")
	ELSE(LTR_library_d AND rlog_library_d AND puppy_library_d)
		MESSAGE(STATUS "LTR DEBUG libraries have been NOT found")
	ENDIF(LTR_library_d AND rlog_library_d AND puppy_library_d)

endmacro()
