echo "Do not run this directly"
exit

## Take the backup of the existing tfstate

cp terraform.tfstate terraform.tfstate.`date +'%Y%m%d-%H%M'`

## Remove the state for the disk that was updated

terraform state rm azurerm_managed_disk.example_disk

## Import the state for that disk

terraform import  azurerm_managed_disk.example_disk /subscriptions/45f84c58-1880-4d26-81fd-3817bd11bc77/resourceGroups/rg-secure-hyena/providers/Microsoft.Compute/disks/first-extra-disk

