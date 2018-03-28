$subscriptions = Get-AzureRmSubscription
foreach ($subscription in $subscriptions) {


    Set-AzureRmContext -SubscriptionObject $subscription

    Get-AzureRmResourceGroup | Remove-AzureRmResourceGroup -Force -Verbose    


}   
 