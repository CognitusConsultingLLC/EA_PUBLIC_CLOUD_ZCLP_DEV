@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'JE item max Ts'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_JEItemMaxTs as 
select from ZI_CLP_JEItemReferences
{
    key AccountingDocument,
    key LedgerGLLineItem,

    max(T_Count) as MaxTsCount
}where T_Count > 0
group by AccountingDocument,LedgerGLLineItem
