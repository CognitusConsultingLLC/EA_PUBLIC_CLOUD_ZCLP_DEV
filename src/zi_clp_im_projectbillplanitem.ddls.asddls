@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Project Billing Plan Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IM_ProjectBillPlanItem
  as select from ZI_CLP_IM_CustProjBillPlanIt   as bp
    inner join   I_CustProjSlsOrdItmBillgPlnItm as I_CustProjSlsOrdItmBillgPlnItm on  I_CustProjSlsOrdItmBillgPlnItm.BillingPlan     = bp.billingplan
                                                                                  and I_CustProjSlsOrdItmBillgPlnItm.BillingPlanItem = bp.billingplanitem
                                                                                  and I_CustProjSlsOrdItmBillgPlnItm.BillingPlanItem = bp.billingplanitem
                                                                                  and I_CustProjSlsOrdItmBillgPlnItm.CustomerProject = bp.customerproject
  association [0..*] to I_PrjBlgElmEntrBillgPlnLink  as _I_PrjBlgElmEntrBillgPlnLink  on  _I_PrjBlgElmEntrBillgPlnLink.BillingPlan     = I_CustProjSlsOrdItmBillgPlnItm.BillingPlan
                                                                                      and _I_PrjBlgElmEntrBillgPlnLink.BillingPlanItem = I_CustProjSlsOrdItmBillgPlnItm.BillingPlanItem
  association [0..*] to I_CustProjSlsOrdItemWorkPckg as _I_CustProjSlsOrdItemWorkPckg on  _I_CustProjSlsOrdItemWorkPckg.CustomerProject = I_CustProjSlsOrdItmBillgPlnItm.CustomerProject
                                                                                      and _I_CustProjSlsOrdItemWorkPckg.SalesOrderItem  = I_CustProjSlsOrdItmBillgPlnItm.SalesOrderItem
                                                                                      and _I_CustProjSlsOrdItemWorkPckg.SalesOrder      = I_CustProjSlsOrdItmBillgPlnItm.SalesOrder
  association [0..1] to I_CustProjSlsOrdItemPartner  as _I_CustProjSlsOrdItemPartner  on  _I_CustProjSlsOrdItemPartner.CustomerProject = I_CustProjSlsOrdItmBillgPlnItm.CustomerProject
                                                                                      and _I_CustProjSlsOrdItemPartner.SalesOrderItem  = I_CustProjSlsOrdItmBillgPlnItm.SalesOrderItem
                                                                                      and _I_CustProjSlsOrdItemPartner.PartnerFunction = 'RE'
  association [0..1] to I_CustProjSlsOrdPartner      as _I_CustProjSlsOrdPartner      on  _I_CustProjSlsOrdPartner.CustomerProject = I_CustProjSlsOrdItmBillgPlnItm.CustomerProject
                                                                                      and _I_CustProjSlsOrdPartner.PartnerFunction = 'RE'

