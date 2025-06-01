@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Linked Custom Bill Plan Items'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IM_CustBillPlanItLink
  as select from    ztclp_billplanit               as zp
    left outer join ztclp_billplanit               as ze   on  ze.customerproject     = zp.linkedcustomerproject
                                                           and ze.salesorderitem      = zp.linkedsalesorderitem
                                                           and ze.billingplan         = zp.linkedbillingplan
                                                           and ze.billingplanitem     = zp.linkedbillingplanitem
                                                           and ze.billingplanitemtype = 'E'

    left outer join I_CustProjSlsOrdItmBillgPlnItm as bp_p on  bp_p.BillingPlan     = zp.billingplan
                                                           and bp_p.BillingPlanItem = zp.billingplanitem

    left outer join I_CustProjSlsOrdItmBillgPlnItm as bp_e on  bp_e.BillingPlan     = ze.billingplan
                                                           and bp_e.BillingPlanItem = ze.billingplanitem

{
  key zp.customerproject                                                                       as CustomerProject,
  key zp.salesorderitem                                                                        as SalesOrderItem,
  key zp.billingplan                                                                           as BillingPlan,
  key zp.billingplanitem                                                                       as BillingPlanItem,

      bp_p.SalesOrder,

      coalesce(bp_p.TransactionCurrency, bp_e.TransactionCurrency)                             as TransactionCurrency,

      coalesce(bp_p.BillingPlanBillingDate, bp_e.BillingPlanBillingDate)                       as BillingPlanBillingDate,

      coalesce(bp_p.BillingPlanRelatedBillgStatus, bp_e.BillingPlanRelatedBillgStatus)         as BillingPlanRelatedBillgStatus,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      coalesce(bp_p.BillingPlanAmount, cast(0 as abap.curr(15,2)))                             as ProfessionalFee,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      coalesce(bp_e.BillingPlanAmount, cast(0 as abap.curr(15,2)))                             as Expenses,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      coalesce(zp.adminfee, coalesce(ze.adminfee, cast(0 as abap.curr(15,2))))                 as AdminFee,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      coalesce(zp.courtesydiscount, coalesce(ze.courtesydiscount, cast(0 as abap.curr(15,2)))) as CourtesyDiscount
} where zp.billingplanitemtype = 'P'

union

select from       ztclp_billplanit               as ze
  left outer join ztclp_billplanit               as zp   on  zp.customerproject     = ze.linkedcustomerproject
                                                         and zp.salesorderitem      = ze.linkedsalesorderitem
                                                         and zp.billingplan         = ze.linkedbillingplan
                                                         and zp.billingplanitem     = ze.linkedbillingplanitem
                                                         and zp.billingplanitemtype = 'P'

  left outer join I_CustProjSlsOrdItmBillgPlnItm as bp_e on  bp_e.BillingPlan     = ze.billingplan
                                                         and bp_e.BillingPlanItem = ze.billingplanitem

  left outer join I_CustProjSlsOrdItmBillgPlnItm as bp_p on  bp_p.BillingPlan     = zp.billingplan
                                                         and bp_p.BillingPlanItem = zp.billingplanitem

{
  key ze.customerproject                                                                       as CustomerProject,
  key ze.salesorderitem                                                                        as SalesOrderItem,
  key ze.billingplan                                                                           as BillingPlan,
  key ze.billingplanitem                                                                       as BillingPlanItem,

      bp_p.SalesOrder,

      coalesce(bp_p.TransactionCurrency, bp_e.TransactionCurrency)                             as TransactionCurrency,

      coalesce(bp_p.BillingPlanBillingDate, bp_e.BillingPlanBillingDate)                       as BillingPlanBillingDate,

      coalesce(bp_p.BillingPlanRelatedBillgStatus, bp_e.BillingPlanRelatedBillgStatus)         as BillingPlanRelatedBillgStatus,

      coalesce(bp_p.BillingPlanAmount, cast(0 as abap.curr(15,2)))                             as ProfessionalFee,

      coalesce(bp_e.BillingPlanAmount, cast(0 as abap.curr(15,2)))                             as Expenses,

      coalesce(zp.adminfee, coalesce(ze.adminfee, cast(0 as abap.curr(15,2))))                 as AdminFee,

      coalesce(zp.courtesydiscount, coalesce(ze.courtesydiscount, cast(0 as abap.curr(15,2)))) as CourtesyDiscount
}
where ze.billingplanitemtype = 'E'
and zp.customerproject is null
