$htmlFiles = Get-ChildItem -Path "C:\Users\My PC\Downloads\apps - Copy" -Filter "*.html" -File

Write-Host "Found $($htmlFiles.Count) HTML files to process (pass 2)"

$totalChanges = 0

foreach ($file in $htmlFiles) {
    Write-Host "Processing: $($file.Name)"
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $original = $content

    # ==========================================
    # PASS 2: Catch remaining old color values
    # ==========================================

    # --- Old body text color: dark gray -> dark brown ---
    $content = $content.Replace('.zfr3Q{color: rgba(33,33,33,1);', '.zfr3Q{color: rgba(44,24,16,1);')
    $content = $content.Replace('.qnVSj{color: rgba(33,33,33,1);}', '.qnVSj{color: rgba(44,24,16,1);}')
    $content = $content.Replace('.Glwbz{color: rgba(33,33,33,1);}', '.Glwbz{color: rgba(44,24,16,1);}')
    $content = $content.Replace('.dhtgD:hover{color: rgba(33,33,33,0.6999999881);}', '.dhtgD:hover{color: rgba(44,24,16,0.6999999881);}')
    $content = $content.Replace('.dhtgD:active{color: rgba(33,33,33,0.6999999881);}', '.dhtgD:active{color: rgba(44,24,16,0.6999999881);}')
    $content = $content.Replace('.ImnMyf{background-color: rgba(255,255,255,1); color: rgba(33,33,33,1);}', '.ImnMyf{background-color: rgba(255,255,255,1); color: rgba(44,24,16,1);}')
    $content = $content.Replace('.gk8rDe .zfr3Q{color: rgba(0,0,0,1);}', '.gk8rDe .zfr3Q{color: rgba(44,24,16,1);}')
    $content = $content.Replace('.O13XJf .IFuOkc:before{background-color: rgba(33,33,33,1); opacity: 0.5; display: block;}', '.O13XJf .IFuOkc:before{background-color: rgba(44,24,16,1); opacity: 0.5; display: block;}')
    $content = $content.Replace('.IFuOkc:before{background-color: rgba(33,33,33,1); opacity: 0; display: block;}', '.IFuOkc:before{background-color: rgba(44,24,16,1); opacity: 0; display: block;}')

    # --- Old blue accent #06417c (6,65,124,1) -> burgundy ---
    $content = $content.Replace('.duRjpb{color: rgba(6,65,124,1);', '.duRjpb{color: rgba(94,28,42,1);')
    $content = $content.Replace('.qLrapd{color: rgba(6,65,124,1);', '.qLrapd{color: rgba(94,28,42,1);')
    $content = $content.Replace('.JYVBee{color: rgba(6,65,124,1);', '.JYVBee{color: rgba(94,28,42,1);')
    $content = $content.Replace('.aHM7ed{color: rgba(6,65,124,1);', '.aHM7ed{color: rgba(94,28,42,1);')
    $content = $content.Replace('.OmQG5e{color: rgba(6,65,124,1);', '.OmQG5e{color: rgba(94,28,42,1);')
    $content = $content.Replace('.NHD4Gf{color: rgba(6,65,124,1);', '.NHD4Gf{color: rgba(94,28,42,1);')
    $content = $content.Replace('.lQAHbd .QmpIrf{background-color: rgba(255,255,255,1); border-color: rgba(6,65,124,1); color: rgba(6,65,124,1);', '.lQAHbd .QmpIrf{background-color: rgba(255,255,255,1); border-color: rgba(94,28,42,1); color: rgba(94,28,42,1);')
    $content = $content.Replace('.cJgDec .QmpIrf{background-color: rgba(255,255,255,1); border-color: rgba(6,65,124,1); color: rgba(6,65,124,1);', '.cJgDec .QmpIrf{background-color: rgba(255,255,255,1); border-color: rgba(94,28,42,1); color: rgba(94,28,42,1);')
    $content = $content.Replace('.tpmmCb .QmpIrf{background-color: rgba(255,255,255,1); border-color: rgba(6,65,124,1); color: rgba(6,65,124,1);', '.tpmmCb .QmpIrf{background-color: rgba(255,255,255,1); border-color: rgba(94,28,42,1); color: rgba(94,28,42,1);')
    $content = $content.Replace('.O13XJf .QmpIrf{background-color: rgba(255,255,255,1); border-color: rgba(6,65,124,1); color: rgba(6,65,124,1);', '.O13XJf .QmpIrf{background-color: rgba(255,255,255,1); border-color: rgba(94,28,42,1); color: rgba(94,28,42,1);')

    # --- Old dark blue #00305f (0,48,95,1) -> burgundy ---
    $content = $content.Replace('.fOU46b .aCIEDd .qV4dIc{color: rgba(0,48,95,1);}', '.fOU46b .aCIEDd .qV4dIc{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.fOU46b .aCIEDd .TlfmSc{color: rgba(0,48,95,1);}', '.fOU46b .aCIEDd .TlfmSc{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.fOU46b .aCIEDd .KJll8d{background-color: rgba(0,48,95,1);}', '.fOU46b .aCIEDd .KJll8d{background-color: rgba(94,28,42,1);}')
    $content = $content.Replace('.fOU46b .aCIEDd .ZXW7w{color: rgba(0,48,95,1);}', '.fOU46b .aCIEDd .ZXW7w{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.fOU46b .aCIEDd .jgXgSe:hover{color: rgba(0,48,95,1); opacity: 0.82;}', '.fOU46b .aCIEDd .jgXgSe:hover{color: rgba(94,28,42,1); opacity: 0.82;}')
    $content = $content.Replace('.fOU46b .aCIEDd .Mz8gvb{color: rgba(0,48,95,1);}', '.fOU46b .aCIEDd .Mz8gvb{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.fOU46b .aCIEDd .tCHXDc{color: rgba(0,48,95,1);}', '.fOU46b .aCIEDd .tCHXDc{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.fOU46b .aCIEDd .iWs3gf.chg4Jd:focus{background-color: rgba(0,48,95,0.1199999973);}', '.fOU46b .aCIEDd .iWs3gf.chg4Jd:focus{background-color: rgba(94,28,42,0.1199999973);}')
    $content = $content.Replace('.Vs12Bd{background-color: rgba(225,223,219,1); color: rgba(0,48,95,1);}', '.Vs12Bd{background-color: rgba(229,213,181,1); color: rgba(94,28,42,1);}')

    # --- Old header blue overlay  (0,64,125,1) -> burgundy ---
    $content = $content.Replace('.nyKByd.O13XJf .IFuOkc:after{background-color: rgba(0,64,125,1); opacity: 0.3; display: block;}', '.nyKByd.O13XJf .IFuOkc:after{background-color: rgba(94,28,42,1); opacity: 0.3; display: block;}')

    # --- Old section accent blue #13385c (19,56,92,1) -> burgundy ---
    $content = $content.Replace('.tpmmCb .zfr3Q{color: rgba(19,56,92,1);}', '.tpmmCb .zfr3Q{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.tpmmCb .zfr3Q .OUGEr{color: rgba(19,56,92,1);}', '.tpmmCb .zfr3Q .OUGEr{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.tpmmCb .qnVSj{color: rgba(19,56,92,1);}', '.tpmmCb .qnVSj{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.tpmmCb .Glwbz{color: rgba(19,56,92,1);}', '.tpmmCb .Glwbz{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.tpmmCb .qLrapd{color: rgba(19,56,92,1);}', '.tpmmCb .qLrapd{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.tpmmCb .aHM7ed{color: rgba(19,56,92,1);}', '.tpmmCb .aHM7ed{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.tpmmCb .NHD4Gf{color: rgba(19,56,92,1);}', '.tpmmCb .NHD4Gf{color: rgba(94,28,42,1);}')
    $content = $content.Replace('.tpmmCb .lkHyyc:before{border-color: rgba(19,56,92,1); display: block;}', '.tpmmCb .lkHyyc:before{border-color: rgba(94,28,42,1); display: block;}')
    $content = $content.Replace('.tpmmCb .Wew9ke{fill: rgba(19,56,92,1);}', '.tpmmCb .Wew9ke{fill: rgba(94,28,42,1);}')

    # --- Old navy #1f3850 (31,56,80,1) -> burgundy ---
    $content = $content.Replace('.xkUom{border-color: rgba(31,56,80,1); color: rgba(31,56,80,1);', '.xkUom{border-color: rgba(94,28,42,1); color: rgba(94,28,42,1);')
    $content = $content.Replace('.xkUom:hover{background-color: rgba(31,56,80,0.1000000015);}', '.xkUom:hover{background-color: rgba(94,28,42,0.1000000015);}')
    $content = $content.Replace('.KjwKmc{color: rgba(31,56,80,1);', '.KjwKmc{color: rgba(94,28,42,1);')
    $content = $content.Replace('.KjwKmc:hover{background-color: rgba(31,56,80,0.1000000015);}', '.KjwKmc:hover{background-color: rgba(94,28,42,0.1000000015);}')
    $content = $content.Replace('.tpmmCb .xkUom{border-color: rgba(31,56,80,1); color: rgba(31,56,80,1);', '.tpmmCb .xkUom{border-color: rgba(94,28,42,1); color: rgba(94,28,42,1);')
    $content = $content.Replace('.tpmmCb .xkUom:hover{background-color: rgba(31,56,80,0.1000000015);}', '.tpmmCb .xkUom:hover{background-color: rgba(94,28,42,0.1000000015);}')
    $content = $content.Replace('.tpmmCb .KjwKmc{color: rgba(31,56,80,1);', '.tpmmCb .KjwKmc{color: rgba(94,28,42,1);')
    $content = $content.Replace('.tpmmCb .KjwKmc:hover{background-color: rgba(31,56,80,0.1000000015);}', '.tpmmCb .KjwKmc:hover{background-color: rgba(94,28,42,0.1000000015);}')
    $content = $content.Replace('.gk8rDe .xkUom{border-color: rgba(31,56,80,1); color: rgba(31,56,80,1);', '.gk8rDe .xkUom{border-color: rgba(94,28,42,1); color: rgba(94,28,42,1);')
    $content = $content.Replace('.gk8rDe .xkUom:hover{background-color: rgba(31,56,80,0.1000000015);}', '.gk8rDe .xkUom:hover{background-color: rgba(94,28,42,0.1000000015);}')
    $content = $content.Replace('.gk8rDe .KjwKmc{color: rgba(31,56,80,1);', '.gk8rDe .KjwKmc{color: rgba(94,28,42,1);')
    $content = $content.Replace('.gk8rDe .KjwKmc:hover{background-color: rgba(31,56,80,0.1000000015);}', '.gk8rDe .KjwKmc:hover{background-color: rgba(94,28,42,0.1000000015);}')

    # --- Old dark bg #1b1b1b (27,27,27,1) -> dark brown ---
    $content = $content.Replace('.zDUgLc{background-color: rgba(27,27,27,1);}', '.zDUgLc{background-color: rgba(44,24,16,1);}')
    $content = $content.Replace('.eWDljc{background-color: rgba(27,27,27,1);}', '.eWDljc{background-color: rgba(44,24,16,1);}')
    $content = $content.Replace('.wgxiMe{background-color: rgba(27,27,27,1);}', '.wgxiMe{background-color: rgba(44,24,16,1);}')
    $content = $content.Replace('.eBSUbc{background-color: rgba(27,27,27,1);', '.eBSUbc{background-color: rgba(44,24,16,1);')
    $content = $content.Replace('.JzO0Vc{background-color: rgba(27,27,27,1);', '.JzO0Vc{background-color: rgba(44,24,16,1);')

    # --- Old blue accent #223e5a (34,62,90,1) -> burgundy ---
    $content = $content.Replace('.lhZOrc{background-color: rgba(34,62,90,1);', '.lhZOrc{background-color: rgba(94,28,42,1);')

    # --- Old warm gray (225,223,219,1) - text on dark -> cream; bg/border -> gold ---
    # Background-color -> gold
    $content = $content.Replace('.Vs12Bd{background-color: rgba(225,223,219,1);', '.Vs12Bd{background-color: rgba(229,213,181,1);')
    $content = $content.Replace('.CMArNe{background-color: rgba(225,223,219,1);}', '.CMArNe{background-color: rgba(229,213,181,1);}')
    $content = $content.Replace('.fOU46b .a3ETed .KJll8d{background-color: rgba(225,223,219,1);}', '.fOU46b .a3ETed .KJll8d{background-color: rgba(229,213,181,1);}')
    $content = $content.Replace('.fOU46b .a3ETed .iWs3gf.chg4Jd:focus{background-color: rgba(225,223,219,0.1199999973);}', '.fOU46b .a3ETed .iWs3gf.chg4Jd:focus{background-color: rgba(229,213,181,0.1199999973);}')
    
    # Fill -> gold
    $content = $content.Replace('.Wew9ke{fill: rgba(225,223,219,1);}', '.Wew9ke{fill: rgba(229,213,181,1);}')
    
    # Color on dark sections -> cream
    $content = $content.Replace('.lhZOrc{background-color: rgba(34,62,90,1); color: rgba(225,223,219,1);', '.lhZOrc{background-color: rgba(94,28,42,1); color: rgba(253,247,237,1);')
    $content = $content.Replace('.M9vuGd{color: rgba(225,223,219,1);', '.M9vuGd{color: rgba(253,247,237,1);')
    $content = $content.Replace('.S5d9Rd{background-color: rgba(94,28,42,1); color: rgba(225,223,219,1);}', '.S5d9Rd{background-color: rgba(94,28,42,1); color: rgba(253,247,237,1);}')
    $content = $content.Replace('.BFDQOb:hover{color: rgba(225,223,219,1);}', '.BFDQOb:hover{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.lhZOrc.IKA38e{color: rgba(225,223,219,1);}', '.lhZOrc.IKA38e{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.lhZOrc.IKA38e .hDrhEe:hover{color: rgba(255,255,255,1);}', '.lhZOrc.IKA38e .hDrhEe:hover{color: rgba(253,247,237,1);}')
    
    # Navigation sub-section colors (a3ETed is default dark section) - text -> cream
    $content = $content.Replace('.fOU46b .a3ETed .qV4dIc{color: rgba(225,223,219,1);}', '.fOU46b .a3ETed .qV4dIc{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.fOU46b .a3ETed .TlfmSc{color: rgba(225,223,219,1);}', '.fOU46b .a3ETed .TlfmSc{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.fOU46b .a3ETed .ZXW7w{color: rgba(225,223,219,1);}', '.fOU46b .a3ETed .ZXW7w{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.fOU46b .a3ETed .jgXgSe:hover{color: rgba(225,223,219,1); opacity: 0.82;}', '.fOU46b .a3ETed .jgXgSe:hover{color: rgba(253,247,237,1); opacity: 0.82;}')
    $content = $content.Replace('.fOU46b .a3ETed .Mz8gvb{color: rgba(225,223,219,1);}', '.fOU46b .a3ETed .Mz8gvb{color: rgba(253,247,237,1);}')
    $content = $content.Replace('.fOU46b .a3ETed .tCHXDc{color: rgba(225,223,219,1);}', '.fOU46b .a3ETed .tCHXDc{color: rgba(253,247,237,1);}')
    
    # Border color in buttons -> gold
    $content = $content.Replace('border-color: rgba(225,223,219,1);', 'border-color: rgba(229,213,181,1);')
    
    # Generic color on dark (remaining cases) -> cream
    $content = $content.Replace('color: rgba(225,223,219,1);', 'color: rgba(253,247,237,1);')
    
    # --- Header/nav muted beige #c0bdb8 (192,189,184,1) -> gold ---
    $content = $content.Replace('.Zjiec{color: rgba(192,189,184,1);', '.Zjiec{color: rgba(229,213,181,1);')
    $content = $content.Replace('.YTv4We{color: rgba(192,189,184,1);}', '.YTv4We{color: rgba(229,213,181,1);}')

    # --- Header/nav gray #bdbdbd (189,189,189,1) -> gold ---
    $content = $content.Replace('.ZXW7w{color: rgba(189,189,189,1);', '.ZXW7w{color: rgba(229,213,181,1);')
    $content = $content.Replace('.PsKE7e{color: rgba(189,189,189,1);', '.PsKE7e{color: rgba(229,213,181,1);')
    $content = $content.Replace('.tCHXDc{color: rgba(189,189,189,1);}', '.tCHXDc{color: rgba(229,213,181,1);}')
    $content = $content.Replace('.iWs3gf.chg4Jd:focus{background-color: rgba(189,189,189,0.1199999973);}', '.iWs3gf.chg4Jd:focus{background-color: rgba(229,213,181,0.1199999973);}')

    # --- Old border #ccc (204,204,204,1) -> gold ---
    $content = $content.Replace('border-bottom-color: rgba(204,204,204,1);', 'border-bottom-color: rgba(229,213,181,1);')

    # --- Old teal focus rgba(48,255,255,0.0599999987) -> gold focus ---
    $content = $content.Replace('background-color: rgba(48,255,255,0.0599999987);', 'background-color: rgba(229,213,181,0.0599999987);')

    # --- Sidebar dark text (0,0,0,0.8000000119) -> dark brown ---
    $content = $content.Replace('color: rgba(0,0,0,0.8000000119);', 'color: rgba(44,24,16,0.8000000119);')
    $content = $content.Replace('background-color: rgba(0,0,0,0.8000000119);', 'background-color: rgba(44,24,16,0.8000000119);')

    # --- Sidebar muted text (0,0,0,0.6399999857) -> dark brown muted ---
    $content = $content.Replace('color: rgba(0,0,0,0.6399999857);', 'color: rgba(44,24,16,0.6399999857);')

    # --- Sidebar hover text (0,0,0,0.8199999928) -> dark brown ---
    $content = $content.Replace('color: rgba(0,0,0,0.8199999928);', 'color: rgba(44,24,16,0.8199999928);')

    # --- Sidebar hover bg (0,0,0,0.1199999973) -> dark brown hover bg ---
    $content = $content.Replace('background-color: rgba(0,0,0,0.1199999973);', 'background-color: rgba(44,24,16,0.1199999973);')

    # --- Old white text on dark with opacity (255,255,255,0.8700000048) -> cream ---
    $content = $content.Replace('color: rgba(255,255,255,0.8700000048);', 'color: rgba(253,247,237,0.8700000048);')

    # --- Old white text on dark with 0.6999 (255,255,255,0.6999999881) -> cream ---
    $content = $content.Replace('color: rgba(255,255,255,0.6999999881);', 'color: rgba(253,247,237,0.6999999881);')

    # --- Dark section button hover bg (255,255,255,0.1000000015) -> cream ---
    $content = $content.Replace('background-color: rgba(255,255,255,0.1000000015);', 'background-color: rgba(253,247,237,0.1000000015);')

    # --- Dark section sidebar hover bg (255,255,255,0.1199999973) -> cream ---
    $content = $content.Replace('background-color: rgba(255,255,255,0.1199999973);', 'background-color: rgba(253,247,237,0.1199999973);')

    # --- Dark section border/focus (255,255,255,0.3600000143) -> cream ---
    $content = $content.Replace('border-color: rgba(255,255,255,0.3600000143);', 'border-color: rgba(253,247,237,0.3600000143);')

    # --- Dark section button border (255,255,255,0.200000003) -> cream ---
    $content = $content.Replace('border-color: rgba(255,255,255,0.200000003);', 'border-color: rgba(253,247,237,0.200000003);')

    # --- White bg inside dark sections (lQAHbd .CbiMKe) -> cream ---
    $content = $content.Replace('.lQAHbd .CbiMKe{background-color: rgba(255,255,255,1);}', '.lQAHbd .CbiMKe{background-color: rgba(253,247,237,1);}')

    # --- Write changes if any ---
    if ($content -ne $original) {
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.UTF8Encoding]::new($false))
        Write-Host "  -> Updated" -ForegroundColor Green
        $totalChanges++
    } else {
        Write-Host "  -> No changes needed" -ForegroundColor Yellow
    }
}

Write-Host "`nPass 2 complete! $totalChanges files updated." -ForegroundColor Cyan
