@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project Billing Element Entry'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_CustProjBillElemEntry
  as select from ZI_CLP_ProjBillElemEntry_Basic
  association [0..1] to ZI_CLP_Workpackage   as _Workpackage   on _Workpackage.WBSElementInternalID = $projection.WBSElementInternalID
  association [0..1] to ZI_CLP_BPPersonExtID as _BPPersonExtID on _BPPersonExtID.PersonWorkAgreement = $projection.PersonnelNumber
  association [0..1] to I_Product            as _Product       on _Product.Product = $projection.Material
{
  key ZI_CLP_ProjBillElemEntry_Basic.ProjBillgElmntEntrItmUUID,
      ZI_CLP_ProjBillElemEntry_Basic.ProjectBillingElementUUID,
      ZI_CLP_ProjBillElemEntry_Basic.ProjBillgElmntEntrSourceType,
      ZI_CLP_ProjBillElemEntry_Basic.WBSElementInternalID,
      ZI_CLP_ProjBillElemEntry_Basic.Material,
      ZI_CLP_ProjBillElemEntry_Basic.QuantityUnit,
      ZI_CLP_ProjBillElemEntry_Basic.ProjBillgElmntEntrIsCancelled,
      ZI_CLP_ProjBillElemEntry_Basic.PricingDate,
      ZI_CLP_ProjBillElemEntry_Basic.NetPriceAmountIsManual,
      ZI_CLP_ProjBillElemEntry_Basic.TransactionCurrency,
      ZI_CLP_ProjBillElemEntry_Basic.ProjectCurrency,
      ZI_CLP_ProjBillElemEntry_Basic.GlobalCurrency,
      ZI_CLP_ProjBillElemEntry_Basic.DocumentCurrency,
      ZI_CLP_ProjBillElemEntry_Basic.ServicesRenderedDate,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ZI_CLP_ProjBillElemEntry_Basic.OriginalTotalQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.OriginalAmountInTransacCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.OriginalAmountInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.OriginalAmountInGlobalCurrency,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ZI_CLP_ProjBillElemEntry_Basic.OpenQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.OpenAmountInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.OpenAmountInProjectCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.OpenAmountInGlobalCurrency,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ZI_CLP_ProjBillElemEntry_Basic.ToBeBilledQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.ToBeBilledAmtInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.ToBeBilledAmtInProjCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.ToBeBilledAmtInGlobCurrency,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ZI_CLP_ProjBillElemEntry_Basic.ToBeWrittenOffQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.ToBeWrittenOffAmtInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.ToBeWrittenOffAmtInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.ToBeWrittenOffAmtInGlobalCrcy,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ZI_CLP_ProjBillElemEntry_Basic.ToBePostponedQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.ToBePostponedAmtInTransacCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.ToBePostponedAmtInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.ToBePostponedAmtInGlobalCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.BillableRevenueAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.ManualNetPriceAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.NetPriceAmountInDocCrcy,
      @Semantics.quantity.unitOfMeasure: 'NetPriceQuantityUnit'
      ZI_CLP_ProjBillElemEntry_Basic.NetPriceQuantity,
      ZI_CLP_ProjBillElemEntry_Basic.NetPriceQuantityUnit,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.OriginalRevenueAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.OpenRevenueAmtInDocCrcy,
      ZI_CLP_ProjBillElemEntry_Basic.ProjBillgElmntEntrIsReversed,
      ZI_CLP_ProjBillElemEntry_Basic.ProjBillgElmntEntrIsReversal,
      ZI_CLP_ProjBillElemEntry_Basic.PrjBlgElmEntrCanclnSrceCode,
      ZI_CLP_ProjBillElemEntry_Basic.PrjBlgElmEntrCreatedByUser,
      ZI_CLP_ProjBillElemEntry_Basic.PrjBlgElmEntrCreatedAtDteTme,
      ZI_CLP_ProjBillElemEntry_Basic.PrjBlgElmEntrLastChgdByUser,
      ZI_CLP_ProjBillElemEntry_Basic.PrjBlgElmEntrLastChgdAtDteTme,
      ZI_CLP_ProjBillElemEntry_Basic.PrjBlgElmEntryLongText,
      ZI_CLP_ProjBillElemEntry_Basic.ProjectBillingElementEntryDesc,
      ZI_CLP_ProjBillElemEntry_Basic.ProjBillgTransfCostQtyCode,
      ZI_CLP_ProjBillElemEntry_Basic.ProjBillgItmValIsNotActualCost,
      ZI_CLP_ProjBillElemEntry_Basic.ProjBillgElementEntryObject,
      ZI_CLP_ProjBillElemEntry_Basic.PostingDate,
      ZI_CLP_ProjBillElemEntry_Basic.ProjectInternalID,
      ZI_CLP_ProjBillElemEntry_Basic.Project,
      ZI_CLP_ProjBillElemEntry_Basic.ProjectExternalID,
      ZI_CLP_ProjBillElemEntry_Basic.ProjectID,
      ZI_CLP_ProjBillElemEntry_Basic.ProjectDescription,
      ZI_CLP_ProjBillElemEntry_Basic.WBSDescription,
      ZI_CLP_ProjBillElemEntry_Basic.WBSElementExternalID,
      ZI_CLP_ProjBillElemEntry_Basic.ProjBillgElmntEntrItmUUID_1,
      ZI_CLP_ProjBillElemEntry_Basic.ReferenceDocument,
      ZI_CLP_ProjBillElemEntry_Basic.ReversalReferenceDocument,
      ZI_CLP_ProjBillElemEntry_Basic.AccountingDocument,
      ZI_CLP_ProjBillElemEntry_Basic.LedgerGLLineItem,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.AmountInTransactionCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ZI_CLP_ProjBillElemEntry_Basic.AmountInGlobalCurrency,
      ZI_CLP_ProjBillElemEntry_Basic.BillingPlan,
      ZI_CLP_ProjBillElemEntry_Basic.BillingPlanItem,
      ZI_CLP_ProjBillElemEntry_Basic.ProjectElementUUID,
      ZI_CLP_ProjBillElemEntry_Basic.SalesDocument,
      ZI_CLP_ProjBillElemEntry_Basic.SalesDocumentItem,
      ZI_CLP_ProjBillElemEntry_Basic.BillingWBSElementInternalID,
      ZI_CLP_ProjBillElemEntry_Basic.SDDocumentCategory,
      ZI_CLP_ProjBillElemEntry_Basic.Ledger,
      ZI_CLP_ProjBillElemEntry_Basic.CompanyCode,
      ZI_CLP_ProjBillElemEntry_Basic.FiscalYear,
      ZI_CLP_ProjBillElemEntry_Basic.ReferenceDocument_1,
      ZI_CLP_ProjBillElemEntry_Basic.WorkItem,
      ZI_CLP_ProjBillElemEntry_Basic.WorkPackage,
      ZI_CLP_ProjBillElemEntry_Basic.BillToParty,
      ZI_CLP_ProjBillElemEntry_Basic.ShipToParty,
      ZI_CLP_ProjBillElemEntry_Basic.PersonnelNumber,
      ZI_CLP_ProjBillElemEntry_Basic.DocumentDate,
      
    _BPPersonExtID.PersonWorkAgreementExternalID,
    _BPPersonExtID.EmailAddress,
    _BPPersonExtID.PersonFullName,
      _Product._Text[Language = $session.system_language ].ProductName,
      
      /* Associations */
      ZI_CLP_ProjBillElemEntry_Basic._AccountingDocument,
      ZI_CLP_ProjBillElemEntry_Basic._CompanyCode,
      ZI_CLP_ProjBillElemEntry_Basic._DocumentCurrency,
      ZI_CLP_ProjBillElemEntry_Basic._DocumentCurrencyText,
      ZI_CLP_ProjBillElemEntry_Basic._FiscalYear,
      ZI_CLP_ProjBillElemEntry_Basic._GlobalCurrency,
      ZI_CLP_ProjBillElemEntry_Basic._GlobalCurrencyText,
      ZI_CLP_ProjBillElemEntry_Basic._Material,
      ZI_CLP_ProjBillElemEntry_Basic._PrjBillgTransfCostQtyCodeTxt,
      ZI_CLP_ProjBillElemEntry_Basic._PrjBlgElmEntrBillgPlnLink,
      ZI_CLP_ProjBillElemEntry_Basic._PrjBlgElmEntrCanclnSrcCdText,
      ZI_CLP_ProjBillElemEntry_Basic._PrjBlgElmEntrCanclnSrceCode,
      ZI_CLP_ProjBillElemEntry_Basic._PrjBlgElmEntrJrnlEntrLink,
      ZI_CLP_ProjBillElemEntry_Basic._PrjBlgElmEntrSrceTypeText,
      ZI_CLP_ProjBillElemEntry_Basic._ProjBillgElmntEntrSourceType,
      ZI_CLP_ProjBillElemEntry_Basic._ProjBillgTransfCostQtyCode,
      ZI_CLP_ProjBillElemEntry_Basic._ProjectBillingElement,
      ZI_CLP_ProjBillElemEntry_Basic._ProjectBillingElementEntrFlw,
      ZI_CLP_ProjBillElemEntry_Basic._ProjectCurrency,
      ZI_CLP_ProjBillElemEntry_Basic._ProjectCurrencyText,
      ZI_CLP_ProjBillElemEntry_Basic._QuantityUnit,
      ZI_CLP_ProjBillElemEntry_Basic._Text,
      ZI_CLP_ProjBillElemEntry_Basic._TransactionCurrency,
      ZI_CLP_ProjBillElemEntry_Basic._TransactionCurrencyText,
      ZI_CLP_ProjBillElemEntry_Basic._WBSElement,
      ZI_CLP_ProjBillElemEntry_Basic._Workpackage
}
