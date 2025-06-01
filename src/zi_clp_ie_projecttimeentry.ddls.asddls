@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for Editor Time Entry'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IE_ProjectTimeEntry
  as select from ZI_CLP_ProjectTimeEntry as _ProjectTimeEntry
  left outer join ZI_CLP_IE_MarkedWIP as _MarkedWIP
      on _MarkedWIP.Projbillgelmntentritmuuid = _ProjectTimeEntry.ProjBillgElmntEntrItmUUID
  association to parent ZI_CLP_IE_Project as _Project on _Project.ProjectID = $projection.ProjectID
  association[0..1] to ZI_CLP_BPPersonExtID as _BPPersonExtID on _BPPersonExtID.PersonWorkAgreementExternalID = $projection.PersonWorkAgreementExternalID
  association[0..1] to I_CostCenterActivityTypeText as _CostCenterActivityTypeText on _CostCenterActivityTypeText.CostCtrActivityType = $projection.ActivityType
                                                                                     and  _CostCenterActivityTypeText.ControllingArea = $projection.ControllingArea                   

{
  key _ProjectTimeEntry.ProjBillgElmntEntrItmUUID,
      _ProjectTimeEntry.ProjectBillingElementUUID,
      _ProjectTimeEntry.ProjBillgElmntEntrSourceType,
      _ProjectTimeEntry.WBSElementInternalID,
      _ProjectTimeEntry.Material,
      _ProjectTimeEntry.QuantityUnit,
      _ProjectTimeEntry.ProjBillgElmntEntrIsCancelled,
      _ProjectTimeEntry.PricingDate,
      _ProjectTimeEntry.NetPriceAmountIsManual,
      _ProjectTimeEntry.TransactionCurrency,
      _ProjectTimeEntry.ProjectCurrency,
      _ProjectTimeEntry.GlobalCurrency,
      _ProjectTimeEntry.DocumentCurrency,
      _ProjectTimeEntry.ServicesRenderedDate,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      _ProjectTimeEntry.OriginalTotalQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectTimeEntry.OriginalAmountInTransacCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      _ProjectTimeEntry.OriginalAmountInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      _ProjectTimeEntry.OriginalAmountInGlobalCurrency,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      _ProjectTimeEntry.OpenQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectTimeEntry.OpenAmountInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      _ProjectTimeEntry.OpenAmountInProjectCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      _ProjectTimeEntry.OpenAmountInGlobalCurrency,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      _ProjectTimeEntry.ToBeBilledQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectTimeEntry.ToBeBilledAmtInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      _ProjectTimeEntry.ToBeBilledAmtInProjCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      _ProjectTimeEntry.ToBeBilledAmtInGlobCurrency,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      _ProjectTimeEntry.ToBeWrittenOffQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectTimeEntry.ToBeWrittenOffAmtInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      _ProjectTimeEntry.ToBeWrittenOffAmtInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      _ProjectTimeEntry.ToBeWrittenOffAmtInGlobalCrcy,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      _ProjectTimeEntry.ToBePostponedQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectTimeEntry.ToBePostponedAmtInTransacCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      _ProjectTimeEntry.ToBePostponedAmtInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      _ProjectTimeEntry.ToBePostponedAmtInGlobalCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _ProjectTimeEntry.BillableRevenueAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _ProjectTimeEntry.ManualNetPriceAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _ProjectTimeEntry.NetPriceAmountInDocCrcy,
      @Semantics.quantity.unitOfMeasure: 'NetPriceQuantityUnit'
      _ProjectTimeEntry.NetPriceQuantity,
      _ProjectTimeEntry.NetPriceQuantityUnit,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _ProjectTimeEntry.OriginalRevenueAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _ProjectTimeEntry.OpenRevenueAmtInDocCrcy,
      _ProjectTimeEntry.ProjBillgElmntEntrIsReversed,
      _ProjectTimeEntry.ProjBillgElmntEntrIsReversal,
      _ProjectTimeEntry.PrjBlgElmEntrCanclnSrceCode,
      _ProjectTimeEntry.PrjBlgElmEntrCreatedByUser,
      _ProjectTimeEntry.PrjBlgElmEntrCreatedAtDteTme,
      _ProjectTimeEntry.PrjBlgElmEntrLastChgdByUser,
      _ProjectTimeEntry.PrjBlgElmEntrLastChgdAtDteTme,
      _ProjectTimeEntry.PrjBlgElmEntryLongText,
      _ProjectTimeEntry.ProjectBillingElementEntryDesc,
      _ProjectTimeEntry.ProjBillgTransfCostQtyCode,
      _ProjectTimeEntry.ProjBillgItmValIsNotActualCost,
      _ProjectTimeEntry.ProjBillgElementEntryObject,
      _ProjectTimeEntry.PostingDate,
      _ProjectTimeEntry.ProjectInternalID,
      _ProjectTimeEntry.Project,
      _ProjectTimeEntry.ProjectExternalID,
      _ProjectTimeEntry.ProjectID,
      _ProjectTimeEntry.ProjectDescription,
      _ProjectTimeEntry.WBSDescription,
      _ProjectTimeEntry.WBSElementExternalID,
      _ProjectTimeEntry.ProjBillgElmntEntrItmUUID_1,
      _ProjectTimeEntry.ReferenceDocument,
      _ProjectTimeEntry.ReversalReferenceDocument,
      _ProjectTimeEntry.AccountingDocument,
      _ProjectTimeEntry.LedgerGLLineItem,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectTimeEntry.AmountInTransactionCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      _ProjectTimeEntry.AmountInGlobalCurrency,
      _ProjectTimeEntry.BillingPlan,
      _ProjectTimeEntry.BillingPlanItem,
      _ProjectTimeEntry.ProjectElementUUID,
      _ProjectTimeEntry.SalesDocument,
      _ProjectTimeEntry.SalesDocumentItem,
      _ProjectTimeEntry.BillingWBSElementInternalID,
      _ProjectTimeEntry.SDDocumentCategory,
      _ProjectTimeEntry.CompanyCode,
      _ProjectTimeEntry.FiscalYear,
      _ProjectTimeEntry.ReferenceDocument_1,
      _ProjectTimeEntry.WorkItem,
      _ProjectTimeEntry.WorkPackage,
      _ProjectTimeEntry.BillToParty,
      _ProjectTimeEntry.ShipToParty,
      _ProjectTimeEntry.PersonnelNumber,
      _ProjectTimeEntry.PersonWorkAgreementExternalID,
      _ProjectTimeEntry.DocumentDate,
      _ProjectTimeEntry.TimeSheetRecord,
      _ProjectTimeEntry.TimeSheetDate,
      _ProjectTimeEntry.ActivityType,
      _CostCenterActivityTypeText.CostCtrActivityTypeName,
      @Semantics.amount.currencyCode: 'Currency'
      _ProjectTimeEntry.RecordedAmount,
      _ProjectTimeEntry.Currency,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      _ProjectTimeEntry.RecordedQuantity,
      _ProjectTimeEntry.UnitOfMeasure,
      _ProjectTimeEntry.ReceiverCostCenter,
      _ProjectTimeEntry.SenderCostCenter,
      _ProjectTimeEntry.ControllingArea,
      _ProjectTimeEntry.TimeSheetWrkLocCode,
      _ProjectTimeEntry.TimeSheetWrkLocCodeName,
      _BPPersonExtID.EmailAddress,
      _BPPersonExtID.PersonFullName,  
      _ProjectTimeEntry.EngPartnerBP,
      /* Associations */
      _ProjectTimeEntry._AccountingDocument,
      _ProjectTimeEntry._CompanyCode,
      _ProjectTimeEntry._DocumentCurrency,
      _ProjectTimeEntry._DocumentCurrencyText,
      _ProjectTimeEntry._FiscalYear,
      _ProjectTimeEntry._GlobalCurrency,
      _ProjectTimeEntry._GlobalCurrencyText,
      _ProjectTimeEntry._Material,
      _ProjectTimeEntry._PrjBillgTransfCostQtyCodeTxt,
      _ProjectTimeEntry._PrjBlgElmEntrBillgPlnLink,
      _ProjectTimeEntry._PrjBlgElmEntrCanclnSrcCdText,
      _ProjectTimeEntry._PrjBlgElmEntrCanclnSrceCode,
      _ProjectTimeEntry._PrjBlgElmEntrJrnlEntrLink,
      _ProjectTimeEntry._PrjBlgElmEntrSrceTypeText,
      _ProjectTimeEntry._ProjBillgElmntEntrSourceType,
      _ProjectTimeEntry._ProjBillgTransfCostQtyCode,
      _ProjectTimeEntry._ProjectBillingElement,
      _ProjectTimeEntry._ProjectBillingElementEntrFlw,
      _ProjectTimeEntry._ProjectCurrency,
      _ProjectTimeEntry._ProjectCurrencyText,
      _ProjectTimeEntry._QuantityUnit,
      _ProjectTimeEntry._Text,
      _ProjectTimeEntry._TimeSheetRecord,
      _ProjectTimeEntry._TransactionCurrency,
      _ProjectTimeEntry._TransactionCurrencyText,
      _ProjectTimeEntry._WBSElement,
      _ProjectTimeEntry._Workpackage,
      _Project

} where _ProjectTimeEntry.OpenQuantity != 0
  and _ProjectTimeEntry._TimeSheetRecord.TimeSheetStatus != '60'
  and _MarkedWIP.Projbillgelmntentritmuuid is null
