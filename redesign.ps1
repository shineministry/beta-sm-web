$htmlFiles = Get-ChildItem -Path "C:\Users\My PC\Downloads\apps - Copy" -Filter "*.html" -File

$googleFontsLink = '<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&display=swap" rel="stylesheet">'

Write-Host "Found $($htmlFiles.Count) HTML files to process"

foreach ($file in $htmlFiles) {
    Write-Host "Processing: $($file.Name)"
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8

    $original = $content

    # Add Google Fonts link before </head> (only if not already added)
    if ($content -notlike "*Playfair+Display*") {
        $content = $content.Replace("</head>", "$googleFontsLink</head>")
    }

    # Replace all CSS values in the ptDGoc style block
    # Background-color of main content areas
    $content = $content.Replace('.M63kCb{background-color: rgba(255,255,255,1);}', '.M63kCb{background-color: rgba(253,247,237,1);}')

    # General text color (dark) - change from dark gray to dark brown
    $content = $content.Replace('.OUGEr{color: rgba(33,33,33,1);}', '.OUGEr{color: rgba(44,24,16,1);}')

    # Heading accent colors - change from blue to burgundy
    $content = $content.Replace('.duRjpb .OUGEr{color: rgba(6,65,124,1);}', '.duRjpb .OUGEr{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.JYVBee .OUGEr{color: rgba(6,65,124,1);}', '.JYVBee .OUGEr{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.OmQG5e .OUGEr{color: rgba(6,65,124,1);}', '.OmQG5e .OUGEr{color: rgba(94,28,42,1);}')

    # Font - add Playfair Display as primary
    $content = $content.Replace(".ySLm4c{font-family: 'Open Sans', sans-serif;}", ".ySLm4c{font-family: 'Playfair Display', 'Open Sans', sans-serif;}")

    # Dark section backgrounds - change from navy blue to burgundy
    $content = $content.Replace('.CbiMKe{background-color: rgba(31,56,80,1);}', '.CbiMKe{background-color: rgba(94,28,42,1);}')

    # Light section text - change from blue to dark brown
    $content = $content.Replace('.qeLZfd .zfr3Q{color: rgba(0,48,95,1);}', '.qeLZfd .zfr3Q{color: rgba(44,24,16,1);}')
    $content = $content.Replace('.qeLZfd .qnVSj{color: rgba(0,48,95,1);}', '.qeLZfd .qnVSj{color: rgba(44,24,16,1);}')
    $content = $content.Replace('.qeLZfd .Glwbz{color: rgba(0,48,95,1);}', '.qeLZfd .Glwbz{color: rgba(44,24,16,1);}')

    # Light section link hover color
    $content = $content.Replace('.qeLZfd .dhtgD:hover{color: rgba(33,33,33,0.8500000238);}', '.qeLZfd .dhtgD:hover{color: rgba(94,28,42,0.85);}')

    # Light section text color
    $content = $content.Replace('.qeLZfd .OUGEr{color: rgba(0,48,95,1);}', '.qeLZfd .OUGEr{color: rgba(94,28,42,1);}')

    # Light section top border/bg - change from warm gray to warm gold
    $content = $content.Replace('.qeLZfd:before{background-color: rgba(225,223,219,1); display: block;}', '.qeLZfd:before{background-color: rgba(229,213,181,1); display: block;}')

    # Dark section text - change from light gray to warm cream
    $content = $content.Replace('.lQAHbd .zfr3Q{color: rgba(225,223,219,1);}', '.lQAHbd .zfr3Q{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.lQAHbd .qnVSj{color: rgba(225,223,219,1);}', '.lQAHbd .qnVSj{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.lQAHbd .Glwbz{color: rgba(225,223,219,1);}', '.lQAHbd .Glwbz{color: rgba(253,247,237,1);}')

    # Dark section headings - change from light blue-gray to gold
    $content = $content.Replace('.lQAHbd .duRjpb{color: rgba(187,204,214,1);}', '.lQAHbd .duRjpb{color: rgba(229,213,181,1);}')
    $content = $content.Replace('.lQAHbd .qLrapd{color: rgba(187,204,214,1);}', '.lQAHbd .qLrapd{color: rgba(229,213,181,1);}')
    $content = $content.Replace('.lQAHbd .JYVBee{color: rgba(187,204,214,1);}', '.lQAHbd .JYVBee{color: rgba(229,213,181,1);}')
    $content = $content.Replace('.lQAHbd .aHM7ed{color: rgba(187,204,214,1);}', '.lQAHbd .aHM7ed{color: rgba(229,213,181,1);}')
    $content = $content.Replace('.lQAHbd .OmQG5e{color: rgba(187,204,214,1);}', '.lQAHbd .OmQG5e{color: rgba(229,213,181,1);}')
    $content = $content.Replace('.lQAHbd .NHD4Gf{color: rgba(187,204,214,1);}', '.lQAHbd .NHD4Gf{color: rgba(229,213,181,1);}')

    # Dark section text color - change from light gray to warm cream
    $content = $content.Replace('.lQAHbd .OUGEr{color: rgba(225,223,219,1);}', '.lQAHbd .OUGEr{color: rgba(253,247,237,1);}')

    # Dark section heading accents - change from blue-gray to gold
    $content = $content.Replace('.lQAHbd .duRjpb .OUGEr{color: rgba(187,204,214,1);}', '.lQAHbd .duRjpb .OUGEr{color: rgba(229,213,181,1);}')
    $content = $content.Replace('.lQAHbd .JYVBee .OUGEr{color: rgba(187,204,214,1);}', '.lQAHbd .JYVBee .OUGEr{color: rgba(229,213,181,1);}')
    $content = $content.Replace('.lQAHbd .OmQG5e .OUGEr{color: rgba(187,204,214,1);}', '.lQAHbd .OmQG5e .OUGEr{color: rgba(229,213,181,1);}')

    # Dark section top background - change from navy to burgundy
    $content = $content.Replace('.lQAHbd:before{background-color: rgba(31,56,80,1); display: block;}', '.lQAHbd:before{background-color: rgba(94,28,42,1); display: block;}')

    # Decorative section text - change from light gray to warm cream
    $content = $content.Replace('.cJgDec .zfr3Q{color: rgba(225,223,219,1);}', '.cJgDec .zfr3Q{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.cJgDec .zfr3Q .OUGEr{color: rgba(225,223,219,1);}', '.cJgDec .zfr3Q .OUGEr{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.cJgDec .qnVSj{color: rgba(225,223,219,1);}', '.cJgDec .qnVSj{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.cJgDec .Glwbz{color: rgba(225,223,219,1);}', '.cJgDec .Glwbz{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.cJgDec .qLrapd{color: rgba(225,223,219,1);}', '.cJgDec .qLrapd{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.cJgDec .aHM7ed{color: rgba(225,223,219,1);}', '.cJgDec .aHM7ed{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.cJgDec .NHD4Gf{color: rgba(225,223,219,1);}', '.cJgDec .NHD4Gf{color: rgba(253,247,237,1);}')

    # Also update the navigation header background
    # The header nav uses background-image with gradient, but the solid color fallback is CbiMKe
    # Also replace any remaining references to the old blue
    # Some pages might have inline background colors in the header section
    # Replace the common blue background in section headers
    $content = $content.Replace('background-color: rgba(31,56,80,1);', 'background-color: rgba(94,28,42,1);')

    if ($content -ne $original) {
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.UTF8Encoding]::new($false))
        Write-Host "  -> Updated" -ForegroundColor Green
    } else {
        Write-Host "  -> No changes needed" -ForegroundColor Yellow
    }
}

Write-Host "`nDesign update complete!" -ForegroundColor Cyan
