@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing Document Summary by Material Group'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZI_CLP_BillingDocSumByMatGrp
  with parameters
    p_matgrp          : matkl
  as select from I_BillingDocumentItemBasic
{
    key BillingDocument,
    @Semantics.amount.currencyCode: 'TransactionCurrency'
    sum(NetAmount) as TotalAmount,
    TransactionCurrency
}
where
    ProductGroup = $parameters.p_matgrp
group by
    BillingDocument,
    TransactionCurrency



    
//define view entity ZI_CLP_BillingDocSumByMatGrp
//  with parameters
//    p_matgrp          : matkl,
//    @Consumption.defaultValue: ''
//    p_manualexp_flag  : abap.char(1)
//  as select from I_BillingDocumentItemBasic
//{
//    key BillingDocument,
//    @Semantics.amount.currencyCode: 'TransactionCurrency'
//    sum(NetAmount) as TotalAmount,
//    TransactionCurrency
//}
//where
//    ProductGroup = $parameters.p_matgrp
//    and (
//        $parameters.p_manualexp_flag = 'X' and YY1_CLPManualExpensesX_BDI = 'X' or
//        $parameters.p_manualexp_flag = ''  and (YY1_CLPManualExpensesX_BDI is initial or YY1_CLPManualExpensesX_BDI <> 'X')
//    )
//group by
//    BillingDocument,
//    TransactionCurrency
