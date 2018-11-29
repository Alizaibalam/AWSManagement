
$data = import-csv C:\temp\sgupdate.csv

Foreach ( $value in $data )

{

    write-host " Adding Rule to security Group:" $Value.GroupID3 "using for subnet:" $value.subnetFUll -ForegroundColor Yellow

 
    $IpRange = New-Object -TypeName Amazon.EC2.Model.IpRange
    $IpRange.CidrIp = $value.SubnetFULL
    $IpRange.Description = "Peter Daffern"

    $IpPermission = New-Object Amazon.EC2.Model.IpPermission
    $IpPermission.IpProtocol = "tcp"
    $IpPermission.ToPort = 1443
    $IpPermission.FromPort = 1443
    $IpPermission.Ipv4Ranges = $IpRange
    
    write-host "Working on IP "$IpRange.CidrIp
    
    Grant-EC2SecurityGroupIngress -GroupId $value.GroupID1 -IpPermission $IpPermission
    write-host " Done Adding rules to Security Group:" $value.GroupID1 -ForegroundColor Green
   
    Grant-EC2SecurityGroupIngress -GroupId $value.GroupID2 -IpPermission $IpPermission
    write-host " Done Adding rules to Security Group:" $value.GroupID2 -ForegroundColor Green
    
    Grant-EC2SecurityGroupIngress -GroupId $value.GroupID3 -IpPermission $IpPermission
    write-host " Done Adding rules to Security Group:" $value.GroupID3 -ForegroundColor Green
   
    #Grant-EC2SecurityGroupIngress -GroupId $value.GroupID -IpPermission $IpPermission2

}
