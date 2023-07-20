#Azure policySet inventory
$mgmtgroup = "Prod"
$pathInventory = "./$mgmtgroup.csv"

    #$AzPolicyDefinitions = Get-AzPolicySetDefinition -ManagementGroupName $mgmtgroup -Custom	-expand

    $AzPolicyDefinitions = Get-AzPolicyDefinition -ManagementGroupName $mgmtgroup -Custom
					
    foreach ($policy in $AzPolicyDefinitions)
    {
			    $Report += @(
				[pscustomobject]@{Management_Group = $mgmtgroup; Policy_Name = $policy.Name; Policy_DisplayName = $policy.Properties.DisplayName; Policy_Desciption = $policy.Properties.Description; Policy_Category = $policy.Properties.Metadata.Category; Policy_Type = $policy.Properties.PolicyType})
    }

$Report | Export-Csv -Path $pathInventory -NoTypeInformation
