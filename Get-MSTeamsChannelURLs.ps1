
<# #############################################################################
# 
# SCRIPT - POWERSHELL
# NAME: Get-MSTeamsChannelURLs.ps1
# DESCR: Get all Channel URLs from array of Teams
# 
# AUTHOR:  Brian Kimball
# DATE:  04/22/2022
# EMAIL: Brian.Kimball@Netwoven.com
# 
# COMMENT:  This script will use an array of MS Teams Display Names and loop through
# them and get the URLs of every channel in the Team. 
#
# VERSION HISTORY
# 1.0 04.22.2022 Initial Version.
# #############################################################################>


#Array of ME Teams
$MSTeams = @("Adopt 365",
            "my365org",
            "My Team",
            "Project XYZ")
  

#Only for non-MFA developer tenant
#$credentials=Get-Credential 
#$connectTeams=Connect-MicrosoftTeams -Credential $credentials  

# Connect to Microsoft Teams  
$connectTeams=Connect-MicrosoftTeams

# Get the tenant ID  
$tenantId=$connectTeams.TenantId 

#loop through each MS Team in the array
Foreach ($teamName in $MSTeams)
{

 $team = Get-Team -DisplayName $teamName 
 $teamChannels = $team |  Get-TeamChannel

    #loop through all channels of a Team
    Foreach($channel in $teamChannels)
    {
        # Get the channel ID
        $channelId=$channel.Id
    
        # Get the Team link  
        $teamLink= "https://teams.microsoft.com/l/team/"+$channelId+"/conversations?groupId="+$groupID+"&tenantId="+$tenantId;  
        
            #custom object to organize data to eport to CSV
            $info = [pscustomobject]@{
            "MS Team" = $teamName
            "Channel" = $channel.DisplayName
            "URL" = $teamLink
            }

            #Export to CSV
            $info | Export-Csv -notype  -path C:\Temp\URLs.CSV -Append -Encoding UTF8
    }
    
 }