{
      @EndUserText.label: 'Customer Project ID'

  key I_CustProjSlsOrdItmBillgPlnItm.CustomerProject                                                                                                      as CustomerProject,

      @EndUserText.label: 'Item'

  key I_CustProjSlsOrdItmBillgPlnItm.SalesOrderItem                                                                                                       as SalesOrderItem,

      @EndUserText.label: 'Bill. Plan No.'


  key I_CustProjSlsOrdItmBillgPlnItm.BillingPlan                                                                                                          as BillingPlan,

      @EndUserText.label: 'Item'


  key I_CustProjSlsOrdItmBillgPlnItm.BillingPlanItem                                                                                                      as BillingPlanItem,

      @EndUserText.label: 'Sales Order'
      @ObjectModel.foreignKey.association: '_SalesOrder'


      I_CustProjSlsOrdItmBillgPlnItm.SalesOrder                                                                                                           as SalesOrder,

      @EndUserText.label: 'Billing Plan Us. Cat'
      @ObjectModel.foreignKey.association: '_BillingPlanUsageCategory'

      I_CustProjSlsOrdItmBillgPlnItm.BillingPlanUsageCategory                                                                                             as BillingPlanUsageCategory,

      @EndUserText.label: 'Billing Date'

      I_CustProjSlsOrdItmBillgPlnItm.BillingPlanBillingDate                                                                                               as BillingPlanBillingDate,

      @EndUserText.label: 'Billing Status'
      @ObjectModel.foreignKey.association: '_BillingPlanRelatedBillgStatus'

      I_CustProjSlsOrdItmBillgPlnItm.BillingPlanRelatedBillgStatus                                                                                        as BillingPlanRelatedBillgStatus,
      //
      //      @EndUserText.label: 'Billing Value'
      //      @Semantics.amount.currencyCode: 'TransactionCurrency'
      //
      //      I_CustProjSlsOrdItmBillgPlnItm.BillingPlanAmount                                                                                                    as BillingPlanAmount,
      //
      //      @EndUserText.label: 'Admin Fees'
      //      @Semantics.amount.currencyCode: 'TransactionCurrency'
      //      cast(BillingPlanAmount as abap.dec(16,2)) * cast( '0.05' as abap.dec(16,2) )                                                                        as AdminFees,
      //      @EndUserText.label: 'Expenses'
      //      @Semantics.amount.currencyCode: 'TransactionCurrency'
      //      cast( '0' as abap.dec(16,2) )                                                                                                                       as Expenses,
      //      @EndUserText.label: 'Courtesy Discount'
      //      @Semantics.amount.currencyCode: 'TransactionCurrency'
      //      cast( '0' as abap.dec(16,2) )                                                                                                                       as CourtesyDiscount,

      @EndUserText.label: 'Billing Value'
      @Semantics.amount.currencyCode: 'TransactionCurrency'

      bp.ProfessionalFee                                                                                                                                  as BillingPlanAmount,

      @EndUserText.label: 'Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      bp.AdminFee                                                                                                                                         as AdminFees,
      @EndUserText.label: 'Expenses'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      bp.Expenses                                                                                                                                         as Expenses,
      @EndUserText.label: 'Courtesy Discount'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      bp.CourtesyDiscount                                                                                                                                 as CourtesyDiscount,

      @EndUserText.label: 'Currency'
      @ObjectModel.foreignKey.association: '_TransactionCurrency'

      I_CustProjSlsOrdItmBillgPlnItm.TransactionCurrency                                                                                                  as TransactionCurrency,

      @EndUserText.label: 'Reason'

      I_CustProjSlsOrdItmBillgPlnItm.PostponementReason                                                                                                   as PostponementReason,

      @EndUserText.label: 'Usage'

      I_CustProjSlsOrdItmBillgPlnItm.BillingPlanItemUsage_2                                                                                               as BillingPlanItemUsage_2,

      @EndUserText.label: 'Description'

      I_CustProjSlsOrdItmBillgPlnItm.BillingPlanItemDescription                                                                                           as BillingPlanItemDescription,

      @EndUserText.label: 'Settlement Start Date'

      I_CustProjSlsOrdItmBillgPlnItm.BillingPlanServiceStartDate                                                                                          as BillingPlanServiceStartDate,

      @EndUserText.label: 'Settlement End Date'

      I_CustProjSlsOrdItmBillgPlnItm.BillingPlanServiceEndDate                                                                                            as BillingPlanServiceEndDate,

      @EndUserText.label: 'Sales Order Type'

      I_CustProjSlsOrdItmBillgPlnItm.SalesOrderType                                                                                                       as SalesOrderType,

      @EndUserText.label: 'Division'

      I_CustProjSlsOrdItmBillgPlnItm.OrganizationDivision                                                                                                 as OrganizationDivision,

      @EndUserText.label: 'Sales Organization'

      I_CustProjSlsOrdItmBillgPlnItm.SalesOrganization                                                                                                    as SalesOrganization,

      @EndUserText.label: 'Distribution Channel'

      I_CustProjSlsOrdItmBillgPlnItm.DistributionChannel                                                                                                  as DistributionChannel,

      @EndUserText.label: 'Created By'

      _I_PrjBlgElmEntrBillgPlnLink.CreatedByUser                                                                                                          as CreatedByUser,

      @EndUserText.label: 'Created On'
      @Semantics.systemDateTime.createdAt: true

      _I_PrjBlgElmEntrBillgPlnLink.CreationDateTime                                                                                                       as CreationDateTime,

      @EndUserText.label: 'Changed By'

      _I_PrjBlgElmEntrBillgPlnLink.LastChangedByUser                                                                                                      as LastChangedByUser,

      @EndUserText.label: 'Last Changed On'
      @Semantics.systemDateTime.lastChangedAt: true

      _I_PrjBlgElmEntrBillgPlnLink.LastChangeDateTime                                                                                                     as LastChangeDateTime,

      @EndUserText.label: 'Plan Item'


      @ObjectModel.text.element: [ 'WorkPackageName' ]

      _I_CustProjSlsOrdItemWorkPckg.WorkPackage                                                                                                           as WorkPackage,

      @EndUserText.label: 'Plan Item Desc.'
      @Semantics.text: true

      _I_CustProjSlsOrdItemWorkPckg.WorkPackageName                                                                                                       as WorkPackageName,

      @EndUserText.label: 'Work Package UUID'

      _I_CustProjSlsOrdItemWorkPckg.WorkPackageUUID                                                                                                       as WorkPackageUUID,

      @EndUserText.label: 'Start Date'

      _I_CustProjSlsOrdItemWorkPckg.WorkPackageStartDate                                                                                                  as WorkPackageStartDate,

      @EndUserText.label: 'End Date'

      _I_CustProjSlsOrdItemWorkPckg.WorkPackageEndDate                                                                                                    as WorkPackageEndDate,

      @EndUserText.label: 'Bill-To-Party'

      case  when _I_CustProjSlsOrdItemPartner.Partner is not null then _I_CustProjSlsOrdItemPartner.Partner else _I_CustProjSlsOrdPartner.Partner end     as BillToParty,

      @EndUserText.label: 'BP Address ID'

      case  when _I_CustProjSlsOrdItemPartner.Partner is not null then _I_CustProjSlsOrdItemPartner.AddressID else _I_CustProjSlsOrdPartner.AddressID end as BPAddressID,

      @EndUserText.label: 'WBS Internal ID'

      _I_PrjBlgElmEntrBillgPlnLink._ProjectBillingElementEntry.WBSElementInternalID                                                                       as WBSElementInternalID,

      @EndUserText.label: '_SalesOrder'

      I_CustProjSlsOrdItmBillgPlnItm._SalesOrder                                                                                                          as _SalesOrder,

      @EndUserText.label: '_BillingPlanUsageCategory'

      I_CustProjSlsOrdItmBillgPlnItm._BillingPlanUsageCategory                                                                                            as _BillingPlanUsageCategory,

      @EndUserText.label: '_BillingPlanRelatedBillgStatus'

      I_CustProjSlsOrdItmBillgPlnItm._BillingPlanRelatedBillgStatus                                                                                       as _BillingPlanRelatedBillgStatus,

      @EndUserText.label: '_TransactionCurrency'

      I_CustProjSlsOrdItmBillgPlnItm._TransactionCurrency                                                                                                 as _TransactionCurrency,

      I_CustProjSlsOrdItmBillgPlnItm.DistributionChannel                                                                                                  as /SAP/1_DISTRIBUTIONCHANNEL,

      I_CustProjSlsOrdItmBillgPlnItm.OrganizationDivision                                                                                                 as /SAP/1_ORGANIZATIONDIVISION,

      I_CustProjSlsOrdItmBillgPlnItm.SalesOrderType                                                                                                       as /SAP/1_SALESORDERTYPE,

      I_CustProjSlsOrdItmBillgPlnItm.SalesOrganization                                                                                                    as /SAP/1_SALESORGANIZATION
}
