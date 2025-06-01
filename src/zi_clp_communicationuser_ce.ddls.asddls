@EndUserText.label: 'Communication Users'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_CLP_COMMUNICATIONUSER_CE'
define custom entity ZI_CLP_CommunicationUser_CE
  //  with parameters
  //    parameter_name : parameter_type
{
  key UserID      : aps_userid;
      UserName    : usalias;
      Description : abap.char(80); //aps_userdescription;
      //      usr02.uflag                                  as LockStatus,
      //      usr02.aname                                  as CreationUser,
      //      usr02.erdat                                  as CreationDate,
      //      usr02.class                                  as UserGroupName,
      //      usr02.trdat                                  as LastLogonDate,
      //      usr02.ltime                                  as LastLogonTime,
      //      usr02.usr_created_on_datetime                as CreationDateTime

}
