@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing Doc + Material Aggregation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_BillingDocMaterialAgg 
  as select from I_BillingDocumentItemBasic
{
    BillingDocument,
    Product,
    count(*) as ItemCount
}where Product != 'ZADO'
 and Product != 'ZAD3'
 and Product != 'YB003'
group by BillingDocument, Product
