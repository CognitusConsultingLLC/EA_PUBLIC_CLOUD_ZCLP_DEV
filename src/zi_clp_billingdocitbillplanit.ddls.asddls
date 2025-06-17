@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing Document item bill plan item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_BillingDocItBillPlanIt
  as select from I_BillingDocumentItemBasic   as PbdItem

  inner join   I_BillingDocumentRequestItem as BdrItem                   on  BdrItem.BillingDocumentRequest     = PbdItem.ReferenceSDDocument
                                                                           and BdrItem.BillingDocumentRequestItem = PbdItem.ReferenceSDDocumentItem
  inner join I_ProjectBillingElementEntrFlw as _ProjectBillingElementEntrFlw   on  BdrItem.BillingDocumentRequest     = _ProjectBillingElementEntrFlw.BillingDocument
                                                                           and BdrItem.BillingDocumentRequestItem = _ProjectBillingElementEntrFlw.BillingDocumentItem
    inner join   I_PrjBlgElmEntrBillgPlnLink  as PrjBlgElmEntrBillgPlnLink on _ProjectBillingElementEntrFlw.ProjBillgElmntEntrItmUUID = PrjBlgElmEntrBillgPlnLink.ProjBillgElmntEntrItmUUID

    inner join   ztclp_billplanit             as ztclp_billplanit          on  PrjBlgElmEntrBillgPlnLink.BillingPlan     = ztclp_billplanit.billingplan
                                                                           and PrjBlgElmEntrBillgPlnLink.BillingPlanItem = ztclp_billplanit.billingplanitem
    association [0..1] to ZI_CLP_Workpackage as _Workpackage on _Workpackage.WBSElementInternalID = $projection.WBSElementInternalID                                                                       
{
  key _ProjectBillingElementEntrFlw.ProjBillgElmntEntrItmFlowUUID,
      _ProjectBillingElementEntrFlw.ProjBillgElmntEntrItmUUID,
      PbdItem.BillingDocument,
      PbdItem.BillingDocumentItem,
      PbdItem.BillingDocumentType,
      PbdItem.SDDocumentCategory,
      _ProjectBillingElementEntrFlw.ProjectBillingRequest,
      _ProjectBillingElementEntrFlw.BillingDocRequestItemReference,
      _ProjectBillingElementEntrFlw.BillingDate,
      PbdItem.DocumentBillingStatus,
      _ProjectBillingElementEntrFlw.EnterpriseProjectServiceOrg,
      _ProjectBillingElementEntrFlw.ProjBillgElmntEntrSrvcExpnCode,
      PbdItem.TransactionCurrency,
      _ProjectBillingElementEntrFlw.ProjectCurrency,
      _ProjectBillingElementEntrFlw.GlobalCurrency,
      _ProjectBillingElementEntrFlw.DocumentCurrency,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _ProjectBillingElementEntrFlw.NetPriceAmountInDocCrcy,
      _ProjectBillingElementEntrFlw.NetPriceQuantity,
      _ProjectBillingElementEntrFlw.NetPriceQuantityUnit,
      _ProjectBillingElementEntrFlw.QuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      _ProjectBillingElementEntrFlw.BillingRequestedQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectBillingElementEntrFlw.BillgReqdAmtInTransacCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      _ProjectBillingElementEntrFlw.BillgReqdAmtInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      _ProjectBillingElementEntrFlw.BillgReqdAmtInGlobalCrcy
//      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
//      WrittenOffQuantity,
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      WrittenOffAmtInTransacCrcy,
//      @Semantics.amount.currencyCode: 'ProjectCurrency'
//      WrittenOffAmtInProjectCrcy,
//      @Semantics.amount.currencyCode: 'GlobalCurrency'
//      WrittenOffAmtInGlobalCrcy,
//      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
//      PostponedQuantity,
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      PostponedAmountInTransacCrcy,
//      @Semantics.amount.currencyCode: 'ProjectCurrency'
//      PostponedAmountInProjectCrcy,
//      @Semantics.amount.currencyCode: 'GlobalCurrency'
//      PostponedAmountInGlobalCrcy,
//      @Semantics.amount.currencyCode: 'DocumentCurrency'
//      BillgReqdRevenueAmtInDocCrcy,
//      @Semantics.amount.currencyCode: 'DocumentCurrency'
//      WrittenOffRevenueAmtInDocCrcy,
//      PrjBlgElmEntrFlwCreatedByUser,
//      PrjBlgElmEntrFlwCrtedAtDteTme,
//      PrjBlgElmEntrFlwChangedByUser,
//      PrjBlgElmEntrFlwChgdAtDteTme,
//      ProjBillingRequestItemLongText,
//      WrittenOffReversalDate


,
      PrjBlgElmEntrBillgPlnLink.BillingPlan     as BillingPlan,
      PrjBlgElmEntrBillgPlnLink.BillingPlanItem as BillingPlanItem,
      ztclp_billplanit.billingplanitemtype      as BillingPlanItemType,
      PbdItem.WBSElementInternalID,
      _Workpackage.WorkPackageID

}
//define view entity ZI_CLP_BillingDocItBillPlanIt
//  as select from I_BillingDocumentItemBasic   as PbdItem
//
//    inner join   I_BillingDocumentRequestItem as BdrItem                   on  BdrItem.BillingDocumentRequest     = PbdItem.ReferenceSDDocument
//                                                                           and BdrItem.BillingDocumentRequestItem = PbdItem.ReferenceSDDocumentItem
//
//    inner join   I_ProjectBillingRequest      as Pbr                       on BdrItem.ReferenceDocument = Pbr.ProjectBillingRequest
//
//    inner join   I_ProjectBillingRequestItem  as PbrItem                   on  Pbr.ProjectBillingRequestUUID = PbrItem.ProjectBillingRequestUUID
//                                                                           and PbrItem.Material              = 'A001'
//
//    inner join   I_ProjectBillingElementEntry  as ProjectBillingElementEntry on PbrItem.ProjBillgElmntEntrItmUUID = ProjectBillingElementEntry.ProjBillgElmntEntrItmUUID
//    inner join   I_PrjBlgElmEntrBillgPlnLink  as PrjBlgElmEntrBillgPlnLink on PbrItem.ProjBillgElmntEntrItmUUID = PrjBlgElmEntrBillgPlnLink.ProjBillgElmntEntrItmUUID
//
//    inner join   ztclp_billplanit             as ztclp_billplanit          on  PrjBlgElmEntrBillgPlnLink.BillingPlan     = ztclp_billplanit.billingplan
//                                                                           and PrjBlgElmEntrBillgPlnLink.BillingPlanItem = ztclp_billplanit.billingplanitem
//
//
//{
//  key PbrItem.ProjectBillingRequestItemUUID     as ProjectBillingRequestItemUUID,
//      PbdItem.BillingDocument                   as BillingDocument,
//      PbdItem.BillingDocumentItem               as BillingDocumentItem,
//
//      PbdItem.ReferenceSDDocument               as ReferenceSDDocument,
//      PbdItem.ReferenceSDDocumentItem           as ReferenceSDDocumentItem,
//
//      BdrItem.ReferenceDocument                 as ProjectBillingRequest,
//
//      Pbr.ProjectBillingRequestType             as ProjectBillingRequestType,
//      Pbr.ProjectBillingRequestStatus           as PBRStatus,
//
//      //      PbrItem.BillingPlanItem                 as BillingPlanItem,
//      //      PbrItem.BillingPlan                     as BillingPlan,
////      PbrItem.ProjBillgElmntEntrItmUUID         as ProjBillgElmntEntrItmUUID,
//      PrjBlgElmEntrBillgPlnLink.BillingPlan     as BillingPlan,
//      PrjBlgElmEntrBillgPlnLink.BillingPlanItem as BillingPlanItem,
//      ztclp_billplanit.billingplanitemtype      as BillingPlanItemType,
//      ProjectBillingElementEntry.ProjBillgElmntEntrItmUUID ,
//      ProjectBillingElementEntry._ProjectBillingElementEntrFlw.BillingDocument as PBRBillingDocument,
//      ProjectBillingElementEntry._ProjectBillingElementEntrFlw.BillingDocumentItem as PBRBillingDocumentItem,
//      ProjectBillingElementEntry._ProjectBillingElementEntrFlw.BillingDocRequestItemReference
//
//
//}
