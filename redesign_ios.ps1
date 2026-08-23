# iOS-style redesign pass 3 - design only, zero content changes
$ErrorActionPreference = 'Stop'
$dir = 'C:\Users\My PC\Downloads\apps - Copy'
$htmlFiles = Get-ChildItem -Path $dir -Filter '*.html' -File

$sfFont = "-apple-system,BlinkMacSystemFont,'Helvetica Neue',Helvetica,Arial,sans-serif"

$marker = 'IOS_BETA_BANNER_CSS_V1'
$iosCss = @"
/*$marker*/
html{-webkit-text-size-adjust:100%;}
body{margin-top:38px !important;}
body::before{content:"SHINE CATHOLIC MEDIA MINISTRY - BETA VERSION";position:fixed;top:0;left:0;right:0;height:38px;line-height:38px;z-index:2147483647;text-align:center;font-family:-apple-system,BlinkMacSystemFont,'Helvetica Neue',Helvetica,Arial,sans-serif;font-size:12px;font-weight:600;letter-spacing:.04em;color:#ffffff;background:rgba(0,122,255,0.96);-webkit-backdrop-filter:saturate(180%) blur(20px);backdrop-filter:saturate(180%) blur(20px);box-shadow:0 1px 0 rgba(0,0,0,0.12);}
.duRjpb,.LB7kq .duRjpb,.gk8rDe .duRjpb,.Zjiec{letter-spacing:-0.02em;}
.JYVBee,.LB7kq .JYVBee,.gk8rDe .JYVBee{letter-spacing:-0.01em;}
.QmpIrf,.xkUom,.KjwKmc,.qV4dIc{border-radius:12px !important;}
.O13XJf .lkHyyc:before,.LB7kq .lkHyyc:before{border-radius:14px;}
.dhtgD,.hDrhEe,.jgXgSe,.M9vuGd{transition:color .18s ease;}
::selection{background:rgba(0,122,255,0.18);}
"@

$themeMeta = '<meta name="theme-color" content="#007AFF">'

Write-Host "Found $($htmlFiles.Count) HTML files (iOS pass)"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $original = $content

    # ---------- FONTS -> SF Pro stack ----------
    $content = $content.Replace("font-family: 'Playfair Display', 'Open Sans', sans-serif;", "font-family: $sfFont;")
    $content = $content.Replace("font-family: 'Playfair Display', serif;", "font-family: $sfFont;")
    $content = $content.Replace("font-family: 'Open Sans', sans-serif;", "font-family: $sfFont;")

    # ---------- GOLD headings/titles/icons on dark -> white ----------
    $content = $content.Replace('.lQAHbd .duRjpb{color: rgba(229,213,181,1);}', '.lQAHbd .duRjpb{color: rgba(255,255,255,1);}')
    $content = $content.Replace('.lQAHbd .qLrapd{color: rgba(229,213,181,1);}', '.lQAHbd .qLrapd{color: rgba(255,255,255,1);}')
    $content = $content.Replace('.lQAHbd .JYVBee{color: rgba(229,213,181,1);}', '.lQAHbd .JYVBee{color: rgba(255,255,255,1);}')
    $content = $content.Replace('.lQAHbd .aHM7ed{color: rgba(229,213,181,1);}', '.lQAHbd .aHM7ed{color: rgba(255,255,255,1);}')
    $content = $content.Replace('.lQAHbd .OmQG5e{color: rgba(229,213,181,1);}', '.lQAHbd .OmQG5e{color: rgba(255,255,255,1);}')
    $content = $content.Replace('.lQAHbd .NHD4Gf{color: rgba(229,213,181,1);}', '.lQAHbd .NHD4Gf{color: rgba(255,255,255,1);}')
    $content = $content.Replace('.lQAHbd .duRjpb .OUGEr{color: rgba(229,213,181,1);}', '.lQAHbd .duRjpb .OUGEr{color: rgba(255,255,255,1);}')
    $content = $content.Replace('.lQAHbd .JYVBee .OUGEr{color: rgba(229,213,181,1);}', '.lQAHbd .JYVBee .OUGEr{color: rgba(255,255,255,1);}')
    $content = $content.Replace('.lQAHbd .OmQG5e .OUGEr{color: rgba(229,213,181,1);}', '.lQAHbd .OmQG5e .OUGEr{color: rgba(255,255,255,1);}')
    $content = $content.Replace('.Zjiec{color: rgba(229,213,181,1);', '.Zjiec{color: rgba(255,255,255,1);')
    $content = $content.Replace('.YTv4We{color: rgba(229,213,181,1);}', '.YTv4We{color: rgba(255,255,255,1);}')
    $content = $content.Replace('.ZXW7w{color: rgba(229,213,181,1); opacity: 0.6;', '.ZXW7w{color: rgba(255,255,255,1); opacity: 0.6;')
    $content = $content.Replace('.PsKE7e{color: rgba(229,213,181,1);', '.PsKE7e{color: rgba(255,255,255,1);')
    $content = $content.Replace('.tCHXDc{color: rgba(229,213,181,1);}', '.tCHXDc{color: rgba(255,255,255,1);}')
    $content = $content.Replace('.Wew9ke{fill: rgba(229,213,181,1);}', '.Wew9ke{fill: rgba(255,255,255,1);}')
    $content = $content.Replace('.fOU46b .a3ETed .KJll8d{background-color: rgba(229,213,181,1);}', '.fOU46b .a3ETed .KJll8d{background-color: rgba(255,255,255,1);}')
    $content = $content.Replace('.fOU46b .a3ETed .iWs3gf.chg4Jd:focus{background-color: rgba(229,213,181,0.1199999973);}', '.fOU46b .a3ETed .iWs3gf.chg4Jd:focus{background-color: rgba(255,255,255,0.1199999973);}')

    # ---------- Burgundy -> iOS blue (all alphas) ----------
    $content = $content.Replace('rgba(94,28,42,', 'rgba(0,122,255,')

    # ---------- Cream -> white (page bg + text on dark) ----------
    $content = $content.Replace('rgba(253,247,237,', 'rgba(255,255,255,')

    # ---------- Dark brown -> black (text, dark sections, overlays) ----------
    $content = $content.Replace('rgba(44,24,16,', 'rgba(0,0,0,')

    # ---------- Remaining gold -> iOS secondary gray (all alphas) ----------
    $content = $content.Replace('rgba(229,213,181,', 'rgba(142,142,147,')

    # ---------- theme-color meta for iOS Safari ----------
    if ($content -notlike '*name="theme-color"*') {
        $content = $content.Replace('</head>', "$themeMeta</head>")
    }

    # ---------- Append iOS polish + fixed beta banner into ptDGoc style block ----------
    if (-not $content.Contains($marker)) {
        $anchor = 'jsname="ptDGoc"'
        $ai = $content.IndexOf($anchor)
        if ($ai -ge 0) {
            $closeIdx = $content.IndexOf('</style>', $ai)
            if ($closeIdx -ge 0) {
                $content = $content.Insert($closeIdx, $iosCss)
            }
        }
    }

    if ($content -ne $original) {
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.UTF8Encoding]::new($false))
        Write-Host "  -> Updated $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "  -> No changes $($file.Name)" -ForegroundColor Yellow
    }
}

Write-Host 'iOS redesign complete.' -ForegroundColor Cyan
