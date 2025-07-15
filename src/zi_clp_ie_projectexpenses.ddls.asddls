@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Expenses for Invoice Editor Project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IE_ProjectExpenses
  as select from ZI_CLP_ProjectExpenses as _ProjectExpenses
  left outer join ZI_CLP_IE_MarkedWIP as _MarkedWIP
    on _MarkedWIP.Projbillgelmntentritmuuid = _ProjectExpenses.ProjBillgElmntEntrItmUUID
  association to parent ZI_CLP_IE_Project as _Project
    on _Project.ProjectID = $projection.ProjectID
    
  association[0..1] to ZI_CLP_BPPersonExtID as _BPPersonExtID on _BPPersonExtID.PersonWorkAgreementExternalID = $projection.PersonWorkAgreementExternalID
{
  key _ProjectExpenses.ProjBillgElmntEntrItmUUID,
      _ProjectExpenses.ProjectBillingElementUUID,
      _ProjectExpenses.ProjBillgElmntEntrSourceType,
      _ProjectExpenses.WBSElementInternalID,
      _ProjectExpenses.Material,
      _ProjectExpenses.QuantityUnit,
      _ProjectExpenses.ProjBillgElmntEntrIsCancelled,
      _ProjectExpenses.PricingDate,
      _ProjectExpenses.NetPriceAmountIsManual,
      _ProjectExpenses.TransactionCurrency,
      _ProjectExpenses.ProjectCurrency,
      _ProjectExpenses.GlobalCurrency,
      _ProjectExpenses.DocumentCurrency,
      _ProjectExpenses.ServicesRenderedDate,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      _ProjectExpenses.OriginalTotalQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectExpenses.OriginalAmountInTransacCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      _ProjectExpenses.OriginalAmountInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      _ProjectExpenses.OriginalAmountInGlobalCurrency,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      _ProjectExpenses.OpenQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectExpenses.OpenAmountInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      _ProjectExpenses.OpenAmountInProjectCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      _ProjectExpenses.OpenAmountInGlobalCurrency,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      _ProjectExpenses.ToBeBilledQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectExpenses.ToBeBilledAmtInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      _ProjectExpenses.ToBeBilledAmtInProjCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      _ProjectExpenses.ToBeBilledAmtInGlobCurrency,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      _ProjectExpenses.ToBeWrittenOffQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectExpenses.ToBeWrittenOffAmtInTransCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      _ProjectExpenses.ToBeWrittenOffAmtInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      _ProjectExpenses.ToBeWrittenOffAmtInGlobalCrcy,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      _ProjectExpenses.ToBePostponedQuantity,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectExpenses.ToBePostponedAmtInTransacCrcy,
      @Semantics.amount.currencyCode: 'ProjectCurrency'
      _ProjectExpenses.ToBePostponedAmtInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      _ProjectExpenses.ToBePostponedAmtInGlobalCrcy,

      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _ProjectExpenses.BillableRevenueAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _ProjectExpenses.ManualNetPriceAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _ProjectExpenses.NetPriceAmountInDocCrcy,
      @Semantics.quantity.unitOfMeasure: 'NetPriceQuantityUnit'
      _ProjectExpenses.NetPriceQuantity,
      _ProjectExpenses.NetPriceQuantityUnit,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _ProjectExpenses.OriginalRevenueAmtInDocCrcy,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _ProjectExpenses.OpenRevenueAmtInDocCrcy,

      _ProjectExpenses.ProjBillgElmntEntrIsReversed,
      _ProjectExpenses.ProjBillgElmntEntrIsReversal,
      _ProjectExpenses.PrjBlgElmEntrCanclnSrceCode,
      _ProjectExpenses.PrjBlgElmEntrCreatedByUser,
      _ProjectExpenses.PrjBlgElmEntrCreatedAtDteTme,
      _ProjectExpenses.PrjBlgElmEntrLastChgdByUser,
      _ProjectExpenses.PrjBlgElmEntrLastChgdAtDteTme,
      _ProjectExpenses.PrjBlgElmEntryLongText,
      _ProjectExpenses.ProjectBillingElementEntryDesc,
      _ProjectExpenses.ProjBillgTransfCostQtyCode,
      _ProjectExpenses.ProjBillgItmValIsNotActualCost,
      _ProjectExpenses.ProjBillgElementEntryObject,
      _ProjectExpenses.PostingDate,

      _ProjectExpenses.ProjectInternalID,
      _ProjectExpenses.Project,
      _ProjectExpenses.ProjectExternalID,
      _ProjectExpenses.ProjectID,
      _ProjectExpenses.ProjectDescription,
      _ProjectExpenses.WBSDescription,
      _ProjectExpenses.WBSElementExternalID,

      _ProjectExpenses.ProjBillgElmntEntrItmUUID_1,
      _ProjectExpenses.ReferenceDocument,
      _ProjectExpenses.ReversalReferenceDocument,
      _ProjectExpenses.AccountingDocument,
      _ProjectExpenses.LedgerGLLineItem,
      _ProjectExpenses.BillingPlan,
      _ProjectExpenses.BillingPlanItem,
      _ProjectExpenses.ProjectElementUUID,
      _ProjectExpenses.SalesDocument,
      _ProjectExpenses.SalesDocumentItem,
      _ProjectExpenses.BillingWBSElementInternalID,
      _ProjectExpenses.SDDocumentCategory,
      _ProjectExpenses.Ledger,
      _ProjectExpenses.SemanticTag,
      _ProjectExpenses.CompanyCode,
      _ProjectExpenses.FiscalYear,
      _ProjectExpenses.ReferenceDocument_1,
      _ProjectExpenses.AssignmentReference,      
      _ProjectExpenses.YY1_ZAllocationKey_COB,
      _ProjectExpenses.WorkItem,
      _ProjectExpenses.WorkPackage,
      _ProjectExpenses.BillToParty,
      _ProjectExpenses.ShipToParty,
      _ProjectExpenses.PersonnelNumber,
      _ProjectExpenses.PersonWorkAgreementExternalID,
      _ProjectExpenses.DocumentDate,
      _ProjectExpenses.EngPartnerBP,
      _BPPersonExtID.EmailAddress,  
      _BPPersonExtID.PersonFullName,  

      // Associations
      _ProjectExpenses._AccountingDocument,
      _ProjectExpenses._CompanyCode,
      _ProjectExpenses._DocumentCurrency,
      _ProjectExpenses._DocumentCurrencyText,
      _ProjectExpenses._FiscalYear,
      _ProjectExpenses._GlobalCurrency,
      _ProjectExpenses._GlobalCurrencyText,
      _ProjectExpenses._Material,
      _ProjectExpenses._PrjBillgTransfCostQtyCodeTxt,
      _ProjectExpenses._PrjBlgElmEntrBillgPlnLink,
      _ProjectExpenses._PrjBlgElmEntrCanclnSrcCdText,
      _ProjectExpenses._PrjBlgElmEntrCanclnSrceCode,
      _ProjectExpenses._PrjBlgElmEntrJrnlEntrLink,
      _ProjectExpenses._PrjBlgElmEntrSrceTypeText,
      _ProjectExpenses._ProjBillgElmntEntrSourceType,
      _ProjectExpenses._ProjBillgTransfCostQtyCode,
      _ProjectExpenses._ProjectBillingElement,
      _ProjectExpenses._ProjectBillingElementEntrFlw,
      _ProjectExpenses._ProjectCurrency,
      _ProjectExpenses._ProjectCurrencyText,
      _ProjectExpenses._QuantityUnit,
      _ProjectExpenses._Text,
      _ProjectExpenses._TransactionCurrency,
      _ProjectExpenses._TransactionCurrencyText,
      _ProjectExpenses._WBSElement,
      _ProjectExpenses._Workpackage,
      _Project
}
where _ProjectExpenses.SemanticTag = 'ZCLEXP'
and _ProjectExpenses.ProjBillgElmntEntrIsReversed = ''
and _ProjectExpenses.ProjBillgElmntEntrIsReversal = ''
and _ProjectExpenses.OpenRevenueAmtInDocCrcy != 0
and _MarkedWIP.Projbillgelmntentritmuuid is null
