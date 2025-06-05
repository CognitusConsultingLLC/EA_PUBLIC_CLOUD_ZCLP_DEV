@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing Document Summary by Material Groups'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_BDocSum_MultiMatGrp
  as

  select from ZI_CLP_BillingDocSumByMatGrp( p_matgrp: 'P001' )
{
  key BillingDocument,
  key cast('P001' as matkl) as MaterialGroup,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      TotalAmount,
      coalesce(cast(TotalAmount as abap.dec(15,2)), 0) as TotalAmount,
      TransactionCurrency
}

union all

select from ZI_CLP_BillingDocSumByMatGrp( p_matgrp: 'P002' )
{
  key BillingDocument,
  key cast('P002' as matkl) as MaterialGroup,
//      TotalAmount,
      coalesce(cast(TotalAmount as abap.dec(15,2)), 0) as TotalAmount,
      TransactionCurrency
}

union all

select from ZI_CLP_BillingDocSumByMatGrp( p_matgrp: 'A001' )
{
  key BillingDocument,
  key cast('A001' as matkl) as MaterialGroup,
//      TotalAmount,
      coalesce(cast(TotalAmount as abap.dec(15,2)), 0) as TotalAmount,
      TransactionCurrency
}

union all

select from ZI_CLP_BillingDocSumByMatGrp( p_matgrp: 'A002' )
{
  key BillingDocument,
  key cast('A002' as matkl) as MaterialGroup,
//      TotalAmount,
      coalesce(cast(TotalAmount as abap.dec(15,2)), 0) as TotalAmount,
      TransactionCurrency
}

union all

select from ZI_CLP_BillingDocSumByMatGrp( p_matgrp: 'B001' )
{
  key BillingDocument,
  key cast('B001' as matkl) as MaterialGroup,
//      TotalAmount,
      coalesce(cast(TotalAmount as abap.dec(15,2)), 0) as TotalAmount,
      TransactionCurrency
}

union all

select from ZI_CLP_BillingDocSumByMatGrp( p_matgrp: 'B002' )
{
  key BillingDocument,
  key cast('B002' as matkl) as MaterialGroup,
//      TotalAmount,
      coalesce(cast(TotalAmount as abap.dec(15,2)), 0) as TotalAmount,
      TransactionCurrency
}
