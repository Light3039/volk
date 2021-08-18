project "volk"

	-- Output Directories --
	location "%{wks.location}/Dependencies/volk"

	targetdir ("%{wks.location}/bin/" .. outputdir)
	objdir    ("%{wks.location}/bin-int/" .. outputdir)

	-- Compiler --
	kind "StaticLib"
	language "C"

	-- Project Files --
	files
	{
		"volk.c",
		"volk.h",

		"build.lua",
	}

	-- Dependencies --
	includedirs
	{
		(dependenciesdir .. "vulkan/Include"),
	}

	filter "system:windows"
		defines
		{
			"_CRT_SECURE_NO_WARNINGS",
			"VK_USE_PLATFORM_WIN32_KHR",
		}

	-- filter "system:linux"
		-- defines "VK_USE_PLATFORM_XLIB_KHR"
