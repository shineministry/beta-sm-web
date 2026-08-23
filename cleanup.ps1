# Fix - Remove all broken injections and re-inject properly
$basePath = "C:\Users\My PC\Downloads\apps - Copy"

$htmlFiles = Get-ChildItem -Path $basePath -Filter "*.html"

$count = 0
foreach ($file in $htmlFiles) {
    $count++
    Write-Host "Processing ($count/$($htmlFiles.Count)): $($file.Name)"
    
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    # Step 1: Remove ALL previously injected style blocks
    # Remove iOS Navigation Sidebar CSS
    $content = $content -replace '(?s)<!-- iOS Navigation Sidebar -->.*?</nav>',''
    # Remove iOS CSS blocks
    $content = $content -replace '(?s)/\* === iOS Navigation Sidebar ===.*?</style>',''
    $content = $content -replace '(?s)/\* === iOS Footer ===.*?</style>',''
    $content = $content -replace '(?s)/\* === iOS Content Override ===.*?</style>',''
    $content = $content -replace '(?s)/\* === Hide Old Google Sites Navigation ===.*?</style>',''
    $content = $content -replace '(?s)/\* === Safe Targeted Fixes ===.*?</style>',''
    # Remove any stray injected style blocks that contain iOS classes
    $content = $content -replace '(?s)<style>[^<]*ios-nav[^<]*</style>',''
    $content = $content -replace '(?s)<style>[^<]*ios-footer[^<]*</style>',''
    $content = $content -replace '(?s)<style>[^<]*ios-menu[^<]*</style>',''
    $content = $content -replace '(?s)<style>[^<]*scroll-top[^<]*</style>',''
    
    # Step 2: Remove ALL previously injected scripts
    # Remove iOS menu button script
    $content = $content -replace '(?s)<script>\(function\(\)\{var btn=document\.createElement\(\"button\"\).*?</script>',''
    # Remove sidebar nav script
    $content = $content -replace '(function\(\)\{var menuBtn=document\.getElementById\(\"menuBtn\"\).*?ios-nav-sidebar-link.*?\}\)\(\);?',''
    # Remove typewriter script (will re-add)
    $content = $content -replace '(?s)/\* Typewriter Effect \*/.*?if\(el\)tick\(\);\}\)\(\);?',''
    # Remove scroll effects (will re-add)
    $content = $content -replace '(?s)/\* Scroll effects \*/.*?btn\.classList\.toggle\(\"visible\",y>400\).*?\}\)\(\);?',''
    # Remove Safe Targeted Fixes script
    $content = $content -replace '(?s)<script>\(function\(\)\{.*?// Only hide specific old navigation elements.*?</script>',''
    # Remove any other iOS scripts
    $content = $content -replace '(?s)<script>\(function\(\)\{.*?ios-nav-sidebar-link.*?</script>',''
    
    # Step 3: Remove injected HTML
    # Remove iOS nav overlay and sidebar HTML
    $content = $content -replace '(?s)<!-- iOS Navigation Sidebar -->.*?</nav>',''
    # Remove iOS footer HTML  
    $content = $content -replace '(?s)<!-- iOS Footer -->.*?<!-- Scroll to Top -->',''
    # Remove old scroll-to-top divs
    $content = $content -replace '<div class="scroll-top"[^>]*>.*?</div>',''
    
    # Step 4: Clean up empty lines left behind
    $content = $content -replace '(\r?\n){3,}', "`n`n"
    
    # Write back cleaned file
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
    
    Write-Host "  -> Cleaned!"
}

Write-Host "`nAll $count pages cleaned of broken injections!"