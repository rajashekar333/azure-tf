
RESOURCE_GROUP=$1
DISK=$2
NEW_SIZE=$3
MYVM=$4

if [ $# -ne 4 ] ; then
	echo " Usage:$0 ResourceGroup DiskName NewDiskSize VMName"
        echo " Usage: $0 rg-secure-hyena first-extra-disk 18 myVM"
	exit
fi

az disk list \
 --resource-group  $RESOURCE_GROUP \
 --query '[*].{Name:name,Gb:diskSizeGb,Tier:accountType}' \
 --output table

az vm deallocate --resource-group $RESOURCE_GROUP --name $MYVM

echo ">>>>> Deallocation is Completed"

az disk update \
    --resource-group $RESOURCE_GROUP \
    --name $DISK \
    --size-gb $NEW_SIZE

echo ">>>> Disk has been Updated to $NEW_SIZE GB"

az vm start --resource-group $RESOURCE_GROUP --name $MYVM

echo ">>>>> $MYVM has been started"

