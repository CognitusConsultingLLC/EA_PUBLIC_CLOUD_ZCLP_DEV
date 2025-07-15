@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'New PBEE items'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_NEW_PBEE
  as select from    ZI_CLP_ProjectTimeEntry as _ProjectTimeEntry
    left outer join ZR_TCLP_WIP_RATE             as _wip_RATE on _wip_RATE.ProjBillgElmntEntrItmUuid = _ProjectTimeEntry.ProjBillgElmntEntrItmUUID
{
  key _ProjectTimeEntry.ProjBillgElmntEntrItmUUID,
  _ProjectTimeEntry.ProjectID,
  _ProjectTimeEntry.PersonnelNumber,
  _ProjectTimeEntry.ServicesRenderedDate,
  _ProjectTimeEntry.PricingDate,
  _ProjectTimeEntry.DocumentCurrency
  
}
where _ProjectTimeEntry.QuantityUnit = 'H' 
 and  _wip_RATE.ProjBillgElmntEntrItmUuid is null
