@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project Time Entry'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_ProjectTimeEntry
  as select from ZI_CLP_CustProjBillElemEntry
  association [0..1] to I_TimeSheetRecord as _TimeSheetRecord on _TimeSheetRecord.TimeSheetAccountingDocument = $projection.ReferenceDocument
  association [1..1] to I_PersonWorkAgrmtToExternalID  as _PersonWorkAgrmtToExternalID  on $projection.PersonnelNumber = _PersonWorkAgrmtToExternalID.PersonWorkAgreement
  association [0..1] to ZI_CLP_Project as _ProjectDetails on _ProjectDetails.ProjectID = $projection.ProjectID
//  association [0..1] to ZI_CLP_JournalEntryItem as _JournalEntryItem on _JournalEntryItem.AccountingDocument = $projection.AccountingDocument
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
      _PersonWorkAgrmtToExternalID.PersonWorkAgreementExternalID,
      DocumentDate, 
      _ProjectDetails.EngPartnerBP,


      _TimeSheetRecord.TimeSheetRecord                                               as TimeSheetRecord,
      _TimeSheetRecord.TimeSheetDate                                                 as TimeSheetDate,
      _TimeSheetRecord.ActivityType                                                  as ActivityType,
      @Semantics.amount.currencyCode: 'Currency'
      _TimeSheetRecord.RecordedAmount                                                as RecordedAmount,
      _TimeSheetRecord.Currency                                                      as Currency,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      _TimeSheetRecord.RecordedQuantity                                              as RecordedQuantity,
      _TimeSheetRecord.UnitOfMeasure                                                 as UnitOfMeasure,
      _TimeSheetRecord.ReceiverCostCenter                                            as ReceiverCostCenter,
      _TimeSheetRecord.SenderCostCenter                                              as SenderCostCenter,
      _TimeSheetRecord.ControllingArea                                               as ControllingArea,
      _TimeSheetRecord.TimeSheetWrkLocCode                                           as TimeSheetWrkLocCode,
      _TimeSheetRecord._TimeSheetWrkLoc._TimeSheetWrkLocText.TimeSheetWrkLocCodeName as TimeSheetWrkLocCodeName,

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
      _TransactionCurrency,
      _TransactionCurrencyText,
      _WBSElement,
      _Workpackage,
      _TimeSheetRecord,
      _PersonWorkAgrmtToExternalID
}where QuantityUnit = 'H' and ProjBillgElmntEntrIsCancelled = ''
