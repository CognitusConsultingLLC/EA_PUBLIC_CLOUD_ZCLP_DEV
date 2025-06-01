@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Linked Custom Bill Plan keys'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_BillPlan_LinkKeys
  as select from ztclp_billplanit
{
  key  linkedcustomerproject,
  key  linkedsalesorderitem,
  key  linkedbillingplan,
  key  linkedbillingplanitem
}
group by
  linkedcustomerproject,
  linkedsalesorderitem,
  linkedbillingplan,
  linkedbillingplanitem
