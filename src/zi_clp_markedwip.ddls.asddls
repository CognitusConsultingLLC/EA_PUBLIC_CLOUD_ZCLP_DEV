@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'marked WIP for Project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_MarkedWIP 
  as select from ZI_CLP_WIPMARK_BASIC
  association [0..1] to ZI_CLP_CustProjBillElemEntry as _CustProjBillElemEntry on _CustProjBillElemEntry.ProjBillgElmntEntrItmUUID = $projection.Projbillgelmntentritmuuid
{
      @EndUserText.label: 'SAP UUID'
  key ZI_CLP_WIPMARK_BASIC.SapUuid,

      @EndUserText.label: 'Project Billing Element Entry Item UUID'
      ZI_CLP_WIPMARK_BASIC.Projbillgelmntentritmuuid,

      @EndUserText.label: 'Project Billing Element UUID'
      ZI_CLP_WIPMARK_BASIC.Projectbillingelementuuid,

      @EndUserText.label: 'WBS Element Internal ID'
      ZI_CLP_WIPMARK_BASIC.Wbselementinternalid,

      @EndUserText.label: 'Project ID'
      ZI_CLP_WIPMARK_BASIC.Project,

      @EndUserText.label: 'Project Billing Request UUID'
      ZI_CLP_WIPMARK_BASIC.Projectbillingrequestuuid,

      @EndUserText.label: 'Project Billing Request'
      ZI_CLP_WIPMARK_BASIC.Pbr,

      @EndUserText.label: 'Billing Document Request'
      ZI_CLP_WIPMARK_BASIC.Bdr,

      @EndUserText.label: 'Prelim Billing Document'
      ZI_CLP_WIPMARK_BASIC.Pbd,

      @EndUserText.label: 'Invoice Number'
      ZI_CLP_WIPMARK_BASIC.Invoice,

      @EndUserText.label: 'Status'
      ZI_CLP_WIPMARK_BASIC.Status,

      @EndUserText.label: 'Project ID'
      _CustProjBillElemEntry.ProjectID,

      @EndUserText.label: 'Project Billing Element Entry Source Type'
      _CustProjBillElemEntry.ProjBillgElmntEntrSourceType,

      @EndUserText.label: 'Material'
      _CustProjBillElemEntry.Material,

      @EndUserText.label: 'Quantity Unit'
      _CustProjBillElemEntry.QuantityUnit,

      @EndUserText.label: 'Is Project Billing Element Entry Cancelled'
      _CustProjBillElemEntry.ProjBillgElmntEntrIsCancelled,

      @EndUserText.label: 'Pricing Date'
      _CustProjBillElemEntry.PricingDate,

      @EndUserText.label: 'Net Price Amount Is Manual'
      _CustProjBillElemEntry.NetPriceAmountIsManual,

      @EndUserText.label: 'Transaction Currency'
      _CustProjBillElemEntry.TransactionCurrency,

      @EndUserText.label: 'Project Currency'
      _CustProjBillElemEntry.ProjectCurrency,

      @EndUserText.label: 'Global Currency'
      _CustProjBillElemEntry.GlobalCurrency,

      @EndUserText.label: 'Document Currency'
      _CustProjBillElemEntry.DocumentCurrency,

      @EndUserText.label: 'Services Rendered Date'
      _CustProjBillElemEntry.ServicesRenderedDate,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      @EndUserText.label: 'Original Total Quantity'
      _CustProjBillElemEntry.OriginalTotalQuantity,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Original Amount in Transaction Currency'
      _CustProjBillElemEntry.OriginalAmountInTransacCrcy,

      @Semantics.amount.currencyCode: 'ProjectCurrency'
      @EndUserText.label: 'Original Amount in Project Currency'
      _CustProjBillElemEntry.OriginalAmountInProjectCrcy,

      @Semantics.amount.currencyCode: 'GlobalCurrency'
      @EndUserText.label: 'Original Amount in Global Currency'
      _CustProjBillElemEntry.OriginalAmountInGlobalCurrency,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      @EndUserText.label: 'Open Quantity'
      _CustProjBillElemEntry.OpenQuantity,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Open Amount in Transaction Currency'
      _CustProjBillElemEntry.OpenAmountInTransCrcy,

      @Semantics.amount.currencyCode: 'ProjectCurrency'
      @EndUserText.label: 'Open Amount in Project Currency'
      _CustProjBillElemEntry.OpenAmountInProjectCurrency,

      @Semantics.amount.currencyCode: 'GlobalCurrency'
      @EndUserText.label: 'Open Amount in Global Currency'
      _CustProjBillElemEntry.OpenAmountInGlobalCurrency,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      @EndUserText.label: 'To Be Billed Quantity'
      _CustProjBillElemEntry.ToBeBilledQuantity,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'To Be Billed Amount in Transaction Currency'
      _CustProjBillElemEntry.ToBeBilledAmtInTransCrcy,

      @Semantics.amount.currencyCode: 'ProjectCurrency'
      @EndUserText.label: 'To Be Billed Amount in Project Currency'
      _CustProjBillElemEntry.ToBeBilledAmtInProjCurrency,

      @Semantics.amount.currencyCode: 'GlobalCurrency'
      @EndUserText.label: 'To Be Billed Amount in Global Currency'
      _CustProjBillElemEntry.ToBeBilledAmtInGlobCurrency,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      @EndUserText.label: 'To Be Written Off Quantity'
      _CustProjBillElemEntry.ToBeWrittenOffQuantity,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'To Be Written Off Amount in Transaction Currency'
      _CustProjBillElemEntry.ToBeWrittenOffAmtInTransCrcy,

      @Semantics.amount.currencyCode: 'ProjectCurrency'
      @EndUserText.label: 'To Be Written Off Amount in Project Currency'
      _CustProjBillElemEntry.ToBeWrittenOffAmtInProjectCrcy,

      @Semantics.amount.currencyCode: 'GlobalCurrency'
      @EndUserText.label: 'To Be Written Off Amount in Global Currency'
      _CustProjBillElemEntry.ToBeWrittenOffAmtInGlobalCrcy,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      @EndUserText.label: 'To Be Postponed Quantity'
      _CustProjBillElemEntry.ToBePostponedQuantity,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'To Be Postponed Amount in Transaction Currency'
      _CustProjBillElemEntry.ToBePostponedAmtInTransacCrcy,

      @Semantics.amount.currencyCode: 'ProjectCurrency'
      @EndUserText.label: 'To Be Postponed Amount in Project Currency'
      _CustProjBillElemEntry.ToBePostponedAmtInProjectCrcy,

      @Semantics.amount.currencyCode: 'GlobalCurrency'
      @EndUserText.label: 'To Be Postponed Amount in Global Currency'
      _CustProjBillElemEntry.ToBePostponedAmtInGlobalCrcy,

      @Semantics.amount.currencyCode: 'DocumentCurrency'
      @EndUserText.label: 'Billable Revenue Amount in Document Currency'
      _CustProjBillElemEntry.BillableRevenueAmtInDocCrcy,

      @Semantics.amount.currencyCode: 'DocumentCurrency'
      @EndUserText.label: 'Manual Net Price Amount in Document Currency'
      _CustProjBillElemEntry.ManualNetPriceAmtInDocCrcy,

      @Semantics.amount.currencyCode: 'DocumentCurrency'
      @EndUserText.label: 'Net Price Amount in Document Currency'
      _CustProjBillElemEntry.NetPriceAmountInDocCrcy,

      @Semantics.quantity.unitOfMeasure: 'NetPriceQuantityUnit'
      @EndUserText.label: 'Net Price Quantity'
      _CustProjBillElemEntry.NetPriceQuantity,

      @EndUserText.label: 'Net Price Quantity Unit'
      _CustProjBillElemEntry.NetPriceQuantityUnit,

      @Semantics.amount.currencyCode: 'DocumentCurrency'
      @EndUserText.label: 'Original Revenue Amount in Document Currency'
      _CustProjBillElemEntry.OriginalRevenueAmtInDocCrcy,

      @Semantics.amount.currencyCode: 'DocumentCurrency'
      @EndUserText.label: 'Open Revenue Amount in Document Currency'
      _CustProjBillElemEntry.OpenRevenueAmtInDocCrcy,

      @EndUserText.label: 'Project Billing Element Entry Is Reversed'
      _CustProjBillElemEntry.ProjBillgElmntEntrIsReversed,

      @EndUserText.label: 'Project Billing Element Entry Is Reversal'
      _CustProjBillElemEntry.ProjBillgElmntEntrIsReversal,

      @EndUserText.label: 'Cancellation Source Code'
      _CustProjBillElemEntry.PrjBlgElmEntrCanclnSrceCode,

      @EndUserText.label: 'Created By User'
      _CustProjBillElemEntry.PrjBlgElmEntrCreatedByUser,

      @EndUserText.label: 'Created At Date Time'
      _CustProjBillElemEntry.PrjBlgElmEntrCreatedAtDteTme,

      @EndUserText.label: 'Last Changed By User'
      _CustProjBillElemEntry.PrjBlgElmEntrLastChgdByUser,

      @EndUserText.label: 'Last Changed At Date Time'
      _CustProjBillElemEntry.PrjBlgElmEntrLastChgdAtDteTme,

      @EndUserText.label: 'Project Billing Element Entry Long Text'
      _CustProjBillElemEntry.PrjBlgElmEntryLongText,

      @EndUserText.label: 'Project Billing Element Entry Description'
      _CustProjBillElemEntry.ProjectBillingElementEntryDesc,

      @EndUserText.label: 'Transferred Cost Quantity Code'
      _CustProjBillElemEntry.ProjBillgTransfCostQtyCode,

      @EndUserText.label: 'Item Value Is Not Actual Cost'
      _CustProjBillElemEntry.ProjBillgItmValIsNotActualCost,

      @EndUserText.label: 'Project Billing Element Entry Object'
      _CustProjBillElemEntry.ProjBillgElementEntryObject,

      @EndUserText.label: 'Posting Date'
      _CustProjBillElemEntry.PostingDate,

      @EndUserText.label: 'Project Internal ID'
      _CustProjBillElemEntry.ProjectInternalID,

      @EndUserText.label: 'Project External ID'
      _CustProjBillElemEntry.ProjectExternalID,

      @EndUserText.label: 'Project Description'
      _CustProjBillElemEntry.ProjectDescription,

      @EndUserText.label: 'WBS Description'
      _CustProjBillElemEntry.WBSDescription,

      @EndUserText.label: 'WBS Element External ID'
      _CustProjBillElemEntry.WBSElementExternalID,

      @EndUserText.label: 'Project Billing Element Entry Item UUID'
      _CustProjBillElemEntry.ProjBillgElmntEntrItmUUID_1,

      @EndUserText.label: 'Reference Document'
      _CustProjBillElemEntry.ReferenceDocument,

      @EndUserText.label: 'Reversal Reference Document'
      _CustProjBillElemEntry.ReversalReferenceDocument,

      @EndUserText.label: 'Accounting Document'
      _CustProjBillElemEntry.AccountingDocument,

      @EndUserText.label: 'Ledger GL Line Item'
      _CustProjBillElemEntry.LedgerGLLineItem,

      @EndUserText.label: 'Billing Plan'
      _CustProjBillElemEntry.BillingPlan,

      @EndUserText.label: 'Billing Plan Item'
      _CustProjBillElemEntry.BillingPlanItem,

      @EndUserText.label: 'Project Element UUID'
      _CustProjBillElemEntry.ProjectElementUUID,

      @EndUserText.label: 'Sales Document'
      _CustProjBillElemEntry.SalesDocument,

      @EndUserText.label: 'Sales Document Item'
      _CustProjBillElemEntry.SalesDocumentItem,

      @EndUserText.label: 'Billing WBS Element Internal ID'
      _CustProjBillElemEntry.BillingWBSElementInternalID,

      @EndUserText.label: 'SD Document Category'
      _CustProjBillElemEntry.SDDocumentCategory,

      @EndUserText.label: 'Ledger'
      _CustProjBillElemEntry.Ledger,

      @EndUserText.label: 'Company Code'
      _CustProjBillElemEntry.CompanyCode,

      @EndUserText.label: 'Fiscal Year'
      _CustProjBillElemEntry.FiscalYear,

      @EndUserText.label: 'Reference Document (GL Line Item)'
      _CustProjBillElemEntry.ReferenceDocument_1,

      @EndUserText.label: 'Work Item'
      _CustProjBillElemEntry.WorkItem,

      @EndUserText.label: 'Work Package'
      _CustProjBillElemEntry.WorkPackage,

      @EndUserText.label: 'Bill-To Party'
      _CustProjBillElemEntry.BillToParty,

      @EndUserText.label: 'Ship-To Party'
      _CustProjBillElemEntry.ShipToParty,

      @EndUserText.label: 'Personnel Number'
      _CustProjBillElemEntry.PersonnelNumber,

      @EndUserText.label: 'Document Date'
      _CustProjBillElemEntry.DocumentDate,
      
      _CustProjBillElemEntry.PersonFullName,
      _CustProjBillElemEntry.ProductName,

      @EndUserText.label: 'Accounting Document (Reversal Link)'
      _CustProjBillElemEntry._AccountingDocument,

      @EndUserText.label: 'SD Document Category Text'
      _CustProjBillElemEntry._Text,

      @EndUserText.label: 'Company Code (Link)'
      _CustProjBillElemEntry._CompanyCode,

      @EndUserText.label: 'Fiscal Year (Link)'
      _CustProjBillElemEntry._FiscalYear,

      _CustProjBillElemEntry._DocumentCurrency,
      _CustProjBillElemEntry._DocumentCurrencyText,
      _CustProjBillElemEntry._GlobalCurrency,
      _CustProjBillElemEntry._GlobalCurrencyText,
      _CustProjBillElemEntry._Material,
      _CustProjBillElemEntry._PrjBillgTransfCostQtyCodeTxt,
      _CustProjBillElemEntry._PrjBlgElmEntrCanclnSrcCdText,
      _CustProjBillElemEntry._PrjBlgElmEntrCanclnSrceCode,
      _CustProjBillElemEntry._PrjBlgElmEntrSrceTypeText,
      _CustProjBillElemEntry._ProjBillgElmntEntrSourceType,
      _CustProjBillElemEntry._ProjBillgTransfCostQtyCode,
      _CustProjBillElemEntry._ProjectCurrency,
      _CustProjBillElemEntry._ProjectCurrencyText,
      _CustProjBillElemEntry._QuantityUnit,
      _CustProjBillElemEntry._TransactionCurrency,
      _CustProjBillElemEntry._TransactionCurrencyText,
      _CustProjBillElemEntry


}
