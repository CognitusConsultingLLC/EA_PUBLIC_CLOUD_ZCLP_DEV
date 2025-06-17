@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'LTD calculations'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_LTD_calculations
  as

  select from I_JournalEntryItem as I_JournalEntryItem
{
  key ProjectInternalID,
      //        key GLAccount,
  key cast('BilledAmount' as abap.char(20)) as GLType,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      sum(AmountInTransactionCurrency)      as TotalAmount,
      TransactionCurrency
}
where
       Ledger    = '0L'
  and(
       GLAccount = '0041007100'
    or GLAccount = '0041910000'
    or GLAccount = '0041912500'
    or GLAccount = '0041912501'
    or GLAccount = '0041915000'
    or GLAccount = '0044603100'
    or GLAccount = '0044603200'
    or GLAccount = '0041916000'
  )
//  and IsReversal = '' 
//  and IsReversed = '' 
group by
  ProjectInternalID,
  //        GLType,
  TransactionCurrency

union all

select from I_JournalEntryItem as I_JournalEntryItem
{
  key ProjectInternalID,
  key cast('LabourCosts' as abap.char(20)) as GLType,
      sum(AmountInTransactionCurrency)     as TotalAmount,
      TransactionCurrency
}
where
      Ledger    = '0L'
  and GLAccount = '0094308100'
//  and IsReversal = '' 
////  and IsReversed = '' 
group by
  ProjectInternalID,
  TransactionCurrency;
