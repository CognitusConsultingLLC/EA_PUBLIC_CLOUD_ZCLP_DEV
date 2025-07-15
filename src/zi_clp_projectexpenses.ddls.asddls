@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project Expenses'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_ProjectExpenses
  as select from ZI_CLP_CustProjBillElemEntry
  left outer join ZI_CLP_JEToExcludeExpenses 
        on ZI_CLP_JEToExcludeExpenses.AccountingDocument = ZI_CLP_CustProjBillElemEntry.AccountingDocument
        and ZI_CLP_JEToExcludeExpenses.AccountAssignment = ZI_CLP_CustProjBillElemEntry.WorkPackage
  association [0..1] to ZI_CLP_Project as _ProjectDetails on _ProjectDetails.ProjectID = $projection.ProjectID  
  association [1..1] to I_PersonWorkAgrmtToExternalID  as _PersonWorkAgrmtToExternalID  on $projection.PersonnelNumber = _PersonWorkAgrmtToExternalID.PersonWorkAgreement
{
  key ZI_CLP_CustProjBillElemEntry.ProjBillgElmntEntrItmUUID,
      ZI_CLP_CustProjBillElemEntry.ProjectBillingElementUUID,
      ZI_CLP_CustProjBillElemEntry.ProjBillgElmntEntrSourceType,
      ZI_CLP_CustProjBillElemEntry.WBSElementInternalID,
      ZI_CLP_CustProjBillElemEntry.Material,
      ZI_CLP_CustProjBillElemEntry.QuantityUnit,
      ZI_CLP_CustProjBillElemEntry.ProjBillgElmntEntrIsCancelled,
      ZI_CLP_CustProjBillElemEntry.PricingDate,
      ZI_CLP_CustProjBillElemEntry.NetPriceAmountIsManual,
      ZI_CLP_CustProjBillElemEntry.TransactionCurrency,
      ZI_CLP_CustProjBillElemEntry.ProjectCurrency,
      ZI_CLP_CustProjBillElemEntry.GlobalCurrency,
      ZI_CLP_CustProjBillElemEntry.DocumentCurrency,
      ZI_CLP_CustProjBillElemEntry.ServicesRenderedDate,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ZI_CLP_CustProjBillElemEntry.OriginalTotalQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZI_CLP_CustProjBillElemEntry.OriginalAmountInTransacCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      ZI_CLP_CustProjBillElemEntry.OriginalAmountInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ZI_CLP_CustProjBillElemEntry.OriginalAmountInGlobalCurrency,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ZI_CLP_CustProjBillElemEntry.OpenQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZI_CLP_CustProjBillElemEntry.OpenAmountInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      ZI_CLP_CustProjBillElemEntry.OpenAmountInProjectCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ZI_CLP_CustProjBillElemEntry.OpenAmountInGlobalCurrency,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ZI_CLP_CustProjBillElemEntry.ToBeBilledQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZI_CLP_CustProjBillElemEntry.ToBeBilledAmtInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      ZI_CLP_CustProjBillElemEntry.ToBeBilledAmtInProjCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ZI_CLP_CustProjBillElemEntry.ToBeBilledAmtInGlobCurrency,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ZI_CLP_CustProjBillElemEntry.ToBeWrittenOffQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZI_CLP_CustProjBillElemEntry.ToBeWrittenOffAmtInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      ZI_CLP_CustProjBillElemEntry.ToBeWrittenOffAmtInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ZI_CLP_CustProjBillElemEntry.ToBeWrittenOffAmtInGlobalCrcy,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ZI_CLP_CustProjBillElemEntry.ToBePostponedQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZI_CLP_CustProjBillElemEntry.ToBePostponedAmtInTransacCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      ZI_CLP_CustProjBillElemEntry.ToBePostponedAmtInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ZI_CLP_CustProjBillElemEntry.ToBePostponedAmtInGlobalCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      ZI_CLP_CustProjBillElemEntry.BillableRevenueAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      ZI_CLP_CustProjBillElemEntry.ManualNetPriceAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      ZI_CLP_CustProjBillElemEntry.NetPriceAmountInDocCrcy,
      @Semantics.quantity.unitOfMeasure: 'NetPriceQuantityUnit'
      ZI_CLP_CustProjBillElemEntry.NetPriceQuantity,
      ZI_CLP_CustProjBillElemEntry.NetPriceQuantityUnit,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      ZI_CLP_CustProjBillElemEntry.OriginalRevenueAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      ZI_CLP_CustProjBillElemEntry.OpenRevenueAmtInDocCrcy,
      ZI_CLP_CustProjBillElemEntry.ProjBillgElmntEntrIsReversed,
      ZI_CLP_CustProjBillElemEntry.ProjBillgElmntEntrIsReversal,
      ZI_CLP_CustProjBillElemEntry.PrjBlgElmEntrCanclnSrceCode,
      ZI_CLP_CustProjBillElemEntry.PrjBlgElmEntrCreatedByUser,
      ZI_CLP_CustProjBillElemEntry.PrjBlgElmEntrCreatedAtDteTme,
      ZI_CLP_CustProjBillElemEntry.PrjBlgElmEntrLastChgdByUser,
      ZI_CLP_CustProjBillElemEntry.PrjBlgElmEntrLastChgdAtDteTme,
      ZI_CLP_CustProjBillElemEntry.PrjBlgElmEntryLongText,
      ZI_CLP_CustProjBillElemEntry.ProjectBillingElementEntryDesc,
      ZI_CLP_CustProjBillElemEntry.ProjBillgTransfCostQtyCode,
      ZI_CLP_CustProjBillElemEntry.ProjBillgItmValIsNotActualCost,
      ZI_CLP_CustProjBillElemEntry.ProjBillgElementEntryObject,
      ZI_CLP_CustProjBillElemEntry.PostingDate,
      ZI_CLP_CustProjBillElemEntry.ProjectInternalID,
      ZI_CLP_CustProjBillElemEntry.Project,
      ZI_CLP_CustProjBillElemEntry.ProjectExternalID,
      ZI_CLP_CustProjBillElemEntry.ProjectID,
      ZI_CLP_CustProjBillElemEntry.ProjectDescription,
      ZI_CLP_CustProjBillElemEntry.WBSDescription,
      ZI_CLP_CustProjBillElemEntry.WBSElementExternalID,
      ZI_CLP_CustProjBillElemEntry.ProjBillgElmntEntrItmUUID_1,
      ZI_CLP_CustProjBillElemEntry.ReferenceDocument,
      ZI_CLP_CustProjBillElemEntry.ReversalReferenceDocument,
      ZI_CLP_CustProjBillElemEntry.AccountingDocument,
      ZI_CLP_CustProjBillElemEntry.LedgerGLLineItem,
      ZI_CLP_CustProjBillElemEntry.BillingPlan,
      ZI_CLP_CustProjBillElemEntry.BillingPlanItem,
      ZI_CLP_CustProjBillElemEntry.ProjectElementUUID,
      ZI_CLP_CustProjBillElemEntry.SalesDocument,
      ZI_CLP_CustProjBillElemEntry.SalesDocumentItem,
      ZI_CLP_CustProjBillElemEntry.BillingWBSElementInternalID,
      ZI_CLP_CustProjBillElemEntry.SDDocumentCategory,
      ZI_CLP_CustProjBillElemEntry.Ledger,
      ZI_CLP_CustProjBillElemEntry._PrjBlgElmEntrJrnlEntrLink._GLAccountLineItemRawData._SemTagGLAccount.SemanticTag as SemanticTag,
      ZI_CLP_CustProjBillElemEntry.CompanyCode,
      ZI_CLP_CustProjBillElemEntry.FiscalYear,
      ZI_CLP_CustProjBillElemEntry.ReferenceDocument_1,
      ZI_CLP_CustProjBillElemEntry.AssignmentReference,      
      ZI_CLP_CustProjBillElemEntry.YY1_ZAllocationKey_COB,
      ZI_CLP_CustProjBillElemEntry.WorkItem,
      ZI_CLP_CustProjBillElemEntry.WorkPackage,
      ZI_CLP_CustProjBillElemEntry.BillToParty,
      ZI_CLP_CustProjBillElemEntry.ShipToParty,
      ZI_CLP_CustProjBillElemEntry.PersonnelNumber,
      _PersonWorkAgrmtToExternalID.PersonWorkAgreementExternalID,
      ZI_CLP_CustProjBillElemEntry.DocumentDate,
      _ProjectDetails.EngPartnerBP,
      /* Associations */
      ZI_CLP_CustProjBillElemEntry._AccountingDocument,
      ZI_CLP_CustProjBillElemEntry._CompanyCode,
      ZI_CLP_CustProjBillElemEntry._DocumentCurrency,
      ZI_CLP_CustProjBillElemEntry._DocumentCurrencyText,
      ZI_CLP_CustProjBillElemEntry._FiscalYear,
      ZI_CLP_CustProjBillElemEntry._GlobalCurrency,
      ZI_CLP_CustProjBillElemEntry._GlobalCurrencyText,
      ZI_CLP_CustProjBillElemEntry._Material,
      ZI_CLP_CustProjBillElemEntry._PrjBillgTransfCostQtyCodeTxt,
      ZI_CLP_CustProjBillElemEntry._PrjBlgElmEntrBillgPlnLink,
      ZI_CLP_CustProjBillElemEntry._PrjBlgElmEntrCanclnSrcCdText,
      ZI_CLP_CustProjBillElemEntry._PrjBlgElmEntrCanclnSrceCode,
      ZI_CLP_CustProjBillElemEntry._PrjBlgElmEntrJrnlEntrLink,
      ZI_CLP_CustProjBillElemEntry._PrjBlgElmEntrSrceTypeText,
      ZI_CLP_CustProjBillElemEntry._ProjBillgElmntEntrSourceType,
      ZI_CLP_CustProjBillElemEntry._ProjBillgTransfCostQtyCode,
      ZI_CLP_CustProjBillElemEntry._ProjectBillingElement,
      ZI_CLP_CustProjBillElemEntry._ProjectBillingElementEntrFlw,
      ZI_CLP_CustProjBillElemEntry._ProjectCurrency,
      ZI_CLP_CustProjBillElemEntry._ProjectCurrencyText,
      ZI_CLP_CustProjBillElemEntry._QuantityUnit,
      ZI_CLP_CustProjBillElemEntry._Text,
      ZI_CLP_CustProjBillElemEntry._TransactionCurrency,
      ZI_CLP_CustProjBillElemEntry._TransactionCurrencyText,
      ZI_CLP_CustProjBillElemEntry._WBSElement,
      ZI_CLP_CustProjBillElemEntry._Workpackage
}where ZI_CLP_JEToExcludeExpenses.IsReferenced is null
