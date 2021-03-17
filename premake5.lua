project "ImGui"
    kind "SharedLib"
    language "C++"
    staticruntime "off"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
        "imgui_demo.cpp",
		"../glmVendor/glm/**.hpp",
		"../glmVendor/glm/**.inl",
    }

    includedirs {
    	"../glmVendor",
    }

    defines {
        "IMGUI_API_EXPORT"
    }
    
    filter "system:windows"
        systemversion "latest"
        cppdialect "C++17"

    filter { "system:windows", "configurations:Debug" }
        buildoptions "/MDd"

    filter { "system:windows", "configurations:Release" }
        buildoptions "/MD"
