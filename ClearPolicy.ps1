$subscriptions = Get-AzureRmSubscription
foreach ($subscription in $subscriptions) {


    Set-AzureRmContext -SubscriptionObject $subscription

    Get-AzureRmPolicyAssignment | ForEach-Object { Remove-AzureRmPolicyAssignment -Name $PSItem.Name -Scope "/subscriptions/$($subscription.Id)" }
    


}   
 