@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Standard Custom Bill Plan Items'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IM_StdBillPlanItem
  as select from    I_CustProjSlsOrdItmBillgPlnItm as bp
  left outer join I_EnterpriseProject as _EnterpriseProject on _EnterpriseProject.Project = bp.CustomerProject
    left outer join ZR_TCLP_BILLPLANIT               as z on  z.Linkedbillingplan     = bp.BillingPlan
                                                        and z.Linkedbillingplanitem = bp.BillingPlanItem
                                                        and z.Linkedsalesorderitem  = bp.SalesOrderItem
                                                        and z.Linkedcustomerproject = bp.CustomerProject
{
  key bp.CustomerProject,
  key bp.SalesOrderItem,
  key bp.BillingPlan,
  key bp.BillingPlanItem,

      bp.SalesOrder,
      bp.BillingPlanBillingDate,
      bp.BillingPlanRelatedBillgStatus,
      bp.TransactionCurrency,


      @Semantics.amount.currencyCode: 'TransactionCurrency'
      bp.BillingPlanAmount         as ProfessionalFee,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      cast( 0 as abap.curr(15,2) ) as Expenses,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      cast(
            ( cast( _EnterpriseProject.YY1_AdminChargePerc_Cpr as abap.dec(15,2) ) / 100 )
          * cast( bp.BillingPlanAmount as abap.dec(15,2) )
          as abap.curr(15,2)
        ) as AdminFee,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      cast( 0 as abap.curr(15,2) ) as CourtesyDiscount
}
where
  z.Billingplan is null
