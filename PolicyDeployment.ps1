$subscriptions = Get-AzureRmSubscription
foreach ($subscription in $subscriptions) {


    Set-AzureRmContext -SubscriptionObject $subscription

    $purposePolicy = New-AzureRmPolicyDefinition -Name "Enforce Purpose Tag is Present" -Description "Enforce Purpose Tag" -DisplayName "Enforce Purpose Tag is Present" -Policy 'https://raw.githubusercontent.com/ManojNair/azurepolicy/master/purpose.json' -Mode All
    $departmentPolicy = New-AzureRmPolicyDefinition -Name "Enforce Department Tag is Present" -Description "Enforce Department Tag" -DisplayName "Enforce Purpose Tag is Present" -Policy 'https://raw.githubusercontent.com/ManojNair/azurepolicy/master/purpose.json' -Mode All

    New-AzureRmPolicyAssignment -Name "Enforce Purpose is Present" -Scope "/subscriptions/$($subscription.Id)/" -DisplayName "Enforce Purpose Tag is Present" -PolicyDefinition $purposePolicy -Sku @{Name = 'A1'; Tier = 'Standard'} -Description "Enforce Purpose Tag is Present" -Verbose
    New-AzureRmPolicyAssignment -Name "Enforce Department is Present" -Scope "/subscriptions/$($subscription.Id)/" -DisplayName "Enforce Department Tag is Present" -PolicyDefinition $departmentPolicy -Sku @{Name = 'A1'; Tier = 'Standard'} -Description "Enforce Department Tag is Present" -Verbose
    


}   
 
    


 