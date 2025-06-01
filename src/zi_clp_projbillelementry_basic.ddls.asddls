@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project Billing Element Entry Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_ProjBillElemEntry_Basic

  as select from I_ProjectBillingElementEntry
  association [0..1] to ZI_CLP_Workpackage as _Workpackage on _Workpackage.WBSElementInternalID = $projection.WBSElementInternalID
{
  key ProjBillgElmntEntrItmUUID,
      ProjectBillingElementUUID,
      ProjBillgElmntEntrSourceType,
      WBSElementInternalID,
      Material,
      QuantityUnit,
      ProjBillgElmntEntrIsCancelled,
      PricingDate,
      NetPriceAmountIsManual,
      TransactionCurrency,
      ProjectCurrency,
      GlobalCurrency,
      DocumentCurrency,
      ServicesRenderedDate,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      OriginalTotalQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      OriginalAmountInTransacCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      OriginalAmountInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      OriginalAmountInGlobalCurrency,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      OpenQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      OpenAmountInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      OpenAmountInProjectCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      OpenAmountInGlobalCurrency,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ToBeBilledQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ToBeBilledAmtInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      ToBeBilledAmtInProjCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ToBeBilledAmtInGlobCurrency,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ToBeWrittenOffQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ToBeWrittenOffAmtInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      ToBeWrittenOffAmtInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ToBeWrittenOffAmtInGlobalCrcy,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ToBePostponedQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ToBePostponedAmtInTransacCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      ToBePostponedAmtInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ToBePostponedAmtInGlobalCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      BillableRevenueAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      ManualNetPriceAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      NetPriceAmountInDocCrcy,
      @Semantics.quantity.unitOfMeasure: 'NetPriceQuantityUnit'
      NetPriceQuantity,
      NetPriceQuantityUnit,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      OriginalRevenueAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      OpenRevenueAmtInDocCrcy,
      ProjBillgElmntEntrIsReversed,
      ProjBillgElmntEntrIsReversal,
      PrjBlgElmEntrCanclnSrceCode,
      PrjBlgElmEntrCreatedByUser,
      PrjBlgElmEntrCreatedAtDteTme,
      PrjBlgElmEntrLastChgdByUser,
      PrjBlgElmEntrLastChgdAtDteTme,
      PrjBlgElmEntryLongText,
      ProjectBillingElementEntryDesc,
      ProjBillgTransfCostQtyCode,
      ProjBillgItmValIsNotActualCost,
      ProjBillgElementEntryObject,
      PostingDate,
      //      _WBSElement.ProjectInternalID                                                as ProjectInternalID,
      //      _WBSElement._Project.Project                                                 as Project,
      //      _WBSElement._Project.ProjectExternalID                                       as ProjectExternalID,
      //      _WBSElement._Project.ProjectDescription                                      as ProjectDescription,
      //      _WBSElement.WBSDescription                                                   as WBSDescription,
      //      _WBSElement.WBSElementExternalID                                             as WBSElementExternalID,

      _Workpackage.ProjectInternalID                                                    as ProjectInternalID,
      _Workpackage._Project.Project                                                     as Project,
      _Workpackage.ProjectID                                                            as ProjectExternalID,
      _Workpackage.ProjectID                                                            as ProjectID,
      _Workpackage._Project.ProjectDescription                                          as ProjectDescription,
      _Workpackage.WorkPackageName                                                      as WBSDescription,
      _Workpackage.WorkPackageID                                                        as WBSElementExternalID,
      _PrjBlgElmEntrJrnlEntrLink.ProjBillgElmntEntrItmUUID                              as ProjBillgElmntEntrItmUUID_1,
      _PrjBlgElmEntrJrnlEntrLink.ReferenceDocument                                      as ReferenceDocument,
      _PrjBlgElmEntrJrnlEntrLink.ReversalReferenceDocument                              as ReversalReferenceDocument,
      _PrjBlgElmEntrJrnlEntrLink.AccountingDocument                                     as AccountingDocument,
      _PrjBlgElmEntrJrnlEntrLink.LedgerGLLineItem                                       as LedgerGLLineItem,
//      _PrjBlgElmEntrJrnlEntrLink.TransactionCurrency                                    as TransactionCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _PrjBlgElmEntrJrnlEntrLink._GLAccountLineItemRawData.AmountInTransactionCurrency  as AmountInTransactionCurrency,
//      _PrjBlgElmEntrJrnlEntrLink._GLAccountLineItemRawData.GlobalCurrency       as GlobalCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      _PrjBlgElmEntrJrnlEntrLink._GLAccountLineItemRawData.AmountInGlobalCurrency       as AmountInGlobalCurrency,
      _PrjBlgElmEntrBillgPlnLink.BillingPlan                                            as BillingPlan,
      _PrjBlgElmEntrBillgPlnLink.BillingPlanItem                                        as BillingPlanItem,

      _ProjectBillingElement.ProjectElementUUID                                         as ProjectElementUUID,
      _ProjectBillingElement.SalesDocument                                              as SalesDocument,
      _ProjectBillingElement.SalesDocumentItem                                          as SalesDocumentItem,
      _ProjectBillingElement.BillingWBSElementInternalID                                as BillingWBSElementInternalID,
      _ProjectBillingElement._SalesDocument._SDDocumentCategory.SDDocumentCategory      as SDDocumentCategory,
      _PrjBlgElmEntrJrnlEntrLink.Ledger                                                 as Ledger,
      _PrjBlgElmEntrJrnlEntrLink.CompanyCode                                            as CompanyCode,
      _PrjBlgElmEntrJrnlEntrLink.FiscalYear                                             as FiscalYear,
      _PrjBlgElmEntrJrnlEntrLink._GLAccountLineItemRawData.ReferenceDocument            as ReferenceDocument_1,
      _PrjBlgElmEntrJrnlEntrLink._GLAccountLineItemRawData.WorkItem                     as WorkItem,
      _PrjBlgElmEntrJrnlEntrLink._GLAccountLineItemRawData.WorkPackage                  as WorkPackage,
      _PrjBlgElmEntrJrnlEntrLink._GLAccountLineItemRawData.BillToParty                  as BillToParty,
      _PrjBlgElmEntrJrnlEntrLink._GLAccountLineItemRawData.ShipToParty                  as ShipToParty,
      _PrjBlgElmEntrJrnlEntrLink._GLAccountLineItemRawData.PersonnelNumber              as PersonnelNumber,
      _PrjBlgElmEntrJrnlEntrLink._GLAccountLineItemRawData.DocumentDate                 as DocumentDate,
      _PrjBlgElmEntrJrnlEntrLink._AccountingDocument                                    as _AccountingDocument,
      _ProjectBillingElement._SalesDocument._SDDocumentCategory._Text                   as _Text,
      _PrjBlgElmEntrJrnlEntrLink._CompanyCode                                           as _CompanyCode,
      _PrjBlgElmEntrJrnlEntrLink._FiscalYear                                            as _FiscalYear,

      /* Associations */
      _DocumentCurrency,
      _DocumentCurrencyText,
      _GlobalCurrency,
      _GlobalCurrencyText,
      _Material,
      _PrjBillgTransfCostQtyCodeTxt,
      _PrjBlgElmEntrBillgPlnLink,
      _PrjBlgElmEntrCanclnSrcCdText,
      _PrjBlgElmEntrCanclnSrceCode,
      _PrjBlgElmEntrJrnlEntrLink,
      _PrjBlgElmEntrSrceTypeText,
      _ProjBillgElmntEntrSourceType,
      _ProjBillgTransfCostQtyCode,
      _ProjectBillingElement,
      _ProjectBillingElementEntrFlw,
      _ProjectCurrency,
      _ProjectCurrencyText,
      _QuantityUnit,
      _TransactionCurrency,
      _TransactionCurrencyText,
      _WBSElement,
      _Workpackage
}
