@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'JE item references check'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_JEItemReferences as
select from I_JournalEntryItem as A
    association [0..*] to I_JournalEntryItem as _Ref
        on _Ref.AssignmentReference = A.AccountingDocument
        and _Ref.AccountAssignment = A.AccountAssignment
{
    key A.AccountingDocument,
    key A.LedgerGLLineItem,
    A.AssignmentReference,
    A.AccountAssignment,
    A.YY1_ZAllocationKey_COB,

    length(A.YY1_ZAllocationKey_COB) - length(replace(A.YY1_ZAllocationKey_COB, 'T', '')) as T_Count,

    case
        when _Ref.AssignmentReference is not null then 'X'
        else ''
    end as IsReferenced
}
