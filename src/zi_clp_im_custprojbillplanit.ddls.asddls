@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custom Project Bill Plan Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IM_CustProjBillPlanIt
  as select from ZI_CLP_IM_CustBillPlanItLink
{
  key CustomerProject,
  key SalesOrderItem,
  key BillingPlan,
  key BillingPlanItem,

      SalesOrder,
      BillingPlanBillingDate,
      BillingPlanRelatedBillgStatus,
      TransactionCurrency,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ProfessionalFee,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      AdminFee,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      Expenses,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      CourtesyDiscount
}
union select from ZI_CLP_IM_StdBillPlanItem
{
  key CustomerProject,
  key SalesOrderItem,
  key BillingPlan,
  key BillingPlanItem,

      SalesOrder,
      BillingPlanBillingDate,
      BillingPlanRelatedBillgStatus,
      TransactionCurrency,

      ProfessionalFee,
      AdminFee,
      Expenses,
      CourtesyDiscount
}
//  as select from    I_CustProjSlsOrdItmBillgPlnItm as bp
//
//    left outer join ZR_TCLP_BILLPLANIT             as z on  z.Linkedbillingplan     = bp.BillingPlan
//                                                        and z.Linkedbillingplanitem = bp.BillingPlanItem
//                                                        and z.Linkedsalesorderitem  = bp.SalesOrderItem
//                                                        and z.Linkedcustomerproject = bp.CustomerProject
//
//{
//  key bp.CustomerProject,
//  key bp.SalesOrderItem,
//  key bp.BillingPlan,
//  key bp.BillingPlanItem,
//
//      bp.SalesOrder,
//      bp.BillingPlanItemUsage                                    as BillingPlanUsageCategory,
//      bp.BillingPlanBillingDate,
//      bp.BillingPlanRelatedBillgStatus,
//
//      // If z-entry exists and type = 'E' → it's Expenses
//      // Otherwise (including no z-entry) → it's Professional Fee
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      case
//        when z.Billingplanitemtype = 'E' then cast( 0 as abap.curr(15,2) )
//        else bp.BillingPlanAmount
//      end                                                        as BillingPlanAmount,
//
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      case
//        when z.Billingplanitemtype = 'E' then bp.BillingPlanAmount
//        else cast( 0 as abap.curr(15,2) )
//      end                                                        as Expenses,
//
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      coalesce(z.Adminfee,         cast( 0 as abap.curr(15,2) )) as AdminFees,
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      coalesce(z.Courtesydiscount, cast( 0 as abap.curr(15,2) )) as CourtesyDiscount,
//
//      bp.TransactionCurrency
//}
//  as select from    ZR_TCLP_BILLPLANIT               as z
//    left outer join I_CustProjSlsOrdItmBillgPlnItm as bp on  bp.BillingPlan     = z.Linkedbillingplan
//                                                         and bp.BillingPlanItem = z.Linkedbillingplanitem
//                                                         and bp.SalesOrderItem  = z.Linkedsalesorderitem
//                                                         and bp.CustomerProject = z.Linkedcustomerproject
//{
//  key z.Customerproject,
//  key z.Salesorderitem,
//  key z.Billingplan,
//  key z.Billingplanitem,
//
//      bp.SalesOrder,
//      bp.BillingPlanBillingDate,
//      bp.BillingPlanRelatedBillgStatus,
//      bp.TransactionCurrency,
//
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      case
//        when z.Billingplanitemtype = 'P' then coalesce(bp.BillingPlanAmount, cast(0 as abap.curr(15,2)))
//        else cast(0 as abap.curr(15,2))
//      end                                                      as ProfessionalFee,
//
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      case
//        when z.Billingplanitemtype = 'E' then coalesce(bp.BillingPlanAmount, cast(0 as abap.curr(15,2)))
//        else cast(0 as abap.curr(15,2))
//      end                                                      as Expenses,
//
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      coalesce(z.Adminfee, cast(0 as abap.curr(15,2)))         as AdminFee,
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      coalesce(z.Courtesydiscount, cast(0 as abap.curr(15,2))) as CourtesyDiscount
//}
