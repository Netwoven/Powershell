<# #############################################################################
# 
# SCRIPT - POWERSHELL
# NAME: Set-SPOTheme.ps1
# DESCR: Create or overwite an custom theme
# 
# AUTHOR:  Brian Kimball
# DATE:  04/22/2022
# EMAIL: Brian.Kimball@Netwoven.com
# 
# COMMENT:  This script will create or overwite an custom theme that will be available for the whole Tenant.
#
#
# VERSION HISTORY
# 1.0 04.22.2022 Initial Version.
# #############################################################################>


$TenantDomain = "my365org"
$ThemeName = "Orange"

Connect-SPOService -Url "https://$TenantDomain-admin.sharepoint.com/"


# Create and get PS Array from Theme Designer https://fluentuipr.z22.web.core.windows.net/heads/master/theming-designer/index.html
$themepalette = @{
"themePrimary" = "#fa922a";
"themeLighterAlt" = "#fffbf6";
"themeLighter" = "#feeddc";
"themeLight" = "#fddebe";
"themeTertiary" = "#fcbd7e";
"themeSecondary" = "#fb9f44";
"themeDarkAlt" = "#e18426";
"themeDark" = "#be6f20";
"themeDarker" = "#8c5218";
"neutralLighterAlt" = "#faf9f8";
"neutralLighter" = "#f3f2f1";
"neutralLight" = "#edebe9";
"neutralQuaternaryAlt" = "#e1dfdd";
"neutralQuaternary" = "#d0d0d0";
"neutralTertiaryAlt" = "#c8c6c4";
"neutralTertiary" = "#a19f9d";
"neutralSecondary" = "#605e5c";
"neutralSecondaryAlt" = "#8a8886";
"neutralPrimaryAlt" = "#3b3a39";
"neutralPrimary" = "#323130";
"neutralDark" = "#201f1e";
"black" = "#000000";
"white" = "#ffffff";
}

# Documentation: https://docs.microsoft.com/en-us/powershell/module/sharepoint-online/add-spotheme?view=sharepoint-ps
Add-SPOTheme -Identity $ThemeName -Palette $themepalette -IsInverted $false -overwrite

#### Other useful commands

# Get all custom themes
# Get-SPOTheme

# Remove custom theme
# Remove-SPOTheme -Identity "Name of Theme"

# Hide All Default Themes
# Set-SPOHideDefaultThemes $true

# Show All Default Themes
# Set-SPOHideDefaultThemes $false