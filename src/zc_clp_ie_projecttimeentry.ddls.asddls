@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for Editor Time Entry'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_CLP_IE_ProjectTimeEntry
  as projection on ZI_CLP_IE_ProjectTimeEntry
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
      ProjectInternalID,
      Project,
      ProjectExternalID,
      ProjectID,
      ProjectDescription,
      WBSDescription,
      WBSElementExternalID,
      ProjBillgElmntEntrItmUUID_1,
      ReferenceDocument,
      ReversalReferenceDocument,
      AccountingDocument,
      LedgerGLLineItem,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      AmountInTransactionCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      AmountInGlobalCurrency,
      BillingPlan,
      BillingPlanItem,
      ProjectElementUUID,
      SalesDocument,
      SalesDocumentItem,
      BillingWBSElementInternalID,
      SDDocumentCategory,
      CompanyCode,
      FiscalYear,
      ReferenceDocument_1,
      WorkItem,
      WorkPackage,
      BillToParty,
      ShipToParty,
      PersonnelNumber,
      PersonWorkAgreementExternalID,
      DocumentDate,
      TimeSheetRecord,
      TimeSheetDate,
      ActivityType,
      CostCtrActivityTypeName,
      @Semantics.amount.currencyCode: 'Currency'
      RecordedAmount,
      Currency,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      RecordedQuantity,
      UnitOfMeasure,
      ReceiverCostCenter,
      SenderCostCenter,
      ControllingArea,
      TimeSheetWrkLocCode,
      TimeSheetWrkLocCodeName,
      EmailAddress,
      PersonFullName,
      EngPartnerBP,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      PSP0Rate,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      ProfessionalFee,
      AdminRate,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      AdminFee,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      TotalProfessionalFee,
      /* Associations */
      _AccountingDocument,
      _CompanyCode,
      _DocumentCurrency,
      _DocumentCurrencyText,
      _FiscalYear,
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
      _Text,
      _TimeSheetRecord,
      _TransactionCurrency,
      _TransactionCurrencyText,
      _WBSElement,
      _Workpackage,
      _Project : redirected to ZC_CLP_IE_Project
}
