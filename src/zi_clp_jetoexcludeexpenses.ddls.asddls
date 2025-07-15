@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Journal Entries to exclude from Expenses'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_JEToExcludeExpenses as
select from ZI_CLP_JEItemReferences
{
    key AccountingDocument,
    key AccountAssignment,
    IsReferenced
}where IsReferenced = 'X'
group by AccountingDocument,AccountAssignment,IsReferenced


