@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing Document Summary by Product Group'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//define view entity ZI_CLP_BillingDocSumByProdGrp 
//  as select from I_BillingDocumentItemBasic
//{
//    key BillingDocument,
//    key concat( ProductGroup, coalesce(YY1_CLPManualExpensesX_BDI,'','E')) as ProductGroup,
//    @Semantics.amount.currencyCode: 'TransactionCurrency'
//    sum(NetAmount) as TotalAmount,
//    TransactionCurrency
//}
//group by
//    BillingDocument,
//    ProductGroup,
//    YY1_CLPManualExpensesX_BDI,
//    TransactionCurrency

    define view entity ZI_CLP_BillingDocSumByProdGrp
  as select from I_BillingDocumentItemBasic
{
    key BillingDocument,

    key case 
        when ProductGroup = 'A001' and YY1_CLPManualExpensesX_BDI = 'X' 
            then 'P002'
        when ProductGroup = 'A001' and (YY1_CLPManualExpensesX_BDI is initial or YY1_CLPManualExpensesX_BDI = '') 
            then 'P001'
        else ProductGroup
    end as TransformedProductGroup,

    @Semantics.amount.currencyCode: 'TransactionCurrency'
    sum(NetAmount) as TotalAmount,

    TransactionCurrency
}
group by
    BillingDocument,
    ProductGroup,
    YY1_CLPManualExpensesX_BDI,
    TransactionCurrency
