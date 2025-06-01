@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_TCLP_INVTRACK
  provider contract transactional_query
  as projection on ZR_TCLP_INVTRACK
{
  key SapUuid,
  ProjBillgElmntEntrItmUuid,
  ProjectBillingElementUuid,
  WbsElementInternalId,
  Project,
  ProjectBillingRequestUuid,
  Pbr,
  Bdr,
  Pbd,
  Invoice,
  PbrStatus,
  BdrStatus,
  PbdStatus,
  InvoiceStatus,
  CreatedBy,
  CreatedOn,
  LastChangedBy,
  LastChangedOn,
  LocalLastChanged
  
}
