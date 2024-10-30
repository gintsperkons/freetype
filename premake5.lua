project "freetype"
    kind "StaticLib"
    targetdir "Binaries\\%{cfg.buildcfg}"

    targetdir ("%{wks.location}\\Binaries\\" .. OutputDir .. "\\%{prj.name}")
    objdir ("%{wks.location}\\Binaries\\Intermediates\\" .. OutputDir .. "\\%{prj.name}")
    debugdir("%{wks.location}\\Binaries\\" .. OutputDir .. "\\%{prj.name}")

    includedirs { IncludeDir["FreeType"] }
    defines { "FT2_BUILD_LIBRARY" }

    -- Source files
    files {
        "src/autofit/autofit.c",
        "src/base/ftbase.c",
        "src/base/ftbbox.c",
        "src/base/ftbdf.c",
        "src/base/ftbitmap.c",
        "src/base/ftcid.c",
        "src/base/ftfstype.c",
        "src/base/ftgasp.c",
        "src/base/ftglyph.c",
        "src/base/ftgxval.c",
        "src/base/ftinit.c",
        "src/base/ftmm.c",
        "src/base/ftotval.c",
        "src/base/ftpatent.c",
        "src/base/ftpfr.c",
        "src/base/ftstroke.c",
        "src/base/ftsynth.c",
        "src/base/fttype1.c",
        "src/base/ftwinfnt.c",
        "src/bdf/bdf.c",
        "src/cache/ftcache.c",
        "src/cff/cff.c",
        "src/cid/type1cid.c",
        "src/gzip/ftgzip.c",
        "src/lzw/ftlzw.c",
        "src/pcf/pcf.c",
        "src/pfr/pfr.c",
        "src/psaux/psaux.c",
        "src/pshinter/pshinter.c",
        "src/psnames/psmodule.c",
        "src/raster/raster.c",
        "src/sfnt/sfnt.c",
        "src/sdf/sdf.c",
        "src/smooth/smooth.c",
        "src/truetype/truetype.c",
        "src/type1/type1.c",
        "src/type42/type42.c",
        "src/winfonts/winfnt.c",
        "src/svg/ftsvg.c"
    }

    -- Platform-specific files
    filter "system:windows"
        files { "builds/windows/ftsystem.c", "builds/windows/ftdebug.c" }

    filter "not system:windows"
        buildoptions { "-fPIC" }  -- Ensure -fPIC is set for non-Windows builds
        files { "src/base/ftsystem.c", "src/base/ftdebug.c" }

    -- Reset filter to ensure the next settings apply globally
    filter {}
