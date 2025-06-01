@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing Docs with Single Material'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_BillingDocsWSingleMat 
as select from ZI_CLP_BillingDocMaterialAgg
{
    BillingDocument,
    min(Product) as Product  
}
group by BillingDocument
having count(*) = 1